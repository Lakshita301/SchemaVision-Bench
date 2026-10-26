-- Source: https://github.com/lamhp0113/banhang/blob/01d94e67eebbeda77a52c88677cad7af6d45d1cb/tmdt.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 5
-- Foreign keys added via ALTER TABLE:
CREATE TABLE chi_tiet_don_hangs (
    id int NOT NULL,
    id_hang_hoa int NOT NULL,
    gia int NOT NULL,
    so_luong int NOT NULL,
    id_don_hang int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE comment (
    id int NOT NULL,
    id_hang_hoa int NOT NULL,
    id_khach_hang int NOT NULL,
    noi_dung varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE don_hangs (
    id int NOT NULL,
    ten_khach_hang varchar(255) NOT NULL,
    so_dien_thoai varchar(10) NOT NULL,
    dia_chi varchar(255) NOT NULL,
    ngay_dat_hang date NOT NULL DEFAULT current_timestamp(),
    trang_thai int NOT NULL,
    tong_tien int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE failed_jobs (
    id NUMERIC NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload TEXT NOT NULL,
    exception TEXT NOT NULL,
    failed_at timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE hang_hoas (
    id int NOT NULL,
    ten_hang_hoa varchar(255) NOT NULL,
    name_search varchar(255) NOT NULL,
    gia int NOT NULL,
    so_luong_hang int NOT NULL,
    hinh varchar(255) NOT NULL,
    id_loai int NOT NULL,
    lvproduct varchar(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE khach_hang (
    id int NOT NULL,
    ten_khach_hang varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    so_dien_thoai varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE loai_hang_hoas (
    id int NOT NULL,
    ten_loai varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE tintuc (
    id int NOT NULL,
    tieude varchar(200) NOT NULL,
    noidung text NOT NULL,
    mota text NOT NULL,
    hinhanh varchar(200) NOT NULL
);

CREATE TABLE users (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    dia_chi varchar(255) NOT NULL,
    so_dien_thoai varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    email_verified_at timestamp NULL DEFAULT NULL,
    password varchar(255) NOT NULL,
    remember_token varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                          

ALTER TABLE chi_tiet_don_hangs
  ADD CONSTRAINT chi_tiet_don_hangs_ibfk_1 FOREIGN KEY (id_don_hang) REFERENCES don_hangs (id),
  ADD CONSTRAINT chi_tiet_don_hangs_ibfk_2 FOREIGN KEY (id_hang_hoa) REFERENCES hang_hoas (id);

ALTER TABLE comment
  ADD CONSTRAINT comment_ibfk_1 FOREIGN KEY (id_hang_hoa) REFERENCES hang_hoas (id),
  ADD CONSTRAINT comment_ibfk_2 FOREIGN KEY (id_khach_hang) REFERENCES khach_hang (id);

ALTER TABLE hang_hoas
  ADD CONSTRAINT hang_hoas_ibfk_1 FOREIGN KEY (id_loai) REFERENCES loai_hang_hoas (id);
