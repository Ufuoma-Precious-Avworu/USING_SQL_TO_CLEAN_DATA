CREATE DATABASE Education;

USE Education;

CREATE TABLE `Student info`
(Student_ID VARCHAR(10),
Full_Name VARCHAR (30),
AGE int,
ADDRESS TEXT); 

SELECT *
 FROM `Student info`;
 
 CREATE TABLE `Academic performance`
 (Student_ID VARCHAR(10),
 `Subject`  VARCHAR (10),
 Score DECIMAL,
 Final_grade TEXT);
 
 SELECT *
 FROM `Academic Performance`;
 
 CREATE TABLE Attendance
 (Student_ID VARCHAR(10),
 Days_Present  INT,
 Days_Absent INT,
 Public_Holiday INT);
 
 SELECT *
 FROM Attendance;
 
 INSERT INTO `Student info` (Full_Name,Student_ID,Age,Address)
 VALUES ("Juweto Edison Oghenefejirio", "Stu01", 17, "Udu Road"),
 ("AVWORU UFUOMA PRECIOUS", "Stu02", 13, "Sam Warri"),
 ("Suru Handsome", "Stu03", 15, "Agbarho Road"),
 ("Uthunu Miracle Ufuoma", "Stu04", 14, "jakpa road"),
 ("Omonigho Special", "Stu05", 15, "Owhurwowon");
 
 INSERT INTO `Academic performance` (Student_ID, `Subject`, score, final_grade)
 VALUES ("Stu01", "maths", "57", "pass"),
 ("Stu02", "english", "40", "fair"),
 ("Stu03", "biology", "70", "good"),
 ("Stu04", "science", "30", "fail"),
 ("Stu05", "art", "90", "excellent");
 
 INSERT INTO Attendance (Student_ID, Days_Present, Days_Absent, Public_Holiday)
 
  VALUES ("Stu01", "1", "57", "3"),
 ("Stu02", "2", "5", "4"),
 ("Stu03", "3", "70", "5"),
 ("Stu04", "4", "30", "6"),
 ("Stu05", "5", "90", "66");
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
select *
from `academic performance`;

select *
from attendance;

select *
from `student info`;