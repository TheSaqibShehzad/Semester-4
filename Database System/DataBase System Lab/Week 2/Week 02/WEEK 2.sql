CREATE TABLE student(
	RegistrationNumber VARCHAR(20),
	name VARCHAR(20),
	Department VARCHAR(20),
	Session INT,
	CGPA FLOAT(10),
	Address VARCHAR(50)
);

INSERT INTO student VALUES('2021-CS-192','Nasir Kamal','Computer Science',2021,3.7,'VPO Dheedwal')

SELECT * FROM student

UPDATE student
SET name = 'Saqib Awan'
WHERE name = 'Saqib Shehzad';