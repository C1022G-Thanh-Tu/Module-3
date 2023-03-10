use furama_database;

-- Câu 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem 
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond'
and kh.dia_chi like '% Vinh'
or kh.dia_chi like '% Quảng Ngãi';

-- Câu 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), 
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu,
sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2020 
and month(hd.ngay_lam_hop_dong) > 9
and hd.ma_hop_dong not in (
	select hd.ma_hop_dong from hop_dong hd
    where year(hd.ngay_lam_hop_dong) = 2021
    and month(hd.ngay_lam_hop_dong) < 7
)
group by hd.ma_hop_dong
order by hd.ma_hop_dong;

-- Câu 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create view v_dich_vu_di_kem as
select sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem 
from hop_dong_chi_tiet
group by ma_dich_vu_di_kem;

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai, 
sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (select max(v_dich_vu_di_kem.so_luong_dich_vu_di_kem) from v_dich_vu_di_kem);

-- Câu 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select hd.ma_hop_dong, ldv.ten_loai_dich_vụ, dvdk.ten_dich_vu_di_kem, 
count(hdct.ma_hop_dong_chi_tiet) as so_lan_su_dung
from hop_dong hd
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung = 1
order by hd.ma_hop_dong;

-- Câu 15: Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, trd.ten_trinh_do, 
bph.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from hop_dong hd
join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join trinh_do trd on trd.ma_trinh_do = nv.ma_trinh_do
join bo_phan bph on bph.ma_bo_phan = nv.ma_bo_phan
group by hd.ma_nhan_vien
having count(hd.ma_hop_dong) < 4;