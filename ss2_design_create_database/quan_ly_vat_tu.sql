create database bai_tap_ss2;
use bai_tap_ss2;

create table nha_cung_cap (
	ma_nha_cung_cap int primary key,
    ten_nha_cung_cap varchar(45) not null,
    dia_chi varchar(45) not null
);
create table so_dien_thoai (
	so_dien_thoai varchar(45) primary key,
    ma_nha_cung_cap int not null,
    constraint fk_so_dien_thoai foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
);
create table don_dat_hang (
	so_dat_hang int primary key,
    ngay_dat_hang varchar(45) not null,
    ma_nha_cung_cap int not null,
    constraint fk_don_dat_hang foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
);
create table vat_tu (
	ma_vat_tu int primary key,
    ten_vat_tu varchar(45) not null
);
create table vat_tu_don_dat_hang (
	so_dat_hang int,
    ma_vat_tu int,
    primary key (so_dat_hang, ma_vat_tu),
    constraint vat_tu_don_dat_hang_so_dat_hang foreign key (so_dat_hang) references don_dat_hang (so_dat_hang),
    constraint vat_tu_don_dat_hang_ma_vat_tu foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);
create table phieu_nhap (
	so_phieu_nhap int primary key,
    ngay_nhap varchar(45) not null
);
create table phieu_nhap_vat_tu (
	don_gia_nhap varchar(45) not null,
    so_luong_nhap varchar(45) not null,
    so_phieu_nhap int,
    ma_vat_tu int,
    primary key (so_phieu_nhap, ma_vat_tu),
    constraint fk_phieu_nhap_vat_tu_so_phieu_nhap foreign key (so_phieu_nhap) references phieu_nhap (so_phieu_nhap),
    constraint fk_phieu_nhap_vat_ma_vat_tu foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);
create table phieu_xuat (
	so_phieu_xuat int primary key,
    ngay_xuat varchar(45) not null
);
create table phieu_xuat_vat_tu (
	don_gia_xuat varchar(45) not null,
    so_luong_xuat varchar(45) not null,
    so_phieu_xuat int,
    ma_vat_tu int,
    primary key (so_phieu_xuat, ma_vat_tu),
    constraint fk_phieu_xuat_vat_tu_so_phieu_xuat foreign key (so_phieu_xuat) references phieu_xuat (so_phieu_xuat),
    constraint fk_phieu_xuat_vat_tu_ma_vat_tu foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);
