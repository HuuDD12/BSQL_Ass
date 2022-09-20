CREATE DATABASE AS4
USE AS4
-------------------Q1-------------
create table Movie(
MovieId int  primary key,
MovieName nvarchar(50),
Duration float check (Duration >=1),
Genre int check (Genre between 1 and 8),
Director nvarchar(50),
MoneyMade money,
Comments nvarchar(100)
)
go

create table Actor(
Act_Id char(2) primary key,
Act_Name nvarchar(50),
Act_Age int,
Avg_Salary money,
Nationality nvarchar(50)
)
go

create table ActedIn(
Ain_Id char(2) primary key,
Act_Id char(2) ,
MovieId int,
Note nvarchar(50),
CONSTRAINT fk_Act_Id FOREIGN KEY (Act_Id) REFERENCES Actor (Act_Id),
CONSTRAINT fk_MovieId FOREIGN KEY (MovieId) REFERENCES Movie (MovieId)
)
go
---------------------------Q2--------------------------
alter table Movie add ImageLink  varchar(50) unique
go
insert into Movie VALUES(2,N'GaLa Cười','2.2',2,N'Hữu',100000,N'Haì','abc')
insert into Movie VALUES(1,N'kaizoku no sedai','2.4',4,N'Đức',9999999,N'cực hay','abcd')
insert into Movie VALUES(3,N'con giời','2',6,N'Hữu',100000,N'chứa tể','abce')
insert into Movie VALUES(4,N'cơm chó','1.5',1,N'vân anh',170000,N'nhàm chán','abcf')
insert into Movie VALUES(5,N'Tu Tiên','2.5',7,N'Hoàng',400000,N'vui','abcg')
go
insert into Actor values('A1',N'Hữu',99,30000,N'Việt Nam')
insert into Actor values('A2',N'Dương',22,40000,N'Việt Nam')
insert into Actor values('A3',N'Vân Anh',69,35000,N'Việt Nam')
insert into Actor values('A4',N'Hồng',51,3000,N'Việt Nam')
insert into Actor values('A5',N'Kiên',18,80000,N'Việt Nam')

go
insert into ActedIn values('N1','A2',1,N'vai chính')
insert into ActedIn values('N2','A1',3,N'nam phụ')
insert into ActedIn values('N3','A5',4,N'nữ chính')
insert into ActedIn values('N4','A3',5,N'nữ phụ')
insert into ActedIn values('N5','A4',2,N'nam phụ')
go
UPDATE Actor 
SET Act_Name = N'Đức Hữu'
WHERE Act_Id = 'A1'
Go
--------------------------------Q3--------------
--c
select * from Actor
where Act_Age > 50
go
--d
select Act_Name,Avg_Salary
from Actor
ORDER BY Avg_Salary ASC
go
--e
SELECT mov.MovieName 
FROM Actor act
JOIN ActedIn acte ON acte.Act_ID = act.Act_ID 
JOIN Movie mov ON mov.MovieID = acte.MovieID
WHERE act.Act_Name LIKE '%Vân Anh%'
--f
insert into ActedIn values('N6','A3',3,N'nữ phụ')
insert into ActedIn values('N7','A3',1,N'nữ phụ')
insert into ActedIn values('N8','A5',4,N'nam phụ')
insert into ActedIn values('N9','A1',4,N'nam phụ')

SELECT mov.MovieName 
FROM ActedIn acte
INNER JOIN dbo.Movie mov ON mov.MovieID = acte.MovieID 
INNER JOIN dbo.Actor act ON act.Act_ID = acte.Act_ID
WHERE mov.Genre = 1
GROUP BY mov.MovieName
HAVING COUNT(act.Act_ID) >= 3
go
---------------------end------------
select * from Movie
select * from Actor
select * from ActedIn
go