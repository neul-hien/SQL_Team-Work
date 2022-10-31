USE QLBLT
GO
--================================================
-- THUONG HIEU --
INSERT INTO THUONGHIEU
VALUES
(   '', -- MATH - varchar(2)
    N'' -- TENTH - nvarchar(100)
)
--================================================
-- NHA CUNG CAP --
INSERT INTO NHACUNGCAP
VALUES
(   '',  -- MANCC - varchar(8)
    N'', -- TENNCC - nvarchar(100)
    N'', -- DIACHI - nvarchar(200)
    '',  -- DIENTHOAI - varchar(20)
    ''   -- EMAIL - varchar(50)
)
--================================================
-- MAT HANG --
INSERT INTO MATHANG
VALUES
(   '',   -- MAMH - varchar(8)
    '',   -- TENMH - varchar(100)
    '',   -- MANCC - varchar(5)
    '',   -- MATH - varchar(5)
    NULL, -- SOLUONG - numeric(3, 0)
    NULL, -- GIAHANG - money
    N''   -- THONGSOKT - nvarchar(300)
)
--================================================
-- KHACH HANG
INSERT INTO KHACHHANG
VALUES
(   '',  -- MAKH - varchar(6)
    N'', -- HO_DEM - nvarchar(100)
    N'', -- TEN - nvarchar(20)
    N'', -- GIOITINH - nvarchar(5)
    N'', -- DIACHIKH - nvarchar(200)
    '',  -- DIENTHOAIKH - varchar(20)
    ''   -- EMAIL - varchar(100)
)
--================================================
-- NHAN VIEN --
INSERT INTO NHANVIEN
VALUES
(   '',        -- MANV - varchar(6)
    N'',       -- HO_DEM - nvarchar(100)
    N'',       -- TEN - nvarchar(20)
    N'',       -- GIOITINH - nvarchar(5)
    '', -- NGAYSINH - date
    '', -- NGAYLAMVIEC - date
    N'',       -- DIACHI - nvarchar(200)
    '',        -- DIENTHOAINV - varchar(20)
    '',        -- EMAIL - varchar(100)
    NULL,      -- LUONG_CO_BAN - money
    NULL       -- PHUCAP - money
    )
--================================================
--HOA DON --
INSERT INTO HOADON
VALUES
(   '',        -- MAHD - varchar(6)
    '',        -- MANV - varchar(6)
    '',        -- MAKH - varchar(6)
    GETDATE(), -- NGAYXUATHD - date
    NULL,      -- SOLUONG - numeric(3, 0)
    NULL       -- TONGTIEN - money
)
--================================================
--CHI TIET HOA DON--
INSERT INTO CHITIETHOADON
VALUES
(   '',   -- MAHOADON - varchar(6)
    '',   -- MAMH - varchar(8)
    NULL, -- GIABAN - numeric(10, 0)
    NULL  -- SOLUONG - numeric(3, 0)
)
--================================================
--PHIEU NHAP --
INSERT INTO PHIEUNHAP
VALUES
(   '',        -- MAPHIEUNHAP - varchar(6)
    '',        -- MANV - varchar(6)
    '',        -- MANCC - varchar(8)
    '', -- NGAYNHAP - date
    NULL       -- SOLUONG - numeric(3, 0)
)
--================================================
--CHI TIET PHIEU NHAP--
INSERT INTO PHIEUNHAP
VALUES
(   '',        -- MAPHIEUNHAP - varchar(6)
    '',        -- MANV - varchar(6)
    '',        -- MANCC - varchar(8)
    '', -- NGAYNHAP - date
    NULL       -- SOLUONG - numeric(3, 0)
)
--================================================
--PHIEUBH --
VALUES
(   '',        -- MAHD - varchar(6)
    '',        -- MAMH - varchar(8)
    '', -- NGAYBH - date
    '',        -- LIDOBH - varchar(500)
    '', -- NGAYNHANHANG - date
    ''  -- NGAYHENTRA - date
)
--================================================
