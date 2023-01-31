use furama_database;

select ma_nhan_vien , ho_ten from nhan_vien 
where 
(substring_index(ho_ten, ' ', -1) like 'H%'
or substring_index(ho_ten, ' ', -1) like 'K%'
or substring_index(ho_ten, ' ', -1) like 'T%')
and length(ho_ten) <= 15;

select khach_hang.ma_khach_hang, ho_ten, ngay_sinh, dia_chi from khach_hang 
where 
(year(curdate()) - year(ngay_sinh)) between 18 and 50
and dia_chi like '%Đà Nẵng'
or dia_chi like '%Quảng Trị';

select khach_hang.ma_khach_hang , khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as 'Số lần đặt phòng'
from khach_hang 
inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
inner join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach = 'Diamond'
group by hop_dong.ma_khach_hang
order by count(hop_dong.ma_khach_hang);

set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  lk.ten_loai_khach, 
  hd.ma_hop_dong, 
  dv.ten_dich_vu, 
  hd.ngay_lam_hop_dong, 
  hd.ngay_ket_thuc, 
  sum(
    ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)
  ) tong_tien 
from 
  khach_hang kh 
  inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach 
  left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang 
  left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
  left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong 
  left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by 
  kh.ma_khach_hang, 
  hd.ma_hop_dong 
order by 
  kh.ma_khach_hang;
