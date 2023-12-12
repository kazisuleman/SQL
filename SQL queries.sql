--Assignment – SQL Queries 107
CREATE DATABASE SQLQUERY
USE SQLQUERY

CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

SELECT * FROM studies

INSERT INTO studies values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

SELECT * FROM software

INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

SELECT * FROM programmer

INSERT INTO programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer

-- 1. Find out the selling cost AVG for packages developed in Pascal. 
SELECT AVG(SCOST) AS AVGCOST FROM SOFTWARE WHERE DEVELOPIN = 'PASCAL'

-- 2. Display Names, Ages of all Programmers. 
SELECT PNAME AS NAME , DATEDIFF(YY,DOB,GETDATE()) AS AGE FROM programmer

-- 3. Display the Names of those who have done the DAP Course. 
SELECT PNAME AS NAME , COURSE FROM STUDIES WHERE COURSE = 'DAP'

-- 4. Display the Names and Date of Births of all Programmers Born in January.
SELECT PNAME AS NAME, DOB FROM programmer WHERE MONTH(DOB) = 1

-- 5. What is the Highest Number of copies sold by a Package?
SELECT PNAME,TITLE, SOLD from software where sold =(SELECT MAX(SOLD) FROM software)

-- 6. Display lowest course Fee. 
SELECT MIN(COURSE_FEE) FROM STUDIES
SELECT PNAME, INSTITUTE, COURSE, FROM COURSE_FEE WHERE COURSE = (SELECT MIN(COURSE_FEE) FROM STUDIES)

-- 7. How many programmers done the PGDCA Course?
SELECT COUNT(PNAME) FROM STUDIES WHERE COURSE = 'PGDCA'
SELECT COUNT(*) FROM STUDIES WHERE COURSE = 'PGDCA'

-- 8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST*SOLD) FROM software WHERE DEVELOPIN = 'C'

-- 9. Display the Details of the Software Developed by Ramesh. 
select * from software where pname = 'RAMESH'
SELECT PNAME,TITLE, DEVELOPIN from software where PNAME =(SELECT PNAME ='RAMESH') FROM software)

-- 10. How many Programmers Studied at Sabhari? 
SELECT COUNT(PNAME) FROM STUDIES WHERE INSTITUTE = 'SABHARI'

-- 11. Display details of Packages whose sales crossed the 2000 Mark. 
SELECT * FROM SOFTWARE WHERE (SOLD*SCOST) >= 2000

-- 12. Display the Details of Packages for which Development Cost have been recovered. 
SELECT * FROM SOFTWARE WHERE (SOLD*SCOST) > DCOST

-- 13. What is the cost of the costliest software development in Basic? 
select MAX(DCOST) FROM software where DEVELOPIN ='BASIC'

-- 14. How many Packages Developed in DBASE? 
SELECT COUNT(PNAME) FROM SOFTWARE WHERE DEVELOPIN = 'DBASE'

-- 15. How many programmers studied in Pragathi?
SELECT COUNT(PNAME) FROM STUDIES WHERE INSTITUTE = 'Pragathi'

-- 16. How many Programmers Paid 5000 to 10000 for their course? 
SELECT COUNT(*) FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000

-- 17. What is AVG Course Fee
SELECT AVG(COURSE_FEE) FROM STUDIES

--18. Display the details of the Programmers Knowing C.
SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C'

--19. How many Programmers know either COBOL or PASCAL.
SELECT COUNT(*) FROM PROGRAMMER WHERE PROF1 = 'COBOL' OR PROF1 = 'PASCAL' OR PROF2 = 'COBOL' OR PROF2 = 'PASCAL'

--20. How many Programmers Don’t know PASCAL and C

SELECT * FROM PROGRAMMER WHERE NOT (PROF1 = 'PASCAL' OR PROF2 = 'C' OR PROF2 = 'PASCAL' OR PROF2 = 'C')

SELECT COUNT(PNAME) FROM programmer WHERE PROF1 NOT IN ('C', 'PASCAL') AND PROF2 NOT IN ('C', 'PASCAL')

--21. How old is the Oldest Male Programmer. 
SELECT MAX(DATEDIFF(YY,DOB,GETDATE())) AS MAX_AGE FROM programmer WHERE GENDER = 'M'

--22. What is the AVG age of Female Programmers? 
SELECT AVG(DATEDIFF(YY,DOB,GETDATE()))  AS AVG_F_AGE FROM programmer WHERE GENDER = 'F'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
SELECT PNAME, (DATEDIFF(YY,DOB,GETDATE()))  AS YEARS_OF_EXPERIENCE FROM programmer WHERE GENDER = 'F'
ORDER BY (DATEDIFF(YY,DOB,GETDATE())) DESC

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
SELECT PNAME FROM PROGRAMMER WHERE DATENAME(month, GETDATE()) = DATENAME(month, DOB)

--25. How many Female Programmers are there? 
SELECT COUNT(PNAME) AS No_of_Female_Programmers FROM programmer WHERE GENDER = 'F'

--26. What are the Languages studied by Male Programmers.
SELECT PNAME, PROF1, PROF2 FROM programmer WHERE GENDER = 'M'

--27. What is the AVG Salary? 
SELECT AVG(SALARY) AS AVG_SALARY FROM programmer

--28. How many people draw salary 2000 to 4000?
SELECT PNAME AS PNAME_SALARY_2000_4000, SALARY FROM programmer WHERE SALARY >= 2000 AND SALARY <=4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 
SELECT PNAME AS PNAME, PROF1, PROF2 FROM programmer WHERE PROF1 NOT IN  ('CLIPPER', 'COBOL', 'PASCAL') AND PROF2 NOT IN  ('CLIPPER', 'COBOL', 'PASCAL')

--30. Display the Cost of Package Developed By each Programmer. 
SELECT PNAME, SUM(DCOST) AS Cost_of_Package FROM software
GROUP BY PNAME

--31. Display the sales values of the Packages Developed by the each Programmer. 
SELECT PNAME, SUM(SCOST*SOLD) AS SalesV_of_Package FROM software
GROUP BY PNAME

--32. Display the Number of Packages sold by Each Programmer.
SELECT PNAME, SUM(SOLD) AS Sold_Package FROM software GROUP BY PNAME

--33. Display the sales cost of the packages Developed by each Programmer Language wise
SELECT DEVELOPIN, SUM(SCOST) AS DEVELOPIN_SCOST FROM software GROUP BY DEVELOPIN

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT DEVELOPIN, AVG(DCOST) AS AVG_Development_Cost, AVG(SCOST) AS AVG_Selling_Cost , AVG(SCOST/NULLIF(SOLD,0)) AS AVG_Price_Per_copy FROM software GROUP BY DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select PNAME, MAX(DCOST) AS MAXIMUM, MIN(DCOST) AS MINIMUM FROM software GROUP BY PNAME

--36. Display each institute name with number of Courses, Average Cost per Course.
SELECT INSTITUTE, COUNT(COURSE) AS NO_OF_COURSE, AVG(COURSE_FEE) AS AVG_COURSE_FEE FROM studies GROUP BY INSTITUTE

--37. Display each institute Name with Number of Students. 
SELECT INSTITUTE, COUNT(PNAME) AS NO_OF_STUDENTS FROM studies GROUP BY INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also. 
SELECT PNAME AS PROGRAMMERS, GENDER AS GENDERS FROM programmer ORDER BY GENDER DESC

--40. Display the Number of Packages in Each Language Except C and C++.
SELECT DEVELOPIN, COUNT(TITLE) AS TITLE FROM software  WHERE DEVELOPIN <> 'C' AND DEVELOPIN <> 'C++' GROUP BY DEVELOPIN

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT * FROM software WHERE DCOST <= 1000

--42. Display AVG Difference between SCOST, DCOST for Each Package.
SELECT TITLE, AVG(SCOST), AVG(DCOST) FROM software GROUP BY (TITLE)

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.


SELECT * FROM software
SELECT * FROM studies
SELECT * FROM programmer

---44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
SELECT * FROM programmer
select PNAME, MAX(SALARY) AS MAXIMUM, MIN(SALARY) AS MINIMUM FROM programmer --GROUP BY PNAME

--45. Who is the Highest Paid C Programmers?
SELECT * FROM programmer
SELECT PNAME* from programmer where salary = max

46. Who is the Highest Paid Female COBOL Programmer?
47. Display the names of the highest paid programmers for each Language.
48. Who is the least experienced Programmer.
49. Who is the most experienced male programmer knowing PASCAL.
50. Which Language is known by only one Programmer?
51. Who is the Above Programmer Referred in 50?
52. Who is the Youngest Programmer knowing DBASE?
53. Which Female Programmer earning more than 3000 does not know C, C++,
ORACLE or DBASE?
54. Which Institute has most number of Students?
55. What is the Costliest course?
56. Which course has been done by the most of the Students?
57. Which Institute conducts costliest course.
58. Display the name of the Institute and Course, which has below AVG course fee.
59. Display the names of the courses whose fees are within 1000 (+ or -) of the
Average Fee,
60. Which package has the Highest Development cost?
61. Which course has below AVG number of Students?
62. Which Package has the lowest selling cost?
63. Who Developed the Package that has sold the least number of copies?
64. Which language has used to develop the package, which has the highest
sales amount?
65. How many copies of package that has the least difference between
development and selling cost where sold.
66. Which is the costliest package developed in PASCAL.
67. Which language was used to develop the most number of Packages.
68. Which programmer has developed the highest number of Packages?
 MS SQL Certification Training
support@intellipaat.com - +91-7022374614 - US: 1-800-216-8930 (Toll Free)
69. Who is the Author of the Costliest Package?
70. Display the names of the packages, which have sold less than the AVG
number of copies.
71. Who are the authors of the Packages, which have recovered more than double the
Development cost?
72. Display the programmer Name and the cheapest packages developed by them in
each language.
73. Display the language used by each programmer to develop the Highest
Selling and Lowest-selling package.
74. Who is the youngest male Programmer born in 1965?
75. Who is the oldest Female Programmer who joined in 1992?
76. In which year was the most number of Programmers born.
77. In which month did most number of programmers join?
78. In which language are most of the programmer’s proficient.
79. Who are the male programmers earning below the AVG salary of
Female Programmers?
80. Who are the Female Programmers earning more than the Highest Paid?
81. Which language has been stated as the proficiency by most of the Programmers?
82. Display the details of those who are drawing the same salary.
83. Display the details of the Software Developed by the Male Programmers Earning
More than 3000/-.
84. Display the details of the packages developed in Pascal by the Female
Programmers.
85. Display the details of the Programmers who joined before 1990.
86. Display the details of the Software Developed in C By female programmers of
Pragathi.
87. Display the number of packages, No. of Copies Sold and sales value of
each programmer institute wise.
88. Display the details of the software developed in DBASE by Male Programmers, who
belong to the institute in which most number of Programmers studied.
89. Display the details of the software Developed by the male programmers Born
before 1965 and female programmers born after 1975.
90. Display the details of the software that has developed in the language which is
neither the first nor the second proficiency of the programmers.
91. Display the details of the software developed by the male students of Sabhari.
92. Display the names of the programmers who have not developed any packages.
93. What is the total cost of the Software developed by the programmers of Apple?
94. Who are the programmers who joined on the same day?
95. Who are the programmers who have the same Prof2?
96. Display the total sales value of the software, institute wise.
97. In which institute does the person who developed the costliest package studied.
98. Which language listed in prof1, prof2 has not been used to develop any package.
99. How much does the person who developed the highest selling package earn and
what course did HE/SHE undergo.
 MS SQL Certification Training
support@intellipaat.com - +91-7022374614 - US: 1-800-216-8930 (Toll Free)
100. What is the AVG salary for those whose software sales is more than 50,000/-.
101. How many packages were developed by students, who studied in institute that
charge the lowest course fee?
102. How many packages were developed by the person who developed the
cheapest package, where did HE/SHE study?
103. How many packages were developed by the female programmers earning more
than the highest paid male programmer?
104. How many packages are developed by the most experienced programmer form
BDPS.
105. List the programmers (form the software table) and the institutes they studied.
106. List each PROF with the number of Programmers having that PROF and the
number of the packages in that PROF.
107. List the programmer names (from the programmer table) and No. Of Packages
each has developed. 