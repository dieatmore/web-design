create table if not exists `new`
(
    id int auto_increment primary key,
    name varchar(100) not null,
    content varchar(10000) not null ,
    image_path longblob null,
    insert_time datetime not null default  current_timestamp,
    update_time datetime not null default  current_timestamp on update current_timestamp
);

create table if not exists `notice`
(
    id int auto_increment primary key,
    name varchar(100) not null,
    content varchar(10000) not null ,
    insert_time datetime not null default  current_timestamp,
    update_time datetime not null default  current_timestamp on update current_timestamp
);