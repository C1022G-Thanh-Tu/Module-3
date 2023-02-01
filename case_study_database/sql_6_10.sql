use furama_database;

-- Câu 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vụ 
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where quarter(hd.ngay_ket_thuc) > 1 and year(hd.ngay_ket_thuc) = 2021
group by dv.ma_dich_vu;

-- Câu 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vụ
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (
	select hd.ma_dich_vu from hop_dong hd
    where year(hd.ngay_ket_thuc) = 2021
)
group by dv.ma_dich_vu;

-- Câu 8
-- Cách 1
select ho_ten from khach_hang
group by ho_ten;

-- Cách 2
select distinct ho_ten from khach_hang;

-- Cách 3
select t.ho_ten
from (select ho_ten, row_number() over (partition by ho_ten) as rownumber from khach_hang) t
where t.rownumber < 2;

-- Bài 9
select month(ngay_lam_hop_dong) as thang, count(ma_hop_dong) as so_luong_khach_hang 
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- Bài 10
select distinct hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem 
from hop_dong_chi_tiet hdct
right join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
group by ma_hop_dong;
