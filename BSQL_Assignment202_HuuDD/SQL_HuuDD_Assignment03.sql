CREATE DATABASE AS3
USE AS3

CREATE TABLE Trainee (
   TraineeID INT IDENTITY PRIMARY KEY,
   Full_Name NVARCHAR(100),
   Birth_Date  DATE,
   Gender BIT,
   ET_IQ INT CHECK ( ET_IQ BETWEEN 0 AND 20 ),
   ET_Gmath INT CHECK ( ET_Gmath BETWEEN 0 AND 20 ),
   ET_English INT CHECK ( ET_English BETWEEN 0 AND 50 ),
   Training_Class VARCHAR(50),
   Evaluation_Notes TEXT
)

INSERT INTO Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES (N'HỮU','12/12/2001',1,20,20,50,'JS02','no'),
(N'ANH','12/12/2001',0,5,15,45,'JS02','no'),
(N'DƯƠNG','12/11/2001',1,20,20,5,'JS01','no'),
(N'TÚ','12/2/2001',0,7,15,35,'JS02','no'),
(N'ĐỨC','1/12/2001',1,15,20,36,'JS01','no'),
(N'KIÊN','4/2/2001',1,12,20,45,'JS02','no'),
(N'DÙNG','5/2/2001',1,15,20,50,'JS03','no'),
(N'VÂN ANH','2/1/2001',0,20,12,40,'JS03','no'),
(N'NGU','2/5/2001',1,0,0,0,'JS03','no'),
(N'GIỎI','12/7/2001',1,20,20,50,'JS01','no'),
(N'SẾP','12/8/2001',1,20,20,50,'JS02','no')
GO
-------------------------------------
ALTER TABLE Trainee
ADD  Fsoft_Account VARCHAR(100) ;
GO
-----------------------------------
CREATE VIEW ET_passed
AS
	SELECT P.Full_Name
	FROM Trainee P
	WHERE P.ET_IQ >= 8 AND P.ET_Gmath >= 8 AND P.ET_English >= 18 AND P.ET_IQ + P.ET_Gmath >= 20 
GO
SELECT * FROM ET_passed 
----------------------------

GO
CREATE VIEW ET_passed_MONTH
AS
	SELECT  MONTH(P.Birth_Date) AS MONTHS,P.Full_Name
    FROM Trainee P
    WHERE P.ET_IQ >= 8 AND P.ET_Gmath >= 8 AND P.ET_English >= 18 AND P.ET_IQ + P.ET_Gmath >= 20
    GROUP BY MONTH(P.Birth_Date),P.Full_Name;
GO

SELECT * FROM ET_passed_MONTH 

--------------------------------
GO
CREATE VIEW ET_longest_NAME
AS
    SELECT  TOP 1 p.Full_Name,DATEDIFF(year, P.Birth_Date , GETDATE()) AS AGE, P.Evaluation_Notes
    FROM Trainee P
	ORDER BY Full_Name DESC
GO

SELECT * FROM ET_longest_NAME 
