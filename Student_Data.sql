USE Student_Data

/* Roll_number	Hours_Studied	Attendance	Parental_Involvement	
Access_to_Resources	Extracurricular_Activities	Sleep_Hours	Previous_Scores	Motivation_Level	
Internet_Access	Tutoring_Sessions	Family_Income	Teacher_Quality	School_Type	Peer_Influence	
Physical_Activity	Learning_Disabilities	Parental_Education_Level	
Distance_from_Home	Gender	Exam_Score */

Select
Count(Roll_number),
Hours_Studied
from student_data
Where Hours_Studied > 20
Group by Hours_Studied 

SELECT
Roll_number,
AVG(Hours_Studied)
from student_data


-- 1. Query to Find Students with High Motivation and Low Attendance 
	
SELECT * FROM student_data

SELECT 
Roll_number,
Motivation_Level,
Attendance
From student_data
Where Motivation_Level = 'High' and Attendance < 70

-- 2. Query to Calculate Average Exam Scores by Gender
	
SELECT * FROM student_data

SELECT 
Gender,
AVG(Exam_Score)
From student_data
group by Gender

-- 3. Query to Find Students Involved in Extracurricular Activities and Their Exam Scores
	
SELECT * FROM student_data

SELECT 
Roll_number,
Extracurricular_Activities,
Exam_Score
From student_data
Where 
Extracurricular_Activities = 'Yes'

-- 4. Query to List Students Who Have Access to Internet and Tutoring Sessions
	
SELECT * FROM student_data

Select 
Roll_number,
Internet_Access,
Tutoring_Sessions
From student_data
Where 
Internet_Access = 'Yes' And
Tutoring_Sessions > 0

-- 5. Query to Count the Number of Students by School Type
	
SELECT * FROM student_data

SELECT 
School_Type,
Count(Roll_number) as Total_number_of_students
From student_data
Group by School_type


-- 6. Query to Identify Students with High Family Income and High Exam Scores
	
SELECT * FROM student_data

SELECT
Roll_number,
Family_Income,
Exam_Score
From
student_data
Where
Family_Income = 'High' And
Exam_Score >= 85

-- 7. Query to Show Students Who Participate in Physical Activities and Get Adequate Sleep Hours

SELECT * FROM student_data

SELECT
Roll_number,
Physical_activity,
Sleep_hours
From
student_data
Where
Physical_activity >= 1 And
Sleep_Hours >= 8

-- 8. Query to Calculate Average Attendance for Students Based on Parental Education Level

SELECT * FROM student_data

SELECT
AVG(Attendance),
Parental_Education_Level
From
student_data
Group by Parental_Education_Level

-- 9. Query to Find Students Who Travel More Than 10 km to School and Have Low Exam Scores
	
SELECT * FROM student_data

Select
Roll_number,
Distance_from_Home,
Exam_Score
From student_data
Where 
Distance_from_Home = 'Far'
And Exam_Score < 65

-- 10. Query to Display Students with Learning Disabilities and Their Exam Scores

SELECT * FROM student_data

SELECT 
Roll_number,
Learning_Disabilities,
Exam_Score
From student_data
Where Learning_Disabilities = 'Yes'

/* 1. Using WHEN THEN Clause
Question: Write a query to classify students' exam scores into categories:
High: Exam_Score >= 80
Average: Exam_Score between 50 and 79
Low: Exam_Score < 50 */

SELECT * FROM student_data

SELECT 
Roll_number, 
Exam_Score,
Case 
When Exam_Score >= 80 then 'High'
When Exam_Score between 50 and 79 then 'Average'
When Exam_Score < 50 then 'Low'
End AS Score_Category
From student_data


/* Create a table named Teachers with the following columns:

Teacher_ID (Primary Key)
Teacher_Name (VARCHAR)
Subject (VARCHAR)
Experience_Years (INT)

Write the SQL query to define the table structure with Teacher_ID as the primary key. */

SELECT * FROM student_data

CREATE Table Teacher_Data (
Teacher_ID integer (10) Not null Primary Key,
Teacher_Name VARCHAR (25) Not null,
Subject_ VARCHAR (10),
Experience_Years INT (2) Not null)

INSERT INTO Teacher_Data
	(Teacher_ID, Teacher_Name, Subject_, Experience_Years) 
Values 
(1, 'Akriti', 'English', 2),
(2, 'Seema', 'Hindi', 6),
(3, 'Geeta Bali', 'Sanskrit', 10),
(4, 'Anita', 'Maths', 11),
(5, 'Akriti', 'Science', 7),
(6, 'Rooma', 'Art', 8)

Select * from Teacher_Data

/* Write a query to find students whose Motivation_Level is either 'High' or 'Low' 
and who have Internet_Access like 'Y%'.
Display Roll_number, Motivation_Level, Internet_Access, and Exam_Score */

Select 
Roll_number,
Motivation_Level,
Internet_Access,
Exam_Score
From student_data
Where (Motivation_Level = 'High' Or 'Low') and Internet_Access like 'Y%'

/*Write a query to display Roll_number, Family_Income, Attendance, and Exam_Score for students whose 
Attendance is between 65 and 80.
*/

SELECT * FROM student_data

SELECT
Roll_number,
Family_Income,
Attendance
From student_data
Where Attendance between 65 and 80

/* Question: Write a query to list all distinct School_Type values from the Students table. */

SELECT distinct 
School_Type
From student_data

/* Write a query to calculate the average Exam_Score for each School_Type
 where the average score is greater than 70. Use the HAVING clause to filter the results.
 */

Select
avg(Exam_Score), 
School_Type
From student_data
group by School_type


/* Write a query to find the total number of students, average exam score,
and highest exam score for each Gender.
Display the Gender, Total_Students, Average_Score, and Highest_Score. */

Select 
Gender,
Count(Roll_number) as total_number_of_students,
AVG(Exam_Score),
Max(exam_Score)
From student_data
Group by Gender
