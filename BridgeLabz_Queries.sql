USE BridgeLabz;

-- 1. Find all candidates having Java technology
SELECT fc.Id, fc.first_name, fc.last_name
FROM FellowshipCandidate fc
JOIN tech_stack ts
ON fc.Technology_Id = ts.Id
WHERE ts.Tech_Name = 'Java';

-- 2. Find all mentors and ideations have java technology
SELECT m.name, ts.Tech_Name
FROM Mentor_Tech_Stack mts
INNER JOIN Tech_Stack ts ON mts.Tech_Stack_Id = ts.Id
INNER JOIN Mentor m ON mts.Mentor_Id = m.Id
INNER JOIN Mentor_Ideation_Map mi ON mi.mentor_id = mts.mentor_id
WHERE ts.Tech_Name = 'Java';

-- 3. Find name of candidate which did not assign technology
SELECT *
FROM UserDetails u
WHERE u.Technology_Id IS NULL;

-- 4. Find name of candidate which is not submit documents.
SELECT fc.First_Name, fc.Last_Name, cd.Status
FROM FellowshipCandidate fc
INNER JOIN CandidateDocuments cd
ON fc.Creator_User = cd.Candidate_Id
WHERE cd.Status = 'Pending';

-- 5. Find name of candidate which is not submit bank details.
SELECT fc.First_Name, fc.Last_Name, cbd.Is_Account_Num_Verified, cbd.Is_Ifsc_Code_Verified
FROM FellowshipCandidate fc
CROSS JOIN CandidateBankDetails cbd
ON cbd.Candidate_Id = fc.Creator_User
WHERE cbd.Is_Account_Num_Verified IS FALSE OR cbd.Is_Ifsc_Code_Verified IS FALSE;

-- 6. Find name of candidates which is joined in dec month
SELECT fc.First_Name, fc.Last_Name, fc.Joining_Date
FROM FellowshipCandidate fc
WHERE `Joining_Date` BETWEEN '2023-12-01' AND '2023-12-31';

-- 7. Find name of candidates which is end of couse in feb.
SELECT fc.first_name, fc.last_name, fc.joining_date
FROM FellowshipCandidate fc
WHERE `Joining_Date` BETWEEN '2023-02-01' AND '2023-02-28';

-- 8. Find name of candidates which is ending date accounding to joining date if joining date is 22-02-2019.
SELECT fc.First_Name, fc.Last_Name, fc.Joining_Date
FROM FellowshipCandidate fc
WHERE `Joining_Date` = '2019-02-22';

-- 9. Find all candidates which is passed out in 2019 year.
SELECT fc.First_name, fc.last_name, cq.Passing_Year
FROM FellowshipCandidate fc
INNER JOIN CandidateQualification cq
ON cq.Candidate_Id = fc.Creator_User
WHERE cq.Passing_Year = '2019';

-- 10. Which technology assign to which candidates which is having MCA background.
SELECT *
FROM FellowshipCandidate fc
INNER JOIN Tech_Stack ts ON fc.Creator_User = ts.Id
WHERE fc.Degree = 'B.E' AND ts.Tech_Name = 'Java';

-- 11. How many candiates which is having last month.
SELECT
    fc.First_Name,
    fc.Last_Name,
    fc.Joining_Date,
    DATE_ADD(fc.Joining_Date, INTERVAL 3 MONTH) AS Ending_Date,
    DATEDIFF(DATE_ADD(fc.Joining_Date, INTERVAL 3 MONTH), CURDATE()) AS Remaining_Month
FROM
    FellowshipCandidate fc
WHERE
    YEAR(DATE_ADD(fc.Joining_Date, INTERVAL 3 MONTH)) = YEAR(CURDATE())
    AND DATEDIFF(DATE_ADD(fc.Joining_Date, INTERVAL 3 MONTH), CURDATE()) <=1;



-- 12. How many week candidate completed in the bridgelabz since joining date candidate id is 2
SELECT fc.First_Name, fc.Last_Name, WEEK(CURDATE()) - WEEK(fc.joining_date)+1 AS Week_Completed
FROM FellowshipCandidate fc
WHERE fc.Creator_User = 2;

-- 13. Find joining date of candidate if candidate id is 4.
SELECT fc.First_Name, fc.last_name, fc.joining_date
FROM FellowshipCandidate fc
WHERE fc.Creator_User = 4;

-- 14. How many week remaining of candidate in the bridglabz from today if candidate id is 5.
SELECT 
    fc.First_Name, 
    fc.Last_Name,
    WEEK(DATE_ADD(fc.joining_date, INTERVAL 3 MONTH)) AS Ending_Week,
    TIMESTAMPDIFF(WEEK, CURDATE(), DATE_ADD(fc.joining_date, INTERVAL 3 MONTH)) AS Remaining_Week
FROM FellowshipCandidate fc
WHERE fc.Creator_User = 5;

-- 15. How many days remaining of candidate in the bridgelabz from today if candidate is is 6.
SELECT 
    fc.First_Name, 
    fc.Last_Name,
    TIMESTAMPDIFF(DAY, CURDATE(), DATE_ADD(fc.joining_date, INTERVAL 3 MONTH)) AS Remaining_Days
FROM FellowshipCandidate fc
WHERE fc.Creator_User = 6;

-- 16. Find candidates which is deployed.
SELECT fc.first_name, fc.last_name
FROM FellowshipCandidate fc
WHERE TIMESTAMPDIFF(DAY, CURDATE(), DATE_ADD(fc.joining_date, INTERVAL 3 MONTH)) = 0;

-- 17. Find name and other details and name of company which is assign to condidate.
SELECT fc.first_name, fc.last_name, fc.emailId, fc.mobile_number, c.`name`
FROM FellowshipCandidate fc
INNER JOIN Company c
ON c.Id = fc.mapped_company_id;

-- 18. Find all candidate and mentors which is related to lab= banglore/mumbai/pune.
SELECT DISTINCT 
	fc.first_name, 
    fc.last_name,  
    l.`name` as Lab_Name
FROM lab l
INNER JOIN FellowshipCandidate fc ON fc.lab_id = l.Id;

SELECT 
	m.`name` AS Mentor_Name,
    l.`name` AS Lab_Name
FROM Lab l
INNER JOIN Mentor m ON m.lab_id = l.id;

-- 19. Find buddy mentors and ideation mentor and which technology assign to particular candidate if candidate id is 6.
SELECT
	m.`name` AS Mentor_Name
FROM Mentor m
INNER JOIN Mentor_Ideation_Map mi ON mi.mentor_id = m.id
WHERE m.`Mentor_Type` = 'Buddy Mentor' AND mi.`Status` = 'Active';

SELECT fc.first_name, fc.last_name, ts.tech_name
FROM FellowshipCandidate fc
INNER JOIN Tech_Stack ts ON fc.Technology_Id = ts.Id
WHERE fc.`Creator_User` = 6;
