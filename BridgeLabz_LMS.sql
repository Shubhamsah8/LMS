-- Creating the database
CREATE DATABASE IF NOT EXISTS BridgeLabz;

-- Using the created database
USE BridgeLabz;
----------------------------------------------------------- CREATING TABLES ------------------------------------------------
----------------------------------------------------- CREATING TBALE USER DETAILS ------------------------------------------
-- Create the User details table
CREATE TABLE IF NOT EXISTS `UserDetails` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `Password` VARCHAR(255) NOT NULL,
    `contact_number` VARCHAR(15) NOT NULL,
    `verified` BOOLEAN NOT NULL,
    `creator_stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `creator_user` VARCHAR(255) NOT NULL
);

SELECT * FROM UserDetails;
ALTER TABLE UserDetails
MODIFY COLUMN verified TINYINT(2);

-- Insert multiple values into the "UserDetails" table
INSERT INTO `UserDetails` (`email`, `first_name`, `last_name`, `Password`, `contact_number`, `verified`, `creator_user`)
VALUES
('prakash892@gmail.com', 'Prakash', 'Tou', 'Youe;jroeih', '69984623598', 0, 'student'),
('neelamgup342@gmail.com', 'Neelam', 'Upou', ';ihodhefe', '4598635987', 1, 'student'),
('kushbook@gmail.com', 'Kushboo', 'huyk', 'dlkjhfk', '8996848965', 1, 'student'),
('mrunal321@gmail.com', 'Mrunal', 'Youo', 'dhjhl56', '8798654987', 2, 'student'),
('arjungun123@gmail.com', 'Arjun', 'Gumn', 'soierjlf56', '4659879865', 1, 'student'),
('shweta453@gmail.com', 'Shweta', 'juin', 'dfeehr25', '9876597768', 0, 'student');
SELECT * FROM UserDetails;

----------------------------------------------- CREATING TABLE HIRED CANDIDATE -------------------------------------
-- Create the "Hired Candidate" table
CREATE TABLE IF NOT EXISTS `HiredCandidate` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `First_Name` VARCHAR(255) NOT NULL,
    `Middle_Name` VARCHAR(255),
    `Last_Name` VARCHAR(255) NOT NULL,
    `EmailId` VARCHAR(255) NOT NULL,
    `Hired_City` VARCHAR(255) NOT NULL,
    `Degree` VARCHAR(255) NOT NULL,
    `Hired_Date` DATE NOT NULL,
    `Mobile_Number` VARCHAR(15) NOT NULL,
    `Permanent_Pincode` VARCHAR(10) NOT NULL,
    `Hired_Lab` VARCHAR(255) NOT NULL,
    `Attitude` VARCHAR(255),
    `Communication_Remark` VARCHAR(255),
    `Knowledge_Remark` VARCHAR(255),
    `Aggregate_Remark` VARCHAR(255),
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User_Id` INT NOT NULL,
    FOREIGN KEY (`Creator_User_Id`) REFERENCES `UserDetails`(`Id`)
);

-- Insert multiple values into the "HiredCandidate" table
INSERT INTO `HiredCandidate` (`First_Name`, `Middle_Name`, `Last_Name`, `EmailId`, `Hired_City`, `Degree`, `Hired_Date`, `Mobile_Number`, `Permanent_Pincode`, `Hired_Lab`, `Attitude`, `Communication_Remark`, `Knowledge_Remark`, `Aggregate_Remark`, `Status`, `Creator_User_Id`)
VALUES
('Prakash', 'J.', 'Tou', 'prakash892@gmail.com', 'Mumbai', 'B.E', '2024-01-15', '69984623598', '400097', 'QK', 'Positive', 'Good', 'Medium', 'Good Candidate', 'Active', 5),
('Neelam', 'N.', 'Upou', 'neelamgup342@gmail.com', 'Banglore', 'M.Tech', '2024-01-15', '4598635987', '67890', 'LB', 'Positive', 'Good', 'Medium', 'Good Candidate', 'Active', 6),
('Kushboo', 'R.', 'huyk', 'kushbook@gmail.com', 'Mumbai', 'B.E', '2024-01-15', '8996848965', '45678', 'QK', 'Positive', 'Good', 'Medium', 'Good Candidate', 'Active', 7),
('Mrunal', 'D', 'Youo', 'mrunal321@gmail.com', 'Mumbai', 'B.E', '2024-01-15', '8798654987', '96499', 'QK', 'Positive', 'Good', 'Medium', 'Good Candidate', 'Active', 8);
SELECT * FROM HiredCandidate;

----------------------------------------------------------- CREATING TABLE FELLOWSHIP CANDIDATE -----------------------------------------
-- Create the "Fellowship Candidate" table
CREATE TABLE IF NOT EXISTS `FellowshipCandidate` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `CIC_ID` VARCHAR(20) NOT NULL,
    `First_Name` VARCHAR(255) NOT NULL,
    `Middle_Name` VARCHAR(255),
    `Last_Name` VARCHAR(255) NOT NULL,
    `EmailId` VARCHAR(255) NOT NULL,
    `Hired_City` VARCHAR(255) NOT NULL,
    `Degree` VARCHAR(255) NOT NULL,
    `Hired_Date` DATE NOT NULL,
    `Mobile_Number` VARCHAR(15) NOT NULL,
    `Permanent_Pincode` VARCHAR(10) NOT NULL,
    `Hired_Lab` VARCHAR(255) NOT NULL,
    `Attitude` VARCHAR(255),
    `Communication_Remark` VARCHAR(255),
    `Knowledge_Remark` VARCHAR(255),
    `Aggregate_Remark` VARCHAR(255),
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    `Birth_Date` DATE NOT NULL,
    `Is_Birth_Date_Verified` BOOLEAN NOT NULL,
    `Parent_Name` VARCHAR(255),
    `Parent_Occupation` VARCHAR(255),
    `Parents_Mobile_Number` VARCHAR(15),
    `Parents_Annual_Salary` DECIMAL(10, 2),
    `Local_Address` TEXT,
    `Permanent_Address` TEXT,
    `Photo_Path` VARCHAR(255),
    `Joining_Date` DATE NOT NULL,
    `Candidate_Status` VARCHAR(50) NOT NULL,
    `Personal_Information` TEXT,
    `Bank_Information` TEXT,
    `Educational_Information` TEXT,
    `Document_Status` VARCHAR(50) NOT NULL,
    `Remark` TEXT,
    FOREIGN KEY (`Creator_User`) REFERENCES `UserDetails`(`Id`)
);

-- Insert values into the "FellowshipCandidate" table
INSERT INTO `FellowshipCandidate` (
    `CIC_ID`, `First_Name`, `Middle_Name`, `Last_Name`, `EmailId`, `Hired_City`, `Degree`, `Hired_Date`, `Mobile_Number`,
    `Permanent_Pincode`, `Hired_Lab`, `Attitude`, `Communication_Remark`, `Knowledge_Remark`, `Aggregate_Remark`, 
    `Creator_User`, `Birth_Date`, `Is_Birth_Date_Verified`, `Parent_Name`, `Parent_Occupation`, `Parents_Mobile_Number`,
    `Parents_Annual_Salary`, `Local_Address`, `Permanent_Address`, `Photo_Path`, `Joining_Date`, `Candidate_Status`, 
    `Personal_Information`, `Bank_Information`, `Educational_Information`, `Document_Status`, `Remark`
) VALUES
('CIC49598-989', 'Aryan', 'D', 'Wadle', 'aryan344@gmail.com', 'Mumbai', 'B.E', '2024-01-15', '8779817254', '400097', 'QK', 
 'Positive', 'Good', 'Medium', 'Good Candidate', 1, '2000-01-01', true, 'Parent1', 'Engineer', '9876543210', 800000.00, 
 'Local Address 1', 'Permanent Address 1', 'photo1.jpg', '2024-01-15', 'Active', 'Personal Info 1', 'Bank Info 1', 
 'Educational Info 1', 'Verified', 'Remark 1'),
('CIC56697-365', 'Prakash', 'J.', 'Tou', 'prakash892@gmail.com', 'Mumbai', 'M.Tech', '2024-01-15', '9876543210', '67890', 'LB', 
 'Positive', 'Good', 'Medium', 'Good Candidate', 2, '2001-02-02', true, 'Parent2', 'Doctor', '9876543210', 900000.00, 
 'Local Address 2', 'Permanent Address 2', 'photo2.jpg', '2024-01-15', 'Active', 'Personal Info 2', 'Bank Info 2', 
 'Educational Info 2', 'Verified', 'Remark 2'),
('CIC46598-798', 'Neelam', 'N.', 'Upou', 'neelamgup342@gmail.com', 'Bangalore', 'B.E', '2024-01-15', '6986579836', '45678', 'QK', 
 'Positive', 'Good', 'Medium', 'Good Candidate', 3, '2002-03-03', true, 'Parent3', 'Artist', '9876543210', 700000.00, 
 'Local Address 3', 'Permanent Address 3', 'photo3.jpg', '2024-01-15', 'Active', 'Personal Info 3', 'Bank Info 3', 
 'Educational Info 3', 'Verified', 'Remark 3'),
('CIC97869-264', 'Mrunal', 'D', 'Youo', 'mrunal321@gmail.com', 'Mumbai', 'B.E', '2024-01-15', '9968789656', '96499', 'QK', 
 'Positive', 'Good', 'Medium', 'Good Candidate', 4, '2003-04-04', true, 'Parent4', 'Teacher', '9876543210', 600000.00, 
 'Local Address 4', 'Permanent Address 4', 'photo4.jpg', '2024-01-15', 'Active', 'Personal Info 4', 'Bank Info 4', 
 'Educational Info 4', 'Verified', 'Remark 4');
 SELECT * FROM FellowshipCandidate;

----------------------------------------------------- CREATING TABLE CANDIDATE BANK DETAILS ------------------------------------------
-- Create the "Candidate Bank Details" table
CREATE TABLE IF NOT EXISTS `CandidateBankDetails` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Candidate_Id` INT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Account_Number` VARCHAR(20) NOT NULL,
    `Is_Account_Num_Verified` BOOLEAN NOT NULL,
    `Ifsc_Code` VARCHAR(15) NOT NULL,
    `Is_Ifsc_Code_Verified` BOOLEAN NOT NULL,
    `Pan_Number` VARCHAR(10) NOT NULL,
    `Is_Pan_Number_Verified` BOOLEAN NOT NULL,
    `Aadhaar_Num` VARCHAR(12) NOT NULL,
    `Is_Aadhaar_Num_Verified` BOOLEAN NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User_Id` INT NOT NULL,
    FOREIGN KEY (`Candidate_Id`) REFERENCES `UserDetails`(`Id`),
    FOREIGN KEY (`Creator_User_Id`) REFERENCES `UserDetails`(`Id`)
);

-- Find the name of the foreign key constraint
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'CandidateBankDetails'
AND COLUMN_NAME = 'Creator_User_Id';

ALTER TABLE CandidateBankDetails
DROP FOREIGN KEY candidatebankdetails_ibfk_2;

-- Drop the Candidate_Id column
ALTER TABLE CandidateBankDetails
DROP COLUMN Creator_User_Id;

-- Add a new column with the desired name and data type
ALTER TABLE CandidateBankDetails
ADD COLUMN Creator_User VARCHAR(50);


-- Insert values into the "CandidateBankDetails" table
INSERT INTO `CandidateBankDetails` (
    `Candidate_Id`, `Name`, `Account_Number`, `Is_Account_Num_Verified`, 
    `Ifsc_Code`, `Is_Ifsc_Code_Verified`, `Pan_Number`, `Is_Pan_Number_Verified`, 
    `Aadhaar_Num`, `Is_Aadhaar_Num_Verified`, `Creator_User`
) VALUES
    (1, 'Shubham M. Sah', '36597981449', true, 'SBI0000023', true, 'MCJPS8443J', true, '23659897986', true, 'student'),
    (2, 'Ashish B. Smith', '465989413164', true, 'HDFC00326', true, 'SNDI6559U', true, '23664644965', true, 'student'),
    (3, 'Rihal C. Toj', '032164654444', true, 'SBI0236', true, 'NJIO6598A', true, '1326564996', true, 'student'),
    (7, 'Kushboo R. huyk', '97959646449', true, 'ICICI00036', true, 'HIOI0001S', true, '323649895659', true, 'student'),
    (9, 'Arjun D. Gumn', '00316644334', true, 'PNBC0013', true, 'BHNU1456G', true, '89897656649', true, 'student'),
    (10, 'Shweta B. juin', '031650000066', true, 'SBI00035', true, 'NHOI2367U', true, '13265979564', true, 'student');

SELECT * FROM CandidateBankDetails;

----------------------------------------------- CREATING TABLE CANDIDATE QUALIFICATION ----------------------------------------
-- Create the "Candidate Qualification" table
CREATE TABLE IF NOT EXISTS `CandidateQualification` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Candidate_Id` INT NOT NULL,
    `Diploma` VARCHAR(255),
    `Degree_Name` VARCHAR(255) NOT NULL,
    `Is_Degree_Name_Verified` BOOLEAN NOT NULL,
    `Employee_Discipline` VARCHAR(255),
    `Is_Employee_Discipline_Verified` BOOLEAN NOT NULL,
    `Passing_Year` INT NOT NULL,
    `Is_Passing_Year_Verified` BOOLEAN NOT NULL,
    `Aggr_Percentage` DECIMAL(5, 2) NOT NULL,
    `Is_Aggr_Percentage_Verified` BOOLEAN NOT NULL,
    `Final_Year_Percentage` DECIMAL(5, 2),
    `Is_Final_Year_Percentage_Verified` BOOLEAN NOT NULL,
    `Training_Institute` VARCHAR(255),
    `Is_Training_Institute_Verified` BOOLEAN NOT NULL,
    `Training_Duration_Month` INT,
    `Is_Training_Duration_Month_Verified` BOOLEAN NOT NULL,
    `Other_Training` TEXT,
    `Is_Other_Training_Verified` BOOLEAN NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User_Id` INT NOT NULL,
    FOREIGN KEY (`Candidate_Id`) REFERENCES `UserDetails`(`Id`),
    FOREIGN KEY (`Creator_User_Id`) REFERENCES `UserDetails`(`Id`)
);

-- Find the name of the foreign key constraint
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'CandidateQualification'
AND COLUMN_NAME = 'Creator_User_Id';

ALTER TABLE CandidateQualification
DROP FOREIGN KEY candidatequalification_ibfk_2;

-- Drop the Candidate_Id column
ALTER TABLE CandidateQualification
DROP COLUMN Creator_User_Id;

-- Add a new column with the desired name and data type
ALTER TABLE CandidateQualification
ADD COLUMN Creator_User VARCHAR(50);

-- Inserting into the Candidate Qualification table.
INSERT INTO `CandidateQualification` (
    `Candidate_Id`, `Diploma`, `Degree_Name`, `Is_Degree_Name_Verified`, 
    `Employee_Discipline`, `Is_Employee_Discipline_Verified`, `Passing_Year`, `Is_Passing_Year_Verified`, 
    `Aggr_Percentage`, `Is_Aggr_Percentage_Verified`, `Final_Year_Percentage`, `Is_Final_Year_Percentage_Verified`, 
    `Training_Institute`, `Is_Training_Institute_Verified`, `Training_Duration_Month`, `Is_Training_Duration_Month_Verified`, 
    `Other_Training`, `Is_Other_Training_Verified`, `Creator_Stamp`, `Creator_User`
) VALUES
    (1, null, 'B.E', true, 'Engineering', true, 2022, true, 75.50, true, 80.00, true, 'Training Institute A', true, 6, true, 'Other Training A', true, '2024-01-15 10:30:00', 'student'),
    (2, null, 'M.TECH', true, 'Engineering', true, 2023, true, 82.00, true, 85.50, true, 'Training Institute B', true, 8, true, 'Other Training B', true, '2024-01-15 11:15:00', 'student'),
    (3, null, 'B.E', true, 'Engineering', true, 2021, true, 68.25, true, 72.75, true, 'Training Institute C', true, 7, true, 'Other Training C', true, '2024-01-15 12:00:00', 'student'),
    (4, null, 'B.E', true, 'Engineering', true, 2022, true, 89.00, true, NULL, false, 'Training Institute D', true, 9, true, 'Other Training D', true, '2024-01-15 13:45:00', 'student'),
    (5, null, 'B.E', true, 'Engineering', true, 2020, true, 92.75, true, 94.50, true, 'Training Institute E', true, 12, true, 'Other Training E', true, '2024-01-15 14:30:00', 'student'),
    (6, null, 'M.TECH', true, 'Engineering', true, 2021, true, 78.50, true, 82.25, true, 'Training Institute F', true, 10, true, 'Other Training F', true, '2024-01-15 15:15:00', 'student'),
    (7, null, 'B.E', true, 'Engineering', true, 2023, true, 85.00, true, 88.75, true, 'Training Institute G', true, 11, true, 'Other Training G', true, '2024-01-15 16:00:00', 'student'),
    (8, null, 'B.E', true, 'Engineering', true, 2020, true, 95.25, true, NULL, false, 'Training Institute H', true, 14, true, 'Other Training H', true, '2024-01-15 16:45:00', 'student'),
    (9, null, 'B.E', true, 'Engineering', true, 2022, true, 71.75, true, 75.00, true, 'Training Institute I', true, 8, true, 'Other Training I', true, '2024-01-15 17:30:00', 'student'),
    (10, null, 'B.E', true, 'Engineering', true, 2023, true, 88.00, true, 90.50, true, 'Training Institute J', true, 9, true, 'Other Training J', true, '2024-01-15 18:15:00', 'student');

SELECT * FROM CandidateQualification;

----------------------------------------------- CREATING CANDIDATE DOCUMENTS TABLE ------------------------------------------
-- Create the "Candidate Documents" table
CREATE TABLE IF NOT EXISTS `CandidateDocuments` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Candidate_Id` INT NOT NULL,
    `Doc_Type` VARCHAR(50) NOT NULL,
    `Doc_Path` VARCHAR(255) NOT NULL,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User_Id` INT NOT NULL,
    FOREIGN KEY (`Candidate_Id`) REFERENCES `UserDetails`(`Id`),
    FOREIGN KEY (`Creator_User_Id`) REFERENCES `UserDetails`(`Id`)
);

ALTER TABLE CandidateDocuments
DROP FOREIGN KEY candidatedocuments_ibfk_2;

-- Drop the Candidate_Id column
ALTER TABLE CandidateDocuments
DROP COLUMN Creator_User_Id;

-- Add a new column with the desired name and data type
ALTER TABLE CandidateDocuments
ADD COLUMN Creator_User VARCHAR(50);

-- Insert values into the "CandidateDocuments" table
INSERT INTO `CandidateDocuments` (
    `Candidate_Id`, `Doc_Type`, `Doc_Path`, `Status`, `Creator_User`
) VALUES
(1, 'CV', '/documents/resume_shubham.pdf', 'Verified', 'student'),
(2, 'CV', '/documents/cv_ashish.pdf', 'Pending', 'student'),
(3, 'CV', '/documents/transcript_rihal.pdf', 'Verified', 'student'),
(7, 'CV', '/documents/kushboo_ai.pdf', 'Verified', 'student'),
(9, 'CV', '/documents/arjun_dv.pdf', 'Verified', 'student'),
(10, 'CV', '/documents/shweta_vv.pdf', 'Verified', 'student');

-------------------------------------- CREATING THE COMPANY TABLE--------------------------------------------
-- Create the Company table ---
CREATE TABLE IF NOT EXISTS `Company` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Address` TEXT,
    `Location` VARCHAR(255),
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL
);

ALTER TABLE Company
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Company" table
INSERT INTO `Company` (`Name`, `Address`, `Location`, `Status`, `Creator_User`)
VALUES
('Yatra', '124 Main Street, Bangalore', 'Mumbai', 'Active', 'company4'),
('Meru Cabs', '476 Heavne Avenue, Pune', 'Mumbai', 'Active', 'company5'),
('LafargeHolcim', '435 Lime Road, Mumbai', 'Mumbai', 'Inactive', 'company6'),
('JDA', '896 Brood Road, Pune', 'Mumbai', 'Active', 'company7'),
('UrbanLadder', '863 GB Road, Mumbai', 'Mumbai', 'Active', 'company8'),
('Fullerton India', '231 HP Road, Bangalore', 'Mumbai', 'Active', 'company9');
SELECT * FROM Company;

----------------------------------- CREATING TABLE TECH STACK ------------------------------------------
-- Create the "Tech_Stack" table
CREATE TABLE IF NOT EXISTS `Tech_Stack` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Tech_Name` VARCHAR(255) NOT NULL,
    `Image_Path` VARCHAR(255),
    `Framework` VARCHAR(255),
    `Cur_Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL
);

ALTER TABLE `Tech_Stack`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Tech_Stack" table
INSERT INTO `Tech_Stack` (`Tech_Name`, `Image_Path`, `Framework`, `Cur_Status`, `Creator_User`)
VALUES
('C#', '/images/c#_logo.png', 'ASP.NET', 'Active', 'tech_stack4'),
('Ruby', '/images/ruby_logo.png', 'Sinatara', 'Active', 'tech_stack5'),
('JavaScript', '/images/javascript1_logo.png', 'React.js', 'Inactive', 'tech_stack6'),
('JavaScript', '/images/javascript2_logo.png', 'Angular.js', 'Active', 'tech_stack7');
SELECT * FROM Tech_Stack;

-------------------------------- CREATING TECH TYPE TABLE -----------------------------------
-- Create the "Tech_Type" table
CREATE TABLE IF NOT EXISTS `Tech_Type` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Type_Name` VARCHAR(255) NOT NULL,
    `Cur_Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL
);

ALTER TABLE `Tech_Type`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Tech_Type" table
INSERT INTO `Tech_Type` (`Type_Name`, `Cur_Status`, `Creator_User`)
VALUES
('Backend Development', 'InActive', 'tech_tyep6');

SELECT * FROM Tech_Type;

----------------------------- CREATING TABLE MAKER PROGRAM -------------------------------------------
-- Create the "Maker_Program" table
CREATE TABLE IF NOT EXISTS `Maker_Program` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Program_Name` VARCHAR(255) NOT NULL,
    `Program_Type` VARCHAR(255) NOT NULL,
    `Program_Link` VARCHAR(255),
    `Tech_Stack_Id` INT,
    `Tech_Type_Id` INT,
    `Is_Program_Approved` BOOLEAN NOT NULL,
    `Description` TEXT,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    FOREIGN KEY (`Tech_Stack_Id`) REFERENCES `Tech_Stack`(`Id`),
    FOREIGN KEY (`Tech_Type_Id`) REFERENCES `Tech_Type`(`Id`)
);

ALTER TABLE `Maker_Program`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Maker_Program" table
INSERT INTO `Maker_Program` (
    `Program_Name`, `Program_Type`, `Program_Link`, `Tech_Stack_Id`, `Tech_Type_Id`, 
    `Is_Program_Approved`, `Description`, `Status`, `Creator_User`
) VALUES
('SDET', 'Development and Testing', 'https://SDET.com', 1, 5, true, 'Both software development and testing', 'Active', 'maker_program4'),
('Backend Developement', 'Backend', 'https://nodejs.com', 3, 6, false, 'Web development', 'Active', 'maker_program5'),
('Frontend Development', 'Frontend', 'https://angular.com', 3, 1, true, 'Java Script based Web Framework', 'Inactive', 'maker_program6');
SELECT * FROM Maker_Program;

----------------------------------- CREATING APP PARAMETER TABLE --------------------------------------
-- Create the "App_Parameters" table
CREATE TABLE IF NOT EXISTS `App_Parameters` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Key_Type` VARCHAR(50) NOT NULL,
    `Key_Value` VARCHAR(50) NOT NULL,
    `Key_Text` VARCHAR(255) NOT NULL,
    `Cur_Status` VARCHAR(50) NOT NULL,
    `Lastupd_User` INT,
    `Lastupd_Stamp` TIMESTAMP,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT,
    `Seq_Num` INT NOT NULL
);

-- Insert values into the "App_Parameters" table
INSERT INTO `App_Parameters` (`Key_Type`, `Key_Value`, `Key_Text`, `Cur_Status`, `Lastupd_User`, `Lastupd_Stamp`, `Creator_User`, `Seq_Num`)
VALUES
('DOC_STATUS', 'PND', 'Pending', 'ACTV', NULL, NULL, NULL, 1),
('DOC_STATUS', 'RCEVD', 'Received', 'ACTV', NULL, NULL, NULL, 2),
('CUR_STATUS', 'ACTV', 'Active', 'ACTV', NULL, NULL, NULL, 1),
('CUR_STATUS', 'IACTV', 'Inactive', 'ACTV', NULL, NULL, NULL, 1),
('BATCH_STATUS', 'INPROCESS', 'In Process', 'ACTV', NULL, NULL, NULL, 1),
('BATCH_STATUS', 'HOLD', 'Hold', 'ACTV', NULL, NULL, NULL, 2),
('BATCH_STATUS', 'COMPL', 'Completed', 'ACTV', NULL, NULL, NULL, 3);
SELECT * FROM App_Parameters;

----------------------------------------------- CREATING LAB TABLE --------------------------------------------------
-- Create the "Lab" table
CREATE TABLE IF NOT EXISTS `Lab` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Location` VARCHAR(255),
    `Address` TEXT,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL
);

-- Insert values into the "Lab" table
INSERT INTO `Lab` (`Name`, `Location`, `Address`, `Status`, `Creator_User`)
VALUES
('Lab Mumbai', 'Mumbai', 'Gowandi, Mumbai', 'Active', 1),
('Lab Pune', 'Pune', 'Sawan, Pune', 'Active', 2),
('Lab Bangalore', 'Bangalore', '80ft Road, Bangalore', 'Active', 3);
SELECT * FROM Lab;

----------------------------------------------- CREATING LAB THRESHOLD TABLE ---------------------------------------------
-- Create the "Lab_Threshold" table
CREATE TABLE IF NOT EXISTS `Lab_Threshold` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Lab_Id` INT NOT NULL,
    `Lab_Capacity` INT,
    `Lead_Threshold` INT,
    `Ideation_Engg_Threshold` INT,
    `Buddy_Engg_Threshold` INT,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    FOREIGN KEY (`Lab_Id`) REFERENCES `Lab`(`Id`)
);

ALTER TABLE `Lab_Threshold`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Lab_Threshold" table
INSERT INTO `Lab_Threshold` (
    `Lab_Id`, `Lab_Capacity`, `Lead_Threshold`, `Ideation_Engg_Threshold`, `Buddy_Engg_Threshold`, 
    `Status`, `Creator_User`
) VALUES
(1, 250, 5, 10, 20, 'Active', 1),
(2, 100, 4, 8, 15, 'Active', 2),
(3, 150, 6, 12, 25, 'Active', 3);
SELECT * FROM Lab_Threshold;

----------------------------------------- CREATING MENTOR TABLE -----------------------------------------
-- Create the "Mentor" table
CREATE TABLE IF NOT EXISTS `Mentor` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Mentor_Type` VARCHAR(50),
    `Lab_Id` INT NOT NULL,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    FOREIGN KEY (`Lab_Id`) REFERENCES `Lab`(`Id`)
);

ALTER TABLE `Mentor`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Mentor" table
INSERT INTO `Mentor` (`Id`, `Name`, `Mentor_Type`, `Lab_Id`, `Status`, `Creator_User`)
VALUES
(9, 'Piyush', 'Main Mentor', 2, 'Active', 'mentor9'),
(10, 'Venkatash', 'Practice Mentor', 3, 'Active', 'mentor10'),
(11, 'Nisha', 'Practice Mentor', 2, 'InActive', 'mentor11'),
(12, 'Riddhi', 'Buddy Mentor', 3, 'InActive', 'mentor12');
SELECT * FROM Mentor;

-------------------------------------- CREATING MENTOR IDEATION MAP --------------------------------------
-- Create the "Mentor_Ideation_Map" table
CREATE TABLE IF NOT EXISTS `Mentor_Ideation_Map` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Parent_Mentor_Id` INT,
    `Mentor_Id` INT NOT NULL,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    FOREIGN KEY (`Parent_Mentor_Id`) REFERENCES `Mentor`(`Id`),
    FOREIGN KEY (`Mentor_Id`) REFERENCES `Mentor`(`Id`)
);

ALTER TABLE `Mentor_Ideation_Map`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Mentor_Ideation_Map" table
INSERT INTO `Mentor_Ideation_Map` (`Parent_Mentor_Id`, `Mentor_Id`, `Status`, `Creator_User`)
VALUES
(1, 5, 'InActive', 'mentor5'),
(2, 7, 'Active', 'mentor7'),
(3, 8, 'InActive', 'mentor8'),
(4, 1, 'InActive', 'mentor1'),
(5, 2, 'Active', 'mentor2');

SELECT * FROM Mentor_Ideation_Map;

----------------------------------- CREATING MENTOR TECH STACK TABLE ----------------------------------
-- Create the "Mentor_Tech_Stack" table
CREATE TABLE IF NOT EXISTS `Mentor_Tech_Stack` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Mentor_Id` INT NOT NULL,
    `Tech_Stack_Id` INT NOT NULL,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    FOREIGN KEY (`Mentor_Id`) REFERENCES `Mentor`(`Id`),
    FOREIGN KEY (`Tech_Stack_Id`) REFERENCES `Tech_Stack`(`Id`)
);

ALTER TABLE `Mentor_Tech_Stack`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Mentor_Tech_Stack" table
INSERT INTO `Mentor_Tech_Stack` (`Mentor_Id`, `Tech_Stack_Id`, `Status`, `Creator_User`)
VALUES
(1, 1, 'Active', 1),
(2, 2, 'Active', 2),
(3, 3, 'Active', 3),
(4, 1, 'Active', 1),
(5, 2, 'Active', 2),
(6, 3, 'Active', 3),
(7, 1, 'Active', 1);
SELECT * FROM Mentor_Tech_Stack;

-------------------------------- CREATING COMPANY REQUIREMENT TABLE -----------------------------------
-- Create the "Company_Requirement" table
CREATE TABLE IF NOT EXISTS `Company_Requirement` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Company_Id` INT NOT NULL,
    `Requested_Month` DATE NOT NULL,
    `City` VARCHAR(255) NOT NULL,
    `Is_Doc_Verification` BOOLEAN NOT NULL,
    `Requirement_Doc_Path` VARCHAR(255),
    `No_of_Engg` INT NOT NULL,
    `Tech_Stack_Id` INT,
    `Tech_Type_Id` INT,
    `Maker_Program_Id` INT,
    `Lead_Id` INT,
    `Ideation_Engg_Id` INT,
    `Buddy_Engg_Id` INT,
    `Special_Remark` TEXT,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    FOREIGN KEY (`Company_Id`) REFERENCES `Company`(`Id`),
    FOREIGN KEY (`Tech_Stack_Id`) REFERENCES `Tech_Stack`(`Id`),
    FOREIGN KEY (`Tech_Type_Id`) REFERENCES `Tech_Type`(`Id`),
    FOREIGN KEY (`Maker_Program_Id`) REFERENCES `Maker_Program`(`Id`),
    FOREIGN KEY (`Lead_Id`) REFERENCES `Mentor`(`Id`),
    FOREIGN KEY (`Ideation_Engg_Id`) REFERENCES `Mentor`(`Id`),
    FOREIGN KEY (`Buddy_Engg_Id`) REFERENCES `Mentor`(`Id`)
);

-- Insert values into the "Company_Requirement" table
INSERT INTO `Company_Requirement` (
    `Company_Id`, `Requested_Month`, `City`, `Is_Doc_Verification`, `Requirement_Doc_Path`, 
    `No_of_Engg`, `Tech_Stack_Id`, `Tech_Type_Id`, `Maker_Program_Id`, `Lead_Id`, 
    `Ideation_Engg_Id`, `Buddy_Engg_Id`, `Special_Remark`, `Status`, `Creator_User`
) VALUES
(1, '2024-02-01', 'Mumbai', true, '/path/to/requirement_docs', 10, 1, 1, 1, 1, 2, 3, 'Looking for skilled engineers', 'Active', 1),
(2, '2024-02-15', 'Bangalore', true, '/path/to/requirement_docs', 15, 2, 2, 2, 4, 5, 6, 'Urgent requirement for a project', 'Active', 2),
(3, '2024-03-01', 'Pune', false, NULL, 8, 3, 3, 3, 5, 7, 1, 'Specialized team needed', 'Inactive', 3);
SELECT * FROM Company_Requirement;

-------------------------------------- CREATING CANDIDATE STACK ASSIGNMENT TABLE ----------------------------
-- Create the "Candidate_Stack_Assignment" table
CREATE TABLE IF NOT EXISTS `Candidate_Stack_Assignment` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Requirement_Id` INT NOT NULL,
    `Candidate_Id` INT NOT NULL,
    `Assign_Date` DATE NOT NULL,
    `Complete_Date` DATE,
    `Status` VARCHAR(50) NOT NULL,
    `Creator_Stamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Creator_User` INT NOT NULL,
    FOREIGN KEY (`Requirement_Id`) REFERENCES `Company_Requirement`(`Id`),
    FOREIGN KEY (`Candidate_Id`) REFERENCES `UserDetails`(`Id`)
);

ALTER TABLE `Candidate_Stack_Assignment`
MODIFY `Creator_User` VARCHAR(50);

-- Insert values into the "Candidate_Stack_Assignment" table
INSERT INTO `Candidate_Stack_Assignment` (`Requirement_Id`, `Candidate_Id`, `Assign_Date`, `Complete_Date`, `Status`, `Creator_User`)
VALUES
(1, 1, '2024-02-05', '2024-02-20', 'Assigned', 'student'),
(1, 2, '2024-02-06', '2024-02-21', 'Assigned', 'student'),
(2, 3, '2024-02-16', '2024-03-02', 'Assigned', 'student'),
(2, 4, '2024-02-17', '2024-03-03', 'Assigned', 'student'),
(3, 5, '2024-03-02', NULL, 'Assigned', 'student'),
(3, 6, '2024-03-03', NULL, 'Assigned', 'student'),
(1, 7, '2024-03-15', NULL, 'Assigned', 'student'),
(2, 8, '2024-03-16', NULL, 'Assigned', 'student'),
(1, 9, '2024-03-25', NULL, 'Assigned', 'student'),
(3, 10, '2024-03-26', NULL, 'Assigned', 'student');

SELECT * FROM Candidate_Stack_Assignment;

SELECT Id from UserDetails;
