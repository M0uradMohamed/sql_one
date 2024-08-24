
create table actor(
act_id int primary key,
act_fname varchar(20),
act_lname varchar(20),
act_gender varchar(1),
)

create table director(
dir_id int primary key,
dir_fname varchar(20),
dir_lname varchar(20),
)

create table movie(
mov_id int primary key ,
mov_title varchar(50) ,
mov_year int ,
mov_time int ,
mov_lang varchar(50),
mov_dt_rel date ,
mov_rel_country varchar(5)
)

create table reviewer(
rev_id int primary key , 
rev_name varchar(20),
)

create table movie_direction(
dir_id int not null ,
mov_id int not null ,
foreign key (dir_id) REFERENCES director(dir_id),
foreign key (mov_id) references movie(mov_id)
)

create table movie_cast (
act_id int ,
mov_id int ,
role varchar not null,
foreign key (act_id) REFERENCES actor(act_id),
foreign key (mov_id) REFERENCES movie(mov_id),
)

create table genres(
gen_id int primary key ,
gen_title varchar(20) ,
)

create table movie_genres(
mov_id int,
gen_id int,
foreign key (mov_id) REFERENCES movie(mov_id),
foreign key (gen_id) REFERENCES genres(gen_id),
)

create table rating (
mov_id int,
rev_id int,
rev_stars int not null ,
num_o_rating int not null ,
foreign key (mov_id) REFERENCES movie(mov_id),
foreign key (rev_id) REFERENCES reviewer(rev_id),
)