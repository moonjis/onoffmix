create table joinRoom(
join_num int primary key auto_increment,
id varchar(50),
room_num int,
foreign key (id) references member(id),
foreign key (room_num) references room(room_num)
);