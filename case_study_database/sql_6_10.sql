use furama_database;

-- Câu 6: Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại 
-- dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, 
dv.chi_phi_thue, ldv.ten_loai_dich_vụ 
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where quarter(hd.ngay_lam_hop_dong) <> 1 
and year(hd.ngay_lam_hop_dong) = 2021
group by dv.ma_dich_vu;

-- Câu 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, 
dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vụ
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (
	select hd.ma_dich_vu from hop_dong hd
    where year(hd.ngay_lam_hop_dong) = 2021
)
group by dv.ma_dich_vu;

-- Câu 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- Cách 1
select ho_ten from khach_hang
group by ho_ten;

-- Cách 2
select distinct ho_ten from khach_hang;

-- Cách 3
select t.ho_ten
from (select ho_ten, row_number() over (partition by ho_ten) as rownumber from khach_hang) t
where t.rownumber < 2;

-- Bài 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang, 
count(ma_hop_dong) as so_luong_khach_hang 
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- Bài 10: Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select distinct hd.ma_hop_dong, hd.ngay_lam_hop_dong, 
hd.ngay_ket_thuc, hd.tien_dat_coc, 
sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem 
from hop_dong_chi_tiet hdct
right join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
group by ma_hop_dong;
