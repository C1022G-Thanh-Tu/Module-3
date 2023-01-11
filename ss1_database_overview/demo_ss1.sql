create database demo_ss1;
use demo_ss1;
-- Tạo bảng 
create table student (
	id int primary key,
    `name` varchar (45),
    score double
);

-- Đưa dữ liệu vào bảng student
insert into student (id, `name`, score) values (1, "Nguyễn Văn A", 9.2);

-- lấy dữ liệu ra xem 
select * from student;
-- select `name` "Tên", score "Điểm thi" from student;

-- sửa => khi sửa phải đặt một cờ an toàn = 0 => sau khi kết thúc cho cờ đó = 1
-- set sql_safe_updates = 0;
update student
set score = 5.6
where id = 1;
-- set sql_safe_updates = 1;

-- Thêm cột vào table
alter table student add `status` varchar (45);
update student
set status = "abc"
where id = 1;
insert into student (id, `name`, score, `status`) values (2, "Nguyễn Văn B", 7.8, "def");
update student
set `status` = "lol"
where id = 2;
drop database demo_ss1;