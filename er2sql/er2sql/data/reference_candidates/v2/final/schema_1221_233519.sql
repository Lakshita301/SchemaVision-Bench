-- Source: https://github.com/CuongTrinh1280/codegym/blob/f2c8b139e1d5d5b9e90cb14628dcbf28926731e0/cuong.amela.edu/src/codegym/MySQL/student_management.sql?raw=true
-- Tables detected: 4 | FK constraints: 3
-- Foreign keys added via ALTER TABLE:
CREATE TABLE HocSinh(
    MaHS VARCHAR(20) PRIMARY KEY,
    TenHS VARCHAR(50),
    NgaySinh TIMESTAMP,
    Lop VARCHAR(20),
    GT VARCHAR(20)
);

CREATE TABLE MonHoc(
    MaMH VARCHAR(20) PRIMARY KEY,
    TenMH VARCHAR(50)
);

CREATE TABLE BangDiem(
    MaHS VARCHAR(20),
    MaMH VARCHAR(20),
    DiemThi INT,
    NgayKT TIMESTAMP,
    PRIMARY KEY (MaHS, MaMH),
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

CREATE TABLE GiaoVien(
    MaGV VARCHAR(20) PRIMARY KEY,
    TenGV VARCHAR(20),
    SDT VARCHAR(10)
);


                         

ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);
