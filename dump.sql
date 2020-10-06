create table user
(
    id         int auto_increment
        primary key,
    login      varchar(255) not null,
    e_mail     varchar(255) not null,
    name_first varchar(255) not null,
    name_last  varchar(255) null
);

create table file
(
    id      int auto_increment
        primary key,
    name    varchar(255) not null,
    type    varchar(255) not null,
    path    varchar(255) not null,
    user_id int          not null,
    constraint file_ibfk_1
        foreign key (user_id) references user (id)
);

create index user_id
    on file (user_id);

create table post
(
    id      int auto_increment
        primary key,
    title   varchar(255) not null,
    `desc`  varchar(255) not null,
    section varchar(255) not null,
    user_id int          not null,
    constraint post_ibfk_1
        foreign key (user_id) references user (id)
);

create index user_id
    on post (user_id);

create table post_file
(
    id      int auto_increment
        primary key,
    post_id int not null,
    file_id int not null,
    constraint post_file_ibfk_1
        foreign key (post_id) references post (id)
);

create index post_id
    on post_file (post_id);

create table post_href
(
    id      int auto_increment
        primary key,
    value   varchar(255) not null,
    post_id int          not null,
    constraint post_href_ibfk_1
        foreign key (post_id) references post (id)
);

create index post_id
    on post_href (post_id);

create table user_geo_coordinate
(
    id      int auto_increment
        primary key,
    value   varchar(255) not null,
    user_id int          not null,
    constraint user_geo_coordinate_ibfk_1
        foreign key (user_id) references user (id)
);

create index user_id
    on user_geo_coordinate (user_id);


