drop table if exists ezy_course_c6 cascade;
drop table if exists ezy_tutor_c6;

create table ezy_tutor_c6 (
    tutor_id serial primary key,
    tutor_name varchar(200) not null,
    tutor_pic_url varchar(200) not null,
    tutor_profile varchar(2000) not null
);

create table ezy_course_c6 (
    course_id serial primary key,
    tutor_id int not null,
    course_name varchar(140) not null,
    course_description varchar(2000),
    course_format varchar(30),
    course_structure varchar(200),
    course_duration varchar(30),
    course_price int,
    course_language varchar(30),
    course_level varchar(30),
    posted_time timestamp default now(),
    constraint fk_tutor
    foreign key (tutor_id)
    references ezy_tutor_c6 (tutor_id)
    on delete cascade
);

grant all privileges on table ezy_tutor_c6 to truuser;
grant all privileges on table ezy_course_c6 to truuser;
grant all privileges on all sequences in schema public to truuser;

insert into ezy_tutor_c6 (tutor_id, tutor_name, tutor_pic_url, tutor_profile)
values (1, 'Merlene', 'http://s3.amazon.aws.com/pic1', 'Merlene is an experienced finance professional');
insert into ezy_tutor_c6 (tutor_id, tutor_name, tutor_pic_url, tutor_profile)
values (2, 'Frank', 'http://s3.amazon.aws.com/pic2', 'Frank is an expert nuclear engineer');

insert into ezy_course_c6 (course_id, tutor_id, course_name, course_level, posted_time)
values (1, 1, 'First course', 'Beginner', '2021-04-12 05:40:00');
insert into ezy_course_c6 (course_id, tutor_id, course_name, course_level, posted_time)
values (2, 1, 'Second course', 'ebook', '2021-04-12 05:45:00');
