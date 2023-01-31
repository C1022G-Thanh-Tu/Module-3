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

-- set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, 
-- dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, 
-- sum((dich_vu.chi_phi_thue + ifnull((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia), 0))) as 'Tổng tiền'
-- from hop_dong
-- left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
-- left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
-- left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
-- right join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
-- inner join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
-- group by hop_dong.ma_hop_dong, khach_hang.ma_khach_hang
-- order by khach_hang.ma_khach_hang;

