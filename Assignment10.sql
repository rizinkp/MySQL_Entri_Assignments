#create database name as "Institute"

create database Institute;

use Institute;

#1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
-- Create the teachers table
CREATE TABLE Teachers (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    Experience INT NOT NULL,
	Salary DECIMAL(10, 2) NOT NULL
);

-- Insert 8 rows into the teachers table
INSERT INTO teachers (Name, Subject, Experience, Salary) VALUES
('Marco John', 'Biology', 5, 30000.00),
('Jane Doe', 'Physics', 8, 55000.00),
('Alice Johnson', 'Chemistry', 5, 50000.00),
('Mark Brown', 'Biology', 12, 62000.00),
('Emily Davis', 'English', 7, 53000.00),
('Michael Wilson', 'History', 9, 54000.00),
('Sarah Lee', 'Geography', 6, 52000.00),
('Robert Taylor', 'Computer Science', 4, 48000.00);

-- Verify the inserted rows
SELECT * FROM teachers;

#2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero. 
DELIMITER $$
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON Teachers
FOR EACH ROW
BEGIN
	IF(New.Salary <= 0) THEN 
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT = 'Salary cannot be negative and zero';
	END IF;
END$$ 
DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary) VALUES
('John Smith', 'Mathematics', 10, 0);

#3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log 
	#when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, 
    #timestamp -> time at which the new row has got inserted. 
    
CREATE TABLE Teachers_Log (
    Teacher_Id INT,
    Trigger_Action VARCHAR(100) NOT NULL,
    Create_Timestamp datetime NOT NULL    
);

select * from Teachers_Log; 

DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON Teachers
FOR EACH ROW
BEGIN
	insert into teachers_log(Teacher_Id, Trigger_Action, Create_Timestamp) VALUES(New.Id, 'AFTER-INSERT', current_timestamp());
END$$
DELIMITER ;

-- Insert 3 more rows into the teachers table
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Linda Harris', 'Philosophy', 15, 65000.00),
('David Martin', 'Economics', 11, 58000.00),
('Sophia Clark', 'Art', 3, 45000.00);

-- Verify the updated table
SELECT * FROM teachers_log;


#4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.
DELIMITER $$
CREATE TRIGGER before_delete_trigger
BEFORE DELETE ON Teachers
FOR EACH ROW
BEGIN
	IF(OLD.Experience > 10) THEN
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT = 'Teacher cannot be deleted who experiece greater than 10 years!';
    END IF;
END$$
DELIMITER ;

DELETE FROM Teachers where Id = 4;
		
#5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON Teachers
FOR EACH ROW
BEGIN
	insert into teachers_log(Teacher_Id, Trigger_Action, Create_Timestamp) VALUES(old.Id, 'AFTER-DELETE', current_timestamp());
END$$
DELIMITER ;


DELETE FROM Teachers where Id = 11;

SELECT * FROM Teachers_log where Teacher_Id = 11 and Trigger_Action = 'AFTER-DELETE';
