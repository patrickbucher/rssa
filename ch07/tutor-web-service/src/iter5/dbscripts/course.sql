drop table if exists ezy_course_c5;
create table ezy_course_c5 (
    course_id serial primary key,
    tutor_id int not null,
    course_name varchar(140) not null,
    posted_time timestamp default now()
);
insert into ezy_course_c5 (course_id, tutor_id, course_name, posted_time)
values (1, 1, 'First course', '2020-12-17 05:40:00');
insert into ezy_course_c5 (course_id, tutor_id, course_name, posted_time)
values (2, 1, 'Second course', '2020-12-18 05:45:00');

drop table if exists ezy_course_c6;

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
    posted_time timestamp default now()
);

insert into ezy_course_c6 (course_id, tutor_id, course_name, posted_time)
values (1, 1, 'First course', '2020-12-17 05:40:00');
insert into ezy_course_c6 (course_id, tutor_id, course_name, posted_time)
values (2, 1, 'Second course', '2020-12-18 05:45:00');
