/* USE di chuyen database hien hanh
 09.09.2020 9h45 */
use master;
create database QLSACH
on
(
Name=QLSACH_Data,
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLSACH_Data.mdf',
size=10MB,
maxsize=100MB,
FileGrowth=10%
)
Log on
(
Name=QLSACH_Log,
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLSACH_Log.Ldf',
size=2MB,
maxsize=UNLIMITED,
FileGrowth=10%
)
/* tạo bảng */
use QLSACH
create table TheLoai
(
	MaTL nchar(10) primary key,
	TenTL nchar(100) 
)
create table SAch
(
Masach char(10) not null primary key,
Tensach char(50),
Sotrang int,
NgayXB date,
MaTL nchar(10),
foreign key (MaTL) references TheLoai(MaTL)
)
alter table SAch
alter column Tensach nchar (50)
create table NhaXB
(
MaXB nchar(10) not null primary key,
TenXB nchar(50),
DiaChi char(100),
SDT int,
email char(50),
)
drop table NhaXB
alter table NhaXB
alter column DiaChi nchar (100)

drop table NhaXB
/* thêm thuộc tính */
alter table SAch
add MaXB nchar(10)
/* thêm khóa ngoại */
alter table SAch
add foreign key (MaXB) references NhaXB(MaXB)
/* tang kich thuockieu du kieu cho TenXB len 200 ký tự */
alter table NhaXB
alter column TenXB char (200)
/* rang buoc sdt va email la duy nhat */
alter table NhaXB
add unique(SDT, email)
/* xóa 1 cột số trang trong bảng SAch */
alter table SAch
drop column Sotrang/* xóa table dùng drop */

/* xóa database */

/* 14/09/2020 */
/* thêm thông tin vào bảng */
insert into TheLoai(MaTL,TenTL) values(N'TH',N'Tin Học');
insert into TheLoai(MaTL,TenTL) values(N'KT',N'Kế Toán');
insert into TheLoai(MaTL,TenTL) values(N'QTKD',N'Quản Trị Kinh Doanh');
insert into TheLoai(MaTL,TenTL) values(N'TNN',N'Tài Nguyên Nước');
insert into TheLoai(MaTL,TenTL) values(N'KTMT',N'Kỹ Thuật Môi Trường');
/* xem lại bảng thể loại */
select * from TheLoai;

insert into NhaXB(MaXB,TenXB,DiaChi,SDT,email) 
values(N'NXBTH',N'Nhà xuất bản tổng hợp',N'12 Hai Bà Trưng.Hà Nội','0245678612','nxbtonghop@gmail.com');
insert into NhaXB(MaXB,TenXB,DiaChi,SDT,email) 
values(N'NXBGD',N'Nhà xuất bản giáo dục',N'14 Đống Đa.Hà Nội','0247646786','nxbgiaoduc@gmail.com');
insert into NhaXB(MaXB,TenXB,DiaChi,SDT,email) 
values(N'NXBTK',N'Nhà xuất bản thống kê',N'1 Bình Trị Đông. TPHCM','0285638613','nxbthongke@gmail.com');
insert into NhaXB(MaXB,TenXB,DiaChi,SDT,email) 
values(N'NXBKHKT',N'Nhà xuất bản khoa học kĩ thuật',N'13 Võ Văn Tần','0285678614','nxbkhkt@gmail.com');
select * from NhaXB;

alter table NhaXB
alter column TenXB nchar (50)

 SET DATEFORMAT dmy;

insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'THDC',N'Tin học đại cương',N'20','01/01/2020',N'TH',N'NXBTH');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'THVP',N'Tin học văn phòng',N'50','20/12/2020',N'TH',N'NXBTH');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'THKT',N'Tin học đại cương cho kế toán',N'60','12/12/2020',N'TH',N'NXBGD');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'THCT',N'Tin học đại cương cho công trình',N'30','24/11/2019',N'TH',N'NXBGD');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'KTDC',N'kế toán đại cương',N'40','30/10/2019',N'KT',N'NXBGD');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'QTKDNLKD',N'Nguyên lý kinh doanh',N'90','31/07/2019',N'QTKD',N'NXBTH');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'QTKDTLKD',N'Triết lý kinh doanh',N'90','30/09/2018',N'QTKD',N'NXBTK');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'TNNCTN',N'Cấp thoát nước',N'40','30/08/2017',N'TNN',N'NXBTK');
insert into SAch(Masach,Tensach,SoTrang,NgayXB,MaTL,MaXB)
values(N'KTMTCB',N'Kỹ thuật môi trường cơ bản',N'20','20/08/2017',N'KTMT',N'NXBKHKT');

--QUan sát các bảng đã nhập
select *from TheLoai;
select *from NhaXB;
select *from SAch;
select *from Sach_tacGia;
select *from TacGia;

TRUNCATE TABLE NhaXB
-- tạo bảng

create table TacGia
(
MaTG nchar(20) not null primary key,
TenTG nchar(100),
DiaChi nchar(200),
SDT nchar(10),
email nchar(200)
);
-- tạo bảng
create table Sach_tacGia
(
MaTG nchar(20) not null,
MaSach char(10) not null constraint PK_SACH_TACGIA primary key (MaTG,MaSach),

);
drop table Sach_tacGia;
--tạo ràng buộc
alter table Sach_tacGia
add constraint FK_SACH_ foreign key(Masach) references SAch (Masach)
go
 alter table Sach_tacGia
 add constraint Fk_tacgia foreign key(MaTG) references TacGia(MaTG)


insert into TacGia values(N'001',N'Phạm Hữu Độ',N'Hà Nội','0988888888','huudo@gmail.com')
insert into TacGia values(N'002',N'Phạm An Bình',N'HCM','0988675555','anbinh@gmail.com')
insert into TacGia values(N'003',N'Viên An',N'HCM','098122211','anvien@gmail.com')
insert into TacGia values(N'004',N'Viên Thanh Nhã',N'CT','093122221','nhavien@gmail.com')

insert into Sach_tacGia(MaTG,MaSach) values (N'001',N'THDC');
insert into Sach_tacGia(MaTG,MaSach) values (N'001',N'THVP');
insert into Sach_tacGia(MaTG,MaSach) values (N'001',N'KTDC');
insert into Sach_tacGia(MaTG,MaSach) values (N'001',N'TNNCTN');
insert into Sach_tacGia(MaTG,MaSach) values (N'001',N'QTKDNLKD');
insert into Sach_tacGia(MaTG,MaSach) values (N'002',N'THDC');
insert into Sach_tacGia(MaTG,MaSach) values (N'002',N'THVP');
insert into Sach_tacGia(MaTG,MaSach) values (N'002',N'TNNCTN');
insert into Sach_tacGia(MaTG,MaSach) values (N'002',N'QTKDNLKD');
insert into Sach_tacGia(MaTG,MaSach) values (N'002',N'KTMTCB');
insert into Sach_tacGia(MaTG,MaSach) values (N'003',N'THKT');
insert into Sach_tacGia(MaTG,MaSach) values (N'004',N'THKT');
insert into Sach_tacGia(MaTG,MaSach) values (N'004',N'KTDC');

 

select MaTL,TenTL
from TheLoai

select TheLoai.MaTL, TheLoai.TenTL
from TheLoai

select MaTL as id, TenTL as name
from TheLoai

select MaTL id, TenTL name
from TheLoai

 select MaTl id, tenTL name
 from TheLoai

 -- liệt kê danh sách sách của nhà xuất bản
 select * 
 from NhaXB nxb, SAch s
 where nxb.MaXB= s.MaXB
 
 -- ngày 16/09/2020
 -- liệt kê các tác giả có viết sách 
  

  select *
  from TacGia tg, Sach_tacGia s
  where tg.MaTG=s.MaTG
 
 select  *
 from SAch s, Sach_tacGia stg
 where s.Masach=stg.Masach

 select *
 from SAch s, Sach_tacGia stg, TacGia tg
 where s.Masach=stg.Masach and stg.MaTG=tg.MaTG
 -- hiển thị thông tin sách theo thể loại: gồm thông tin sách và tên thể loại
  select s.*, tl.TenTL
  from SAch s, TheLoai tl
  where s.MaTL=tl.MaTL
  -- sắp xếp oder by
--hiển thị thông tin sách  theo thể loại : gồm thông tin sách và thể loại 
-- sắp xếp số trang theo tăng dân 

  select s.*, tl.TenTL
  from SAch s, TheLoai tl
  where s.MaTL=tl.MaTL
 order by s.SoTrang asc;

   -- sắp xếp oder by
--hiển thị thông tin sách  theo thể loại : gồm thông tin sách và thể loại 
-- sắp xếp nhà xuất bảng giảm dần

  select s.*, tl.TenTL
  from SAch s, TheLoai tl
  where s.MaTL=tl.MaTL
 order by s.NgayXB desc;

   -- sắp xếp oder by
--hiển thị thông tin sách  theo thể loại : gồm thông tin sách và thể loại 
-- sắp xếp nhà xuất bảng giảm dần và số trang tăng dần
  select s.*, tl.TenTL 
  from SAch s, TheLoai tl
  where s.MaTL=tl.MaTL
 order by s.SoTrang asc,s.NgayXB desc;

 -- so sanh trong điều kiện where
 -- liệt kê các sach có số trang lớn hơn 30
 select *
 from SAch
 where SoTrang>30
 -- liệt kê các sách có số trang lớn hơn 20 và nhỏ hơn 50
 -- Tự Làm nè <3
  select *
 from SAch
 where SoTrang>20 and SoTrang<50
 
 -- liệt kê các sách có số trang lớn hơn bằng 20 và nhỏ hơn bằng 50
   select *
 from SAch
 where SoTrang between 20 and 50;
  -- liệt kê các sách có số trang khác 30 hoặc Ngày xuất bảng năm 2020 dùng year(X)

 select *
 from SAch
 where SoTrang !=30 or year(NgayXB)=2020

 --- hiển thị số dòng đâu tiên
 -- sử dụng top n với n là số dòng
 --- liệt kê ba cuốn sách đầu tiên trong bản sách 
 select top 3 *
 from SAch 
 
  -- sử dụng like để lọc dữ liệu 
  -- % đại diện cho n ký tự bất ki 
  --- liệt kê các sách có tên bắt đầu là chữ T 
  select *
  from SAch
  where Tensach like 'T%'

--liệt kê các sách có tên sách mà có chữ đại 
-- Sinh viên tự làm nè
  select *
  from SAch
  where Tensach like N'%đại%'

  -- sử dụng dấu gạch dưới đại diện cho 1 ký tự bất kỳ 
  --sử dụng _ trong like 
  --- 024 646789
  select *
  from NhaXB
  where SDT like '24_646786'
   -- lọc ra danh sách các nhà xuất bản có email bắt đùa từ nxb
   --ký tự thứ 2 bất kỳ từ ký tự thứ 3 trở đi ký tự gì cũng được 
   -- sinh viên tự làm nè
    select *
  from NhaXB
  where email like 'nxb_%'

  -- kí tự [kí tự] vd 0247646786[123456]

  select *
  from NhaXB
  where SDT like '24764678[123456]'

   -- kí tự [kí tự] vd 0247646786[^123456] ngoài trừ các kí tự trong ngoặc


    select *
  from NhaXB
  where SDT like '24764678[^123456]'

  --- insert dòng 
  insert into SACH(Masach,MaTL,MaXB) values (N'KttM',N'QTKD','NXBKHKT');
  select *
  from SAch

  --liệt kê danh sách chưa được cập nhật tên 
  select *
  from SAch
  where  Tensach is Null


  -- group by 
  select MaXB, min(SoTrang) as sotrangnhonhat, max(SoTrang) as sotranglonnhat, 
  avg(SoTrang) as sotrangtrungbinh, count(Masach) as Sosach
  from SAch
  group by MaXB



  --ngày 21.09.2020---
  ---********************---

  use QLSACH

  --- đếm số sách theo thể loại
  select tl.MaTL, count(s.Masach) as SoSach
  from SAch s, TheLoai tl
  where s.MaTL=tl.MaTL
  group by tl.MaTL 
  --- AMBIGIOUS---
  --- đếm số sách theo từng nhà xuất bảng
  select nxb.MaXB, count(s.Masach) as sosachnhaxuatbang
  from SAch s, NhaXB nxb
  where s.MaXB=nxb.MaXB
  group by nxb.MaXb
  --- đếm số sách theo từng thể loại
  ---với điều kiện số sách lớn hơn bằng 2
  ---sử dụng having điều kiện gom nhóm
    select tl.MaTL, count(s.Masach) as SoSach
  from SAch s, TheLoai tl
  where s.MaTL=tl.MaTL
  group by tl.MaTL 
  having count(s.MaTL)>=2

  ---đếm số sách theo từng thể loại mà tên thể loại có chữ Danh hoặc Học
      select tl.MaTL, count(s.Masach) as SoSach
  from SAch s, TheLoai tl 
  where s.MaTL=tl.MaTL and (TenTL like N'%Doanh%' or TenTL like N'%Học%')
  group by tl.MaTL 

  select *
  from NhaXB

  --- sử dụng công cụ 
SELECT SAch.Tensach, TheLoai.MaTL, SAch.Masach, TheLoai.TenTL
FROM     SAch INNER JOIN
                  TheLoai ON SAch.MaTL = TheLoai.MaTL


SELECT TheLoai.MaTL, TheLoai.TenTL, SAch.Masach, SAch.Tensach
FROM     SAch INNER JOIN
                  TheLoai ON SAch.MaTL = TheLoai.MaTL
WHERE  (TheLoai.MaTL = N'TH')


SELECT SAch.Masach, SAch.Tensach, SAch.NgayXB, TheLoai.MaTL, TheLoai.TenTL
FROM     SAch INNER JOIN
                  TheLoai ON SAch.MaTL = TheLoai.MaTL
ORDER BY SAch.NgayXB

--- liệt kê danh sách các sách mà có thể loại là tin học hoặc kế toán

SELECT SAch.Masach, SAch.Tensach, TheLoai.MaTL, TheLoai.TenTL
FROM     SAch INNER JOIN
                  TheLoai ON SAch.MaTL = TheLoai.MaTL
WHERE  (TheLoai.TenTL = N'Tin Học') OR
                  (TheLoai.TenTL = N'Kế Toán')

--- group by bằng công cụ
SELECT COUNT(*) AS SoSach, TheLoai.TenTL
FROM     SAch INNER JOIN
                  TheLoai ON SAch.MaTL = TheLoai.MaTL
GROUP BY TheLoai.TenTL
HAVING (COUNT(*) >= 2)

select *
from SAch
select *
from TheLoai

insert into SAch(Masach,Tensach,MaXB)
values(N'LCNTT',N'Luật CNTT',N'NXBGD');

--- chú ý kết quả không phù hợp ---
select *
from SAch s, TheLoai tl
where s.MaTL=tl.MaTL

--- left join
select *
from SAch s left outer join TheLoai tl
on s.MaTL=tl.MaTL


select *
from SAch s right outer join TheLoai tl
on s.MaTL=tl.MaTL

select *
from SAch s full outer join TheLoai tl
on s.MaTL=tl.MaTL

use QLSACH
-- thêm cột số giờ vào bảng sách tác giả --
alter table Sach_tacGia
add SoGio int;


-- update dữ liệu 

update Sach_tacGia set SoGio='1' where MaTG='001' and MaSach ='KTDC'

select *
from Sach_tacGia


--- Truy vấn con ---
select MaSach
from Sach_tacGia stg
where SoGio>10

--- sub query ---
select s.Masach, s.Tensach
from SAch s
where s.Masach in 
(select MaSach
from Sach_tacGia stg
where SoGio>10)
--- câu truy vấn tương đương ---
select distinct s.Masach, s.Tensach
from SAch s, Sach_tacGia stg 
where s.Masach=stg.Masach and stg.SoGio>10
--- sub query năm ở from ---
SELECT s.TenSach, truyvancon1.tong_so_gio_viet
FROM Sach s
 (SELECT stg.MaSach, SUM(stg.SoGio) AS tong_so_gio_viet
 FROM Sach_TacGia stg
 GROUP BY stg.MaSach) truyvancon1
WHERE truyvancon1.MaSach = s.MaSach;

select s.TenSach, kiet.TongSoGio
from SAch s,
(select stg.MaSach, sum(stg.SoGio) as TongSoGio
from Sach_tacGia stg
group by stg.MaSach) kiet
where kiet.MaSach =s.Masach

---cho biết tổng số giờ viết sách của mỗi cuốn sách 
--- mà tổng số giờ từ 20 trở lên
select s.TenSach, kiet.TongSoGio
from SAch s,
(select stg.MaSach, sum(stg.SoGio) as TongSoGio
from Sach_tacGia stg
group by stg.MaSach 
having sum(stg.SoGio)>=20 ) kiet
where kiet.MaSach =s.Masach

select s.TenSach, kiet.TongSoGio
from SAch s,
(select stg.MaSach, sum(stg.SoGio) as TongSoGio
from Sach_tacGia stg
group by stg.MaSach) kiet
where kiet.MaSach =s.Masach and TongSoGio>=20

--- truy vấn con viết ở select ---
--Cho biết các sách có số giờ lớn nhất
SELECT s.MaSach, s.TenSach,
 (SELECT MAX(stg.SoGio)
 FROM Sach_TacGia stg
 WHERE s.MaSach = stg.MaSach) as truyvancon2
FROM Sach s;

select s.MaSach, s.TenSach,
(select max(stg.SoGio)
from Sach_tacGia stg
where s.MaSach =stg.MaSach) as kiet
from SAch s;


	---except--- phép trừ
	 --cho biết các sách mà  chưa được viết 
	 select MaSach
	 from SAch
	 except 
	 select MaSach
	 from Sach_tacGia


---intersect--- phép giao
--Cho biết các sách mà được viết bởi các tác giả
SELECT MaSach
FROM Sach
INTERSECT
SELECT MaSach
FROM Sach_TacGia;

---Union--- phép hội union tự động loại bỏ dòng trung lập
---union all thì phép hội này lấy hết
SELECT MaSach
FROM Sach
UNION
SELECT Masach
FROM Sach_TacGia;

--UNION ALL
SELECT MaSach
FROM Sach
UNION
SELECT Masach
FROM Sach_TacGia;


--- Hiển thị thông tin sách theo từng tác giả ---
select s.*, tg.TenTG
from SAch s, Sach_tacGia stg, TacGia tg
where s.Masach=stg.Masach and stg.MaTG=tg.MaTG

select *
from SAch s left outer join TheLoai tl
on s.MaTL=tl.MaTL

--- sử dụng inner join = where (tối ưu hơn)
select s.*, tg.TenTG
from SAch s inner join Sach_tacGia stg on s.Masach=stg.Masach inner join TacGia tg on stg.MaTG=tg.MaTG


---27-09-2020----

--- pivot --- biến đổi giá trị của dòng thành cột
--- hiển thị danh sách sách tác giả 

select s.TenSach,s.MaXB
from sach s,TacGia tg, Sach_TacGia stg
where s.MaSach=stg.MaSach and stg.MaTG=tg.MaTG


--- use pivot---

SELECT TenSach, [NXBTH], [NXBTK] ---câu truy vấn tạm--- kết quả: Tên sách, NXBTK.NXBTH
FROM  --- lấy dữ liệu nguồn--- lấy từ bảng sách và sách tác giả
(select s.TenSach,s.MaXB
from sach s,TacGia tg, Sach_TacGia stg
where s.MaSach=stg.MaSach and stg.MaTG=tg.MaTG ) AS BangNguon
PIVOT
(
count(maxb) --- khởi tạo biến đếm=0
FOR maxb IN ([NXBTH], [NXBTK]) --- IN biểu thị tập hợp---
) AS BangChuyen;

--- Hiển thị các tổng số giờ của các tác giả viết

SELECT TenSach, [1],[5],[10],[11],[12],[15],[16],[17],[20],[30],[40],[50] ---câu truy vấn tạm--- kết quả: Tên sách, NXBTK.NXBTH
FROM  --- lấy dữ liệu nguồn--- lấy từ bảng sách và sách tác giả
(select s.TenSach,stg.SoGio
from sach s,TacGia tg, Sach_TacGia stg
where s.MaSach=stg.MaSach and stg.MaTG=tg.MaTG ) AS BangNguon
PIVOT
(
sum(SoGio) 
FOR SoGio IN ([1],[5],[10],[11],[12],[15],[16],[17],[20],[30],[40],[50]) --- IN biểu thị tập hợp---
) AS BangChuyen;


 select *
 from Sach_tacGia
--- view(bảng ảo)--- xuất hiện thành 1 bảng mới về mặc vật lý
--- tạo view
create view SACH_VIEW as 
select TenSach,SoTrang
from SAch;
 --- sql sẽ giống như bảng thật
 select *
 from SACH_VIEW

 --- tạo view có check ràng buộc---
 --Tạo view voi check option
CREATE VIEW SACH_CHECK_SOTRANG_VIEW AS
SELECT MaSach, TenSach,SoTrang
FROM Sach
WHERE SoTrang >0
WITH CHECK OPTION;

insert into SACH_CHECK_SOTRANG_VIEW 
values('KTUD',N'Kế Toán Ứng Dụng','30')

select *
from SACH_CHECK_SOTRANG_VIEW

--Update kế toán ứng dụng chó số trang là 40
UPDATE SACH_CHECK_SOTRANG_VIEW
SET SoTrang = 40
WHERE MaSach = 'KTUD';

select *
from SACH_CHECK_SOTRANG_VIEW

UPDATE SACH_CHECK_SOTRANG_VIEW
SET SoTrang = -40
WHERE MaSach = 'KTUD';

drop view SACH_VIEW

---tạo view cho biết số sách theo thể loại 
CREATE VIEW SACH_THELOAI_VIEW AS
  select tl.MaTL, count(s.Masach) as SoSach
  from SAch s, TheLoai tl
  where s.MaTL=tl.MaTL
  group by tl.MaTL 
  

  select *
  from SACH_THELOAI_VIEW 

  ---- 29-09-2020 ----


  --- store procedure
  --- câu 1
  --- tạo thủ tục insert dữ liệu bảng thể loại
  --- tạo biến sql sử dụng @
  create procedure Sp_cau1(@matl nchar(10),@tentl nchar(100))
  as
  begin
		insert TheLoai(MaTL,TenTL) values (@matl,@tentl)
  end

  --- sử dụng như thế nào????
  exec  Sp_cau1 'VT',N'Vũ trụ học'
  Sp_cau1 'VT',N'Vũ trụ học'

  --- hai câu trên như nhau

  select *
  from TheLoai

  --- câu 2 update thể loại 

  create procedure Sp_cau2(@matl nchar(10),@tentl nchar(100))
  as
  begin
		update TheLoai
		set TenTL  = @tentl
		where MaTL=@matl
  end

  Sp_cau2 'VT',N'Vũ trụ học không gian'

  ---câu 3 kết hợp 1 2 
  --- kiểm trâ mã thể loại nếu có thì update ngược lại thì insert

  create procedure Sp_cau3(@matl nchar(10),@tentl nchar(100))
  as
  begin
		if exists(select * from TheLoai where MaTL=@matl)
			begin
				update TheLoai
				set TenTL  = @tentl
				where MaTL=@matl
				print 'update'
			end
		else
			begin
				insert TheLoai(MaTL,TenTL) values (@matl,@tentl)
				print 'insert'
			end
  end

  drop procedure Sp_cau3

  --- GỌi câu 3
 Sp_cau3 'VT',N'Kiến thức về vũ trụ'
  Sp_cau3 'VT1',N'Kiến thức về vũ trụ'
 select * from TheLoai

 create procedure Sp_cau4 (@masach char(10), @tensach nchar(50), @sotrang int,
 @ngayxb date, @matl nchar(10), @maxb nchar(10))
 as
 begin
 insert into SAch(Masach, Tensach, SoTrang, NgayXB, MaTL, MaXB)
 values(@masach,@tensach,@sotrang,@ngayxb,@matl,@maxb);
 end

 Sp_cau4 'THGT',N'Tin học giải thuật','30','10/10/2020','TH','NXBTK'
 select *
from SAch


---tạo bảng tạm từ bảng sách 

select *
into TAM_TABKE_SACH
FROM SAch 

--- drop table
---

create procedure Sp_cau5
as
begin 
	drop table TAM_TABKE_SACH
	print N'Xóa Thành Công!!'
end

sp_cau5

---CÂU 6
--- kiểm tra việc table c


  create procedure Sp_cau6
  as
  begin
		if exists(select * from INFORMATION_SCHEMA.TABLES where Table_name='TAM_TABKE_SACH')
			begin
				drop table TAM_TABKE_SACH
				print N'Xóa bảng thành công'
			end
		else
			begin
				select *
				into TAM_TABKE_SACH
				FROM SAch 
				print N'Tạo bảng'
			end
  end
  drop procedure Sp_cau6
  ---- gọi thủ tục 
  Sp_cau6 
  --- kiểm tra sự tồn tại của store procedure
  create procedure Sp_cau6
  as
  begin
		if exists(select * from INFORMATION_SCHEMA.TABLES where Table_name='TAM_TABKE_SACH')
			begin
				drop table TAM_TABKE_SACH
				print N'SP có tồn tại!!!'
			end
end

--- 07-10-2020 ---
create procedure Sp_cau8(@sotrang SMALLINT, @demso int output)
as
begin
	select
	Tensach,
	Sotrang
	from
	Sach
	where
	Sotrang=@sotrang
	set @demso=@@ROWCOUNT
end;

-- khai báo biến
declare @dem int
exec Sp_Cau8 90,@dem OUTPUT
print N'so dong la ' + cast (@dem as nchar(2)) + N'thoa man dieu kien so trang =90'

DECLARE @count INT ;
EXEC SP_cau8 40, @count OUTPUT
print N'Đếm số'+ cast (@count as nchar (2))
SELECT @count AS 'Số sách được tìm thấy';

--- thu tuc kiem tra viec insert du lieu vao mot bang nao do 
--- the loai
create procedure SP_cauinserttable
(
@matl nchar(10),
@tentl nchar(100),
@kq int output
)
AS
begin
if not exists (select * from TheLoai where MaTL=@matl)
Begin
		print N'Không thành công!'
		set @kq=0
	end
else
	begin
		insert into TheLoai(MaTL, TenTL) values (@matl,@tentl)
		print N'thành công!!!'
		set @kq=0
	end
end;

declare @kq int
exec SP_cauinserttable 'VHVN',N'Văn Học Việt Nam',@kq output
if(@kq =1 )
	print N'insert thanh cong'
else 
	print N'Khong thanh cong'

 drop procedure SP_cauinserttable
 --- tao them bang

--- sử dụng hàm có sẵn của sql server
-- cho biết danh sahcs cách sách hiển thị năm xuất bản
select tensach, year(NgayXB) as nam, month(NgayXB) as thang, day(ngayXB) as Ngay
 from SAch
 --- hien thi sach xuat ban nam 2018

 select tensach, year(NgayXB) as nam
 from SAch
 where year(NgayXb)=2018

select tensach, NgayXB, year (getDate())-year(ngayXb) as 'sonam'
from SAch

--Scale function
CREATE FUNCTION DoanhThu
(
 @quantity INT,
 @price DEC(10,2),
 @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS
BEGIN
 RETURN @quantity * @price * (1 - @discount);
END;


--- goi ham vua viet
SELECT dbo.DoanhThu(10,100,0.1) as danhthu;
 select 



 sohd, dbo.DoanhThu(soluong, giatien, giamgia) ThanhTien
 from
 chitiethd

 tuong tu
 
 select
 sohd, soluong*giatien*(1-giamgia) ThanhTien
 from
 chitiethd

 drop table ChiTietHD
 drop table DonDatHang
 drop table KhachHang
 drop table NhanVien

 create table NhanVien
(
MaNV nchar(10) not null primary key,
HotenNV nchar(100),
GT nchar(10),
NS nchar(10),
MaNVQL nchar(10)
);

create table KhachHang
(
MaKH nchar(10) not null primary key,
HoKH nchar(100),
TenKH nchar(100),
Phone int,
Email nchar(50)
);

create table DonDatHang
(
SoDH nchar(10) not null primary key,
NgayDH date,
TrangThaiDH nchar(10),
NgayDuKienGiao date,
NgayThucTeGiao date,
MaNV nchar(10),
MaKH nchar(10)
constraint FK_ĐONATHANG_NHANVIEN foreign key(MaNV) references NhanVien (MaNV),
constraint FK_ĐONATHANG_KHACHHANG foreign key(MaKH) references KhachHang (MaKH)
);
Create table ChiTietDH
(
ID_Item nchar(10) not null primary key,
SoDH nchar(10),
MaSach char(10),
SoLuong int,
GiaTien int,
GiamGia float
constraint FK_CHITIEt_DONHANG foreign key(SoDH) references DonDatHang(SoDH),
constraint FK_CHITIEt_SACH foreign key(MaSach) references SACh(MaSach)
);
 drop table ChiTietDH
 alter table ChiTietDh
 add co SoDH nchar(10) not null constraint PK_CHITIEHDN primary key (ID_Item,SoDH)

 ---12-10-2020---

 ---tính chiều dài của số trang
 select *
 from SAch
 where SoTrang is not null

  select len(MaSach) as chieudai,len(SoTrang) as chieudai
 from SAch
 where SoTrang is not null


 create function chieudaichuoi
 (
 @chuoi nchar(100)
 )
 returns int
 as
begin

return len(@chuoi);
end;


 select dbo.chieudaichuoi(MaSach) as chieudai,dbo.chieudaichuoi(SoTrang) as chieudai
 from SAch
 where SoTrang is not null
 -- lấy m kí tự thứ n 
 select Substring(MaXB,3,1) as Kitu
 from Sach
  where MaXb is not null

 create function kitu
 (
 @kitu nchar(100)
 )
 returns nchar
 as
begin

return substring(@kitu,3,1);
end;

 select dbo.kitu(MaXB) as Kitu
 from Sach
  where MaXb is not null

 select right(rtrim(MaXB),3)
 from Sach
 where MaXb is not null

 select *
 from sach

  select Substring(MaXB,len(rtrim(MaXB))-2,3) as Kitu
 from Sach
  where MaXb is not null

DECLARE @sach_table TABLE
(
 TenSach nVARCHAR(100) NOT NULL,
 SoTrang INT NOT NULL,
 GiaSach DECIMAL(11,2)
);
--Chèn insert dữ liệu vào biến table
INSERT INTO @sach_table
SELECT
 TenSach,
 SoTrang,
 GiaSach
FROM
 Sach
WHERE
 SoTrang = 30;
 --Truy vấn xem kết quả của biến kiểu bảng
select * from @sach_table


--Tạo table Function trong SQL server
--Table Function
--Danh sách các sách có số trang là tham số đầu vào
CREATE FUNCTION List_Sach_th1
(
 @sotrang INT
)
RETURNS TABLE
AS
RETURN
 SELECT
 TenSach,
 SoTrang,
 NgayXB
 FROM
 Sach
 WHERE
 SoTrang = @sotrang;


 ---Thực thi hàm List_Sach
SELECT
 *
FROM
 List_Sach_th1(30);


 Alter FUNCTION List_Sach_th1
(
 @sotrang INT
)
RETURNS TABLE
AS
RETURN
 SELECT
 TenSach,
 SoTrang,
 NgayXB,
 MaTL
 FROM
 Sach
 WHERE
 SoTrang = @sotrang;
 ---- liet ke so luong sach cua 1 tac gia nao do duoc dua vao---

 create FUNCTION soluongsachtheotacgia
(
 @matg nchar(10)
)
RETURNS TABLE
AS
RETURN
 SELECT
 matg,
 count(maSAch) as Tongsachh
 FROM
  SAch_TacGia stg
 WHERE
 MaTG=@matg
 group by  Matg;

 select *
 from soluongsachtheotacgia('001')


 --- 14-10-2020 ---

--- tạo function với with ScheaBinding ---
CREATE FUNCTION DoanhThu
(
 @quantity INT,
 @price DEC(10,2),
 @discount DEC(4,2)
)
RETURNS DEC(10,2)
WITH SCHEMABINDING 
AS
BEGIN
 RETURN @quantity * @price * (1 - @discount);
END;

--Tạo view sử dụng DoanhThuGiamGia

CREATE VIEW dbo.discounts_TH1
WITH SCHEMABINDING
AS
SELECT
 SoDH,
 SUM(dbo.DoanhThu(
 SoLuong,
 GiaTien,
 GiamGia
 )) AS So_Tien_Giam_Gia
FROM
 dbo.ChiTietDH
GROUP BY
 SoDH;

 --- DROP VIEW TRƯỚC KHI DROP FUNCTION --- KHÔNG XÓA LÀ NÓ BỊ LỖI ĐÓ!!!


 --- TẠO BẢNG TỪ BẢNG KHÁCH HÀNG ---
 SELECT *
 INTO KHACH_NOINDEX
 FROM KhachHang

 --- truy vấn khách hàng có mã 001

 select *
 from KHACH_NOINDEX
 where MaKH ='001'

 select * from KHACH_NOINDEX
 select *
 from KHACH_NOINDEX
 where MaKH ='001'

 --- tạo index cho cột makh
 create clustered index index_makh
 on KHACH_NoIndex(MaKH)

 --- đổi tên index
 EXEC sp_rename
	N'Khach_noindex.index_makh',
	N'index_makh_new',
	N'INDEX';
--- vô hiệu hóa
alter index index_makh_new
on khach_noindex
disable;

-- kích hoạt lại các index đã vô hiệu hóa disable
alter index index_makh_new on khach_noindex
rebuild;
-- xóa nè
drop index index_makh_new
on Khach_noindex

--noncluster
create nonclustered index index_sdt
on Khach_noindex(phone)

select * from KHACH_NOINDEX
select * from KHACH_NOINDEX
where Phone='98899999'

----- Adventure Works 2012
--- tạo bảng mới từ bảng person.adress

 SELECT *
 INTO BangDiaChi
 FROM person.address

 select *
 from BangDiaChi  

 --- tiến hành tạo index clustered cho cột addressID, nonclustered cho cột PostalCode

  create clustered index index_addressID
 on BangDiaChi(addressID)

 create nonclustered index index_PostalCode
on BangDiaCHi(PostalCode)

drop index index_addressID on BangDiaChi
drop index index_PostalCode on BangDiaChi

--- tạo nonclustered cho nhiều cột
 create nonclustered index nonindex_City_AddressLine1
on BangDiaCHi(City,AddressLine1)

--- vô hiệu hóa tất cả các index BangDiaChi
alter index all
on BangDiaChi
disable;

--- phục hồi 1 index
alter index index_addressID on BangDiaChi
rebuild;



---19-10-2020 ---

--- trigger

--- tạo trigger chèn số mặt hàng của mõi đơn hàng không quá 4 mặt hàng 
create trigger tr_soctdh on ChitietDH for insert
as 
if(select count(a.SoDH)
	from ChiTietDH a, inserted b
	where a.SoDH=b.SoDH) >=5
begin
	print 'So CTHD khong the >=5'
	Rollback tran
end

--- 
create table HoaDon
(
SoHD nchar(10) not null primary key,
NgayHD date,
MaNV nchar(10),
MaKH nchar(10)
constraint FK_ĐONATHANG_NHANV foreign key(MaNV) references NhanVien (MaNV),
constraint FK_ĐONATHANG_KHACHH foreign key(MaKH) references KhachHang (MaKH)
)

create table ChitietHD
(
MaSach char(10) not null primary key,
SoHD nchar(10) ,
SL int,
DonGia int,
GiamGia float,
constraint FK_ĐONATHANG_NH foreign key(MaSach) references Sach (MaSach),
constraint FK_ĐONATHANG_KH foreign key(SoHD) references HoaDon (SoHD))




-----

alter table SAch
add SLTon int;


 -----

Create Trigger tr_XoaCTHD On ChiTietHD
For Delete
As
 Update MATHANG Set SLTon = SLTon + SL From DELETED
 Where MATHANG.MaMH = DELETED.MaMH
--Xóa 1 dòng trong bảng ChiTietHD thì sẽ cập nhật lại số lượng tồn
delete from ChiTietHD where SoHD='001' and MaSach='THVP'
--xem lại bảng ChiTietHD
select * from ChiTietHD;
select * from Sach;


--- viết trigger xóa 1 thể loại thì xóa tât cả thông tin liên quan của thể loại 

create trigger Xoatheloai on TheLoai 
for delete
as
begin
	delete TheLoai from SAch, deleted where Sach.MaTL=deleted.MaTL
end


delete from TheLoai where MaTL='KT'
select * from TheLoai;
select * from SAch;


--- 21-10-2020 ---


--- curor Bước 1 Khai báo curcor 

declare cursorsach CURSOR for
select Masach, tensach, sotrang from sach

--- bước 2 mở cusor 
 
 open cursorsach
 
 --- bước 3 đọc dữ liệu dòng đầu tiên
DECLARE @masach nchar(10)
DECLARE @tensach nchar(100)
DECLARE @sotrang int
 FETCH NEXT FROM cursorsach INTO @masach, @tensach, @sotrang
 print N'mã Sách' + @masach
print N'Tên Sách' + @tensach
print N'Số Trang' + cast(@sotrang as nvarchar)

--- bước 4 giải phóng cursor
close cursorsach
deallocate cursorsach

--- viết cursor duyệt danh sách các cuốn sách trong bảng sách gồm mã sách, tên sách nhà xuất bản 
declare cursorduyetsach1 cursor for
select Masach,tensach, tenXb from Sach s, NhaXB nxb where s.MaXB = nxb.MaXB --- khai báo cursor và dữ liệu trỏ tới

OPEN cursorduyetsach1 -- Mở con trỏ

DECLARE @masach nchar(10)
DECLARE @tensach nchar(100)
DECLARE @tennxb nchar(100)
FETCH NEXT FROM cursorduyetsach1 -- Đọc dòng đầu tiên
 INTO @masach, @tensach,@tennxb
WHILE @@FETCH_STATUS = 0 --vòng lặp WHILE khi đọc Cursor thành công
BEGIN
 --In kết quả hoặc thực hiện bất kỳ truy vấn
 --nào dựa trên kết quả đọc được
 PRINT N'Mã sách:' + @masach
 PRINT N'Tên sách:'+ @tensach
PRINT N'Tên nhà xuất bản:' + @tennxb
 FETCH NEXT FROM cursorduyetsach1 -- Đọc dòng tiếp
 INTO @masach, @tensach,@tennxb
END

CLOSE cursorduyetSach1 -- Đóng Cursor
DEALLOCATE cursorduyetSach1 -- Giải phóng tài nguyên

--- viết curcor mã thể loại là kt và số trang lớn hơn 30 


DECLARE cursorkt CURSOR FOR -- khai báo con trỏ cursorProduct
SELECT MaSach, TenSach, SoTrang, MaTL FROM Sach s where (sotrang >30 and matl='kt') -- dữ liệu trỏ tới
OPEN cursorkt -- Mở con trỏ

DECLARE @masach nchar(10)
DECLARE @tensach nchar(100)
DECLARE @sotrang int
declare @matl nchar(100)
FETCH NEXT FROM cursorkt -- Đọc dòng đầu tiên
 INTO @masach, @tensach,@sotrang, @matl
WHILE @@FETCH_STATUS = 0 --vòng lặp WHILE khi đọc Cursor thành công
			BEGIN
 --In kết quả hoặc thực hiện bất kỳ truy vấn
 --nào dựa trên kết quả đọc được
 PRINT N'Mã sách:' + @masach
 PRINT N'Tên sách:'+ @tensach
PRINT N'Số trang:' + CAST(@sotrang as nvarchar)
print N'mã thể loại:  '+ @matl
 FETCH NEXT FROM cursorkt -- Đọc dòng tiếp
 INTO @masach, @tensach,@sotrang, @maTl
			END
CLOSE cursorkt -- Đóng Cursor
DEALLOCATE cursorkt -- Giải phóng



--Backup database

--Backup database
DECLARE @name VARCHAR(50) -- Tên Databse sẽ duyệt
DECLARE @path VARCHAR(256) -- đường dẫn file backup
DECLARE @fileName VARCHAR(256) -- tên file backup
DECLARE @fileDate VARCHAR(20) -- đường dẫn để đặt theo tên từng file backup
SET @path = 'C:\backup\' -- thu muc chua cac file duoc Backup
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)--ngay thang se backup
--Định nghĩa Cursor
DECLARE db_cursor CURSOR FOR
 --những DataBase không cần backup, nếu bạn muốn backup hết thì bỏ dòng này

OPEN db_cursor --mở con trỏ để duyệt danh sách

FETCH NEXT FROM db_cursor INTO @name
WHILE @@FETCH_STATUS = 0
BEGIN
SET @fileName = @path + @name + '_' + @fileDate + '.BAK' --Tên Datase sẽ được lưu.
BACKUP DATABASE @name TO DISK = @fileName
FETCH NEXT FROM db_cursor INTO @name --duyet record kế tiếp
END
CLOSE db_cursor --đóng con trỏ
DEALLOCATE db_cursor --giải phóng con trỏ


select * from sysobjects
if Exitsts(select * from sysobjects where name like 'SaoLuuCSDL'
drop procedure SaoLuuCSDL
create Procedure SaoLuuCSDL(@tencsdl varchar(30), @ten_taptin varchar(200))
as
--chỉ cần dùng câu lệnh
backup database @tencsdl to disk = @ten_taptin
--Gọi thủ tục sao lưu
SaoLuuCSDL 'QLSACH' , 'C:\backup\backup_csdl.bak'


if Exists(select * from sysobjects where name like 'PhucHoiCSDL')
drop procedure PhucHoiCSDL
create Procedure PhucHoiCSDL(@tencsdl varchar(30), @ten_taptin varchar(200))
as
--chỉ cần dùng câu lệnh
restore database @tencsdl from disk = @ten_taptin
PhucHoiCSDL 'QLSACH' , 'C:\backup\backup_csdl.bak'
---------------------------------------------------------------------------------------------------------------------------------------------------------------


--c2.Phục hồi csdl khi còn 2 file .mdf và ldf
if not exists(select name from sysdatabases where name='QLDA')
exec sp_attach_db 'QLDA', 'C:\backup\QLDA.mdf','C:\backup\QLDA_log.ldf'


--c3 phục hồi csdl khi còn 1 file .mdf
--Phục hồi csdl khi còn 2 file .mdf và ldf
if not exists(select name from sysdatabases where name='QLDA')
exec sp_attach_single_file_db 'QLDA','C:\backup\QLDA.mdf'

drop database qlsach


--26-10-2020---


--- tạo tài khoản login
--- tạo user cho logins
--- cấp phát quyền cho database


delete from NhaXB where maxb='NXBTK'


create login A2760 with password = '1'

create user kiet for login A2760

grant select, delete on NhanVien to kiet

--- gán quyền select nhưng chỉ Sách  nhưng chỉ chọn cột
--- MÃ sách tên sách cho user kiet

grant select (MaSach,TenSach) on SAch to kiet



select * from Sach


-- store procedure
  --- câu 1
  --- tạo thủ tục insert dữ liệu bảng sách
  --- tạo biến sql sử dụng @

  create procedure Sp_Nhapsach1(@masach char(10),@tensach nchar(50),@ngayXB date, @matl nchar(10), @maxb nchar(10), @sotrang int)
  as
  begin
		insert Sach(Masach,Tensach,NgayXB,MaTL,MaXB,SoTrang) values (@masach,@tensach,@ngayXB,@matl,@maxb,@sotrang)
  end

  drop procedure sq_nhapsach
  --- sử dụng như thế nào????
  exec  Sp_cau1 'VT',N'Vũ trụ học'
  Sp_cau1 'VT',N'Vũ trụ học'

  --- hai câu trên như nhau

  select *
  from TheLoai

  --- câu 2 update thể loại 

  create procedure Sp_cau2(@matl nchar(10),@tentl nchar(100))
  as
  begin
		update TheLoai
		set TenTL  = @tentl
		where MaTL=@matl
  end

  Sp_cau2 'VT',N'Vũ trụ học không gian'

  create procedure TheLoai_Select
  as
  begin
	select  TenTL from TheLoai
end

drop procedure TheLoai_Select

create procedure Sp_Sua(@masach char(10),@tensach nchar(50),@ngayXB date, @matl nchar(10), @maxb nchar(10), @sotrang int)
  as
  begin
		update SAch
		set Tensach  = @tensach, NgayXB = @ngayXB, SoTrang=@SoTrang ,MaTL=@matl, MaXB = @maxb
		where Masach=@masach
		print 'update'
  end

  drop procedure Sp_Sua
 
