use quan_ly_sinh_vien;

select * from student 
where student_name like 'h%';

select * from class
where month(start_date) = 12;

select * from `subject`
where credit > 2 and credit < 6;

set sql_safe_updates = 0;
update student
set class_id = 2
where student_name = 'hung';
set sql_safe_updates = 1;

select mark.mark, student.student_name, `subject`.sub_name 
from
mark
inner join student on mark.student_id = student.student_id
inner join `subject` on mark.sub_id = `subject`.sub_id
order by mark.mark desc, student_name;