use crate::errors::EzyTutorError;
use crate::models::course::*;
use sqlx::postgres::PgPool;

pub async fn get_courses_for_tutor_db(
    pool: &PgPool,
    tutor_id: i32,
) -> Result<Vec<Course>, EzyTutorError> {
    let course_rows = sqlx::query_as!(
        Course,
        "SELECT * FROM ezy_course_c6 WHERE tutor_id = $1",
        tutor_id
    )
    .fetch_all(pool)
    .await?;
    Ok(course_rows)
}

pub async fn get_course_details_db(
    pool: &PgPool,
    tutor_id: i32,
    course_id: i32,
) -> Result<Course, EzyTutorError> {
    let course_row = sqlx::query_as!(
        Course,
        "SELECT * FROM ezy_course_c6 WHERE tutor_id = $1 and course_id = $2",
        tutor_id,
        course_id
    )
    .fetch_optional(pool)
    .await?;
    if let Some(course) = course_row {
        Ok(course)
    } else {
        Err(EzyTutorError::NotFound("Course id not found".into()))
    }
}

pub async fn post_new_course_db(
    pool: &PgPool,
    new_course: CreateCourse,
) -> Result<Course, EzyTutorError> {
    let course_row = sqlx::query_as!(Course,
        "INSERT INTO ezy_course_c6 (tutor_id, course_name, course_description, course_duration, course_level, course_format, course_language, course_structure, course_price) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING tutor_id, course_id, course_name, course_description, course_duration, course_level, course_format, course_language, course_structure, course_price, posted_time",
        new_course.tutor_id, new_course.course_name, new_course.course_description, new_course.course_duration, new_course.course_level, new_course.course_format, new_course.course_level, new_course.course_format, new_course.course_language, new_course.course_structure, new_course.course_price).fetch_one(pool).await?;
    Ok(course_row)
}
