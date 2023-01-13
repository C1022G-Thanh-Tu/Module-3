use quan_ly_sinh_vien;
select 
  * 
from 
  `subject` 
where 
  credit = (
    select 
      max(credit) 
    from 
      `subject`
  );
select 
  `subject`.sub_name, 
  mark.mark 
from 
  `subject` 
  inner join mark on `subject`.sub_id = mark.sub_id 
where 
  mark.mark = (
    select 
      max(mark) 
    from 
      mark
  );
select 
  student.student_name as 'Học sinh', 
  avg(mark.mark) as 'Điểm trung bình' 
from 
  student 
  inner join mark on student.student_id = mark.student_id 
group by 
  student.student_id 
order by 
  'Điểm trung bình' desc;
