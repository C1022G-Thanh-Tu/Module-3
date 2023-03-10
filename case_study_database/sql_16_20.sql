use furama_database;

-- Câu 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from nhan_vien nv
where nv.ma_nhan_vien not in (
	select hd.ma_nhan_vien from hop_dong hd
    where year(hd.ngay_lam_hop_dong) between 2019 and 2021
);
select * from nhan_vien;

-- Câu 17: Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 1.000.000 VNĐ
create view v_tong_tien as
select kh.ma_khach_hang, lk.ten_loai_khach, 
sum(ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)) tong_tien
from khach_hang kh 
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Platinium' 
and year(ngay_lam_hop_dong) = 2021
group by lk.ma_loai_khach, kh.ma_khach_hang;

update khach_hang
set ma_loai_khach = 1
where ma_khach_hang = (select v_tong_tien.ma_khach_hang 
from v_tong_tien 
where v_tong_tien.tong_tien > '1000000' 
and ten_loai_khach = 'Platinium'); 

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach 
from khach_hang kh 
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach 
where kh.ho_ten = 'Nguyễn Tâm Đắc';

set sql_safe_updates = 0;
set sql_safe_updates = 1;

-- Câu 18: Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set foreign_key_checks = 0;
delete
from khach_hang kh 
where kh.ma_khach_hang in (
	select hop_dong.ma_khach_hang 
    from hop_dong 
    where year(hop_dong.ngay_lam_hop_dong) < 2021
  );
select kh.ma_khach_hang, kh.ho_ten 
from khach_hang kh;

-- Câu 19: Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem dvdk
set gia = gia*2
where dvdk.ma_dich_vu_di_kem in (
	select ma_dich_vu_di_kem 
    from hop_dong_chi_tiet hdct 
    where ma_hop_dong in 
    (select ma_hop_dong from hop_dong where year(ngay_lam_hop_dong) = 2020)
    group by hdct.ma_dich_vu_di_kem
	having sum(ifnull(hdct.so_luong,0)) > 10 
);

-- Câu 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from khach_hang
union all
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from nhan_vien;
