create table rooms
(
    id          integer generated always as identity
        primary key,
    room_number integer not null
        unique
);

alter table rooms
    owner to postgres;

create table promos
(
    id         integer generated always as identity
        primary key,
    promo_year integer not null,
    promo_name varchar not null
        unique
);

alter table promos
    owner to postgres;

create table courses
(
    id          integer generated always as identity
        primary key,
    course_name varchar(24) not null,
    gender      varchar(6)  not null,
    teacher     varchar(32) not null
);

alter table courses
    owner to postgres;

create table students
(
    id             integer generated always as identity
        primary key,
    gender         varchar(6)  not null,
    firstname      varchar(32) not null,
    lastname       varchar(32) not null,
    student_number varchar(16) not null
        unique,
    promo_id       integer     not null
        constraint fk_promo
            references promos
            on update cascade on delete cascade
);

alter table students
    owner to postgres;

create table plannings
(
    id         integer generated always as identity
        primary key,
    start_hour timestamp not null,
    end_hour   timestamp not null,
    room_id    integer   not null
        constraint fk_room
            references rooms
            on update cascade on delete cascade,
    course_id  integer   not null
        constraint fk_course
            references courses
            on update cascade on delete cascade,
    promo_id   integer   not null
        constraint fk_promo
            references promos
            on update cascade on delete cascade
);

alter table plannings
    owner to postgres;

create table presents
(
    id          integer generated always as identity
        primary key,
    is_present  boolean not null,
    planning_id integer not null
        constraint fk_planning
            references plannings
            on update cascade on delete cascade,
    student_id  integer not null
        constraint fk_student
            references students
            on update cascade on delete cascade
);

alter table presents
    owner to postgres;


