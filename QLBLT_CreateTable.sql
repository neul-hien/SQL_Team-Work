CREATE DATABASE QLBLT;
GO
USE QLBLT;

/*==============================================================*/
/* TABLE: THUONGHIEU                                            */
/*==============================================================*/
CREATE TABLE THUONGHIEU 
(
   MATH                 VARCHAR(2)                     NOT NULL,
   TENTH                NVARCHAR(100)                  NOT NULL,
   CONSTRAINT PK_THUONGHIEU PRIMARY KEY(MATH)
) 
GO
/*==============================================================*/
/* TABLE: NHACUNGCAP                                            */
/*=============================================================*/
CREATE TABLE NHACUNGCAP 
(
   MANCC                VARCHAR(8)                     NOT NULL,
   TENNCC               NVARCHAR(100)                  NOT NULL,
   DIACHI               NVARCHAR(200)                  NOT NULL,
   DIENTHOAI            VARCHAR(20)                    NOT NULL,
   EMAIL                VARCHAR(50)                    NOT NULL,
   CONSTRAINT PK_NHACUNGCAP PRIMARY KEY(MANCC)
) 
GO
/*==============================================================*/
/* TABLE: MATHANG                                               */
/*==============================================================*/
CREATE TABLE MATHANG 
(
   MAMH                 VARCHAR(8)                     NOT NULL,
   TENMH                VARCHAR(100)                   NOT NULL,
   MANCC                VARCHAR(8)                     NOT NULL,
   MATH                 VARCHAR(2)                     NOT NULL,
   SOLUONG              NUMERIC(3,0)                   NOT NULL,
   GIAHANG              MONEY                          NOT NULL,
   THONGSOKT            NVARCHAR(300)                  NOT NULL,
   CONSTRAINT PK_MATHANG PRIMARY KEY (MAMH)
)
GO
/*==============================================================*/
/* ADD FORENIGN KEY IN TABLE MATHANG                            */
/*==============================================================*/
ALTER TABLE MATHANG
   ADD CONSTRAINT FK_MATHANG_REFERENCE_NHACUNGCAP FOREIGN KEY (MANCC)
      REFERENCES NHACUNGCAP (MANCC);
ALTER TABLE MATHANG
   ADD CONSTRAINT FK_MATHANG_REFERENCE_THUONGHIEU FOREIGN KEY (MATH)
      REFERENCES THUONGHIEU (MATH);

/*==============================================================*/
/* TABLE: KHACHHANG                                             */
/*==============================================================*/
CREATE TABLE KHACHHANG 
(
   MAKH                 VARCHAR(6)                     NOT NULL,
   HO_DEM               NVARCHAR(100)                  NOT NULL,
   TEN                  NVARCHAR(20)                   NOT NULL,
   GIOITINH             NVARCHAR(5)                    NOT NULL,
   DIACHIKH             NVARCHAR(200)                  NOT NULL,
   DIENTHOAIKH          VARCHAR(20)                    NOT NULL,
   EMAIL                VARCHAR(100)                   NOT NULL,
   CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
) 
GO
/*==============================================================*/
/* TABLE: NHANVIEN                                              */
/*==============================================================*/
CREATE TABLE NHANVIEN 
(
   MANV                 VARCHAR(6)                     NOT NULL,
   HO_DEM               NVARCHAR(100)                  NOT NULL,
   TEN                  NVARCHAR(20)                   NOT NULL,
   GIOITINH             NVARCHAR(5)                    NOT NULL,
   NGAYSINH             DATE                           NOT NULL,
   NGAYLAMVIEC          DATE                           NOT NULL,
   DIACHI               NVARCHAR(200)                  NOT NULL,
   DIENTHOAINV          VARCHAR(20)                    NULL,
   EMAIL                VARCHAR(100)                   NULL,
   LUONG_CO_BAN         MONEY			       NOT NULL,
   PHUCAP               MONEY		               NOT NULL,
   CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
)
GO
/*==============================================================*/
/* TABLE: HOADON                                                */
/*==============================================================*/
CREATE TABLE HOADON 
(
   MAHD                 VARCHAR(6)                     NOT NULL,
   MANV                 VARCHAR(6)                     NOT NULL,
   MAKH                 VARCHAR(6)                     NOT NULL,
   NGAYXUATHD           DATE                           NOT NULL,
   SOLUONG              NUMERIC(3,0)                   NOT NULL,
   TONGTIEN             MONEY                          NOT NULL,
   CONSTRAINT PK_HOADON PRIMARY KEY (MAHD)
)
GO
/*==============================================================*/
/* ADD FORENIGN KEY IN TABLE HOADON                             */
/*==============================================================*/
ALTER TABLE HOADON
   ADD CONSTRAINT FK_HOADON_REFERENCE_NHANVIEN FOREIGN KEY (MANV)
      REFERENCES NHANVIEN (MANV);
ALTER TABLE HOADON
   ADD CONSTRAINT FK_HOADON_REFERENCE_KHACHHANG FOREIGN KEY (MAKH)
      REFERENCES KHACHHANG (MAKH);
GO
/*==============================================================*/
/* TABLE: CHITIETHOADON                                         */
/*==============================================================*/
CREATE TABLE CHITIETHOADON 
(
   MAHOADON             VARCHAR(6)                     NOT NULL,
   MAMH                 VARCHAR(8)                     NOT NULL,
   GIABAN               NUMERIC(10,0)                  NOT NULL,
   SOLUONG              NUMERIC(3,0)                   NOT NULL
)

/*==============================================================*/
/* ADD FORENIGN KEY IN TABLE CHITIETHOADON                      */
/*==============================================================*/
ALTER TABLE CHITIETHOADON
   ADD CONSTRAINT FK_CHITIETHOADON_REFERENCE_HOADON FOREIGN KEY (MAHOADON) REFERENCES HOADON (MAHD);

ALTER TABLE CHITIETHOADON
   ADD CONSTRAINT FK_CHITIETHOADON_REFERENCE_MATHANG FOREIGN KEY (MAMH) REFERENCES MATHANG (MAMH);

ALTER TABLE dbo.CHITIETHOADON
	ADD CONSTRAINT PK_CHITIETHOADON PRIMARY KEY(MAHOADON, MAMH)
/*==============================================================*/
/* TABLE: PHIEUNHAP                                             */
/*==============================================================*/
CREATE TABLE PHIEUNHAP 
(
   MAPHIEUNHAP          VARCHAR(6)                     NOT NULL,
   MANV                 VARCHAR(6)                     NOT NULL,
   MANCC                VARCHAR(8)                     NOT NULL,
   NGAYNHAP             DATE                           NOT NULL,
   SOLUONG              NUMERIC(3,0)                   NOT NULL,
   CONSTRAINT PK_PHIEUNHAP PRIMARY KEY CLUSTERED (MAPHIEUNHAP)
)
GO
/*==============================================================*/
/* ADD FORENIGN KEY IN TABLE PHIEUNHAP                          */
/*==============================================================*/
ALTER TABLE PHIEUNHAP
   ADD CONSTRAINT FK_PHIEUNHAP_REFERENCE_NHANVIEN FOREIGN KEY (MANV)
      REFERENCES NHANVIEN (MANV);
ALTER TABLE PHIEUNHAP
   ADD CONSTRAINT FK_PHIEUNHAP_REFERENCE_NHACUNGCAP FOREIGN KEY (MANCC)
      REFERENCES NHACUNGCAP (MANCC);

/*==============================================================*/
/* TABLE: CHITIETPHIEUNHAP                                      */
/*==============================================================*/
CREATE TABLE CHITIETPHIEUNHAP 
(
   MAPHIEUNHAP          VARCHAR(6)                     NOT NULL,
   MAMH                 VARCHAR(8)                     NOT NULL,
   GIANHAP              NUMERIC(10,0)                  NOT NULL,
   SOLUONG              NUMERIC(3,0)                   NOT NULL,
   CONSTRAINT PK_CHITIETPHIEUNHAP PRIMARY KEY (MAPHIEUNHAP, MAMH)
)
GO
/*==============================================================*/
/* ADD FORENIGN KEY IN TABLE CHITIETPHIEUNHAP                   */
/*==============================================================*/
ALTER TABLE CHITIETPHIEUNHAP
   ADD CONSTRAINT FK_CHITIETPHIEUNHAP_REFERENCE_PHIEUNHAP FOREIGN KEY (MAPHIEUNHAP)
      REFERENCES PHIEUNHAP (MAPHIEUNHAP);
ALTER TABLE CHITIETPHIEUNHAP
   ADD CONSTRAINT FK_CHITIETPHIEUNHAP_REFERENCE_MATHANG FOREIGN KEY (MAMH)
      REFERENCES MATHANG (MAMH);

/*==============================================================*/
/* TABLE: PHIEUBH                                               */
/*==============================================================*/
CREATE TABLE PHIEUBH 
(
   MAHD                 VARCHAR(6)                     NOT NULL,
   MAMH			VARCHAR(8)		       NOT NULL,
   NGAYBH               DATE                           NOT NULL,
   LIDOBH               VARCHAR(500)                   NOT NULL,
   NGAYNHANHANG         DATE                           NOT NULL,
   NGAYHENTRA           DATE                           NOT NULL,
   CONSTRAINT PK_PHIEUBH PRIMARY KEY (MAHD,MAMH)
)
GO 

/*==============================================================*/
/* ADD FORENIGN KEY IN TABLE PHIEUBAOHANH                       */
/*==============================================================*/
ALTER TABLE PHIEUBH
   ADD CONSTRAINT FK_PHIEUBH_REFERENCE_HOADON FOREIGN KEY (MAHD)
      REFERENCES HOADON (MAHD);
ALTER TABLE PHIEUBH
	ADD CONSTRAINT FK_PHIEUBH_REFERENCE_MATHANG FOREIGN KEY(MAMH)
	  REFERENCES MATHANG
/*ALTER TABLE PHIEUBH
   ADD CONSTRAINT FK_PHIEUBH_REFERENCE_HOADON FOREIGN KEY (NGAYBH)
      REFERENCES HOADON (NGAYXUATHD);
*/
