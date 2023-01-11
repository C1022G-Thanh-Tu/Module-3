use c1022g1_module_3;

-- Task 1
select student.id, student.name, student.birthday, student.gender, student.email,student.point, class.name, student.account
from student 
inner join class on student.class_id = class.id;

-- Task 2
select student.id, student.name, student.birthday, student.gender, student.email,student.point, class.name, student.account
from student 
left join class on student.class_id = class.id;

-- task 3
select * 
from student 
where `name` like '%hai' or `name` like '%huynh'; 

-- task 4
select `name`, `point`
from student
where `point` > 5;

-- task 5
select * 
from student
where `name` like "nguyen%";

-- task 6
select `point`, count(`point`) as tong_tung_loai_diem 
from student
group by `point`;

-- task 7
select `point`, count(`point`) as tong_diem_lon_hon_5
from student
where `point` > 5
group by `point`;

-- task 8
select `point`, count(`point`) as tong_diem_lon_hon_5
from student
where `point` > 5
group by `point`
having tong_diem_lon_hon_5 > 1;

-- task 9
select student.name as ten_hoc_vien, class.name as ten_lop
from student
inner join class on student.class_id = class.id 
where class.name = "c1121g1"
order by student.name;