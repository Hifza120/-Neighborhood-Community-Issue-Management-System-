create database NICM__System;
use NICM__System;
create table Resident(
RID int Primary key,
RName char(50) Not Null,
RAddress varchar(100),
Rjoindate  Date,
RAccStatus char(12) default 'In-active'
);
create table ResidentContactInfo(
RID int primary key,
Pcontact  VARCHAR(11) Not Null,
Scontact  VARCHAR(11),
constraint fk_contact Foreign key (RID) references Resident(RID)
);

create table Event(
EID varchar(20) primary key,
EName char(50), 
Edisc varchar(100) NOT null,
EDate date Not Null,
EONAME varchar(20),
Area varchar(30) ,
Street varchar(20) 
);
create table Notification(
NID varchar(11) primary key,
NDateSent date Not Null,
Nmsg varchar(200) ,
RID int,
EID varchar(20),
constraint fk_Notification1 Foreign key (RID) references Resident(RID),
constraint fk_Notification2 foreign key (EID) references Event(EID)
);
CREATE TABLE NotificationType (
    type1 VARCHAR(250),
    type2 VARCHAR(250),
    NID VARCHAR(11) PRIMARY KEY,
    constraint fk_type foreign key(NID) references  Notification(NID)
);
create table Comment(
RID int primary key,
Ctext varchar(70),
ctype  varchar(20) default 'unknown',
Dateposted date,
constraint Fk_comment foreign key (RID) references Resident(RID)
);
create table Authority(
AID varchar(11) primary key,
Role char(20) Not NULL,
AName char(50)
);
create table issue(	
IID varchar(10) primary key,
IDisc varchar(150) Not Null,
Severity char(20) default 'Low',
IDReported date,
Area varchar(20),
street varchar(10),
ReportRID int ,
CommentRID int ,
AID varchar(11),
constraint fk_issue1 foreign key(ReportRID) references Resident(RID),
constraint fk_issue2 foreign key(commentRID) references comment(RID),
constraint fk_issue3 foreign key(AID) references Authority(AID)
);

 
create table issueStatus(
ISN char(20) ,
IDupdate date,
Idiscrip varchar(100),
IID varchar(10) ,
primary key(IID,ISN),
constraint fk_issueStatus foreign key (IID) references issue(IID)
);

create table AuthorityContactInfo(
PContact varchar(11),
SContact varchar(11),
AID varchar(11) primary key,
constraint FK_AContactinfo Foreign key (AID) references Authority(AID)
);

 

create table CurrentProject(
PID varchar(10)primary key,
PENDDATE date,
PStartDate date,
PStatus char(20) default 'IN-active',
PNAME char(50),
PDIS varchar(200),
AID varchar(11),
constraint FK_CurrentProject  Foreign key (AID) references Authority(AID)
);

 
Create table DiscussionBoard(
DID int primary key,
Dtitle char(70),
Dcreated Date,
DContent varchar(100),
Dtype char(50)
);

create table Discuss(
RID int ,
DID int,
constraint FK_DISCUSS1 foreign key (RID) references Resident(RID),
constraint FK_DISCUSS2 foreign key (DID) references DiscussionBoard(DID),
primary key(RID,DID)
);
 create table Temporary1(
TID int primary key,
COL1 VARCHAR(20),
COL3 VARCHAR(30)
);
CREATE TABLE Temporary2(
TID2 int primary key,
Col2  char(10)
);

 drop table Temporary1;
drop table Temporary2;

 create table person(
PCNIC int,
Name char(50),
Paddress varchar(100),
Pphone int(11),
PEmail varchar(50),
RId int
);


Alter table Person 
add primary key (PCNIC);
 

Alter table Person 
add constraint FK_Person Foreign key(RID) references Resident(RID);

 

Alter table  Person
add constraint Unique(PEmail);
 
Alter table Person
ALter  column Paddress set default 'unknown';
 
Alter table Person
Modify column Pphone int(11) NOT NULL;

 
Alter table Person
Drop primary key;
 

Alter table Person
Drop foreign key fk_Person;
 
Alter table Person
Drop constraint PEmail;
 

Alter table Person
Alter column Paddress drop default;
 
ALTER TABLE Person
MODIFY Pphone INT(11) NULL;
 
Alter table Person 
Add column profession char(20);
 


Alter table Person 
Drop profession;

 


Alter table Person
change column PEmail Dependents varchar(200);
Alter table Person
MODIFY PPHONE VARCHAR(11);
 
drop table Person;
 
INSERT INTO Resident(RID, RName, RAddress, Rjoindate, RAccStatus)  
VALUES 
(1, 'Alina', 'House no 2, Street 1 , Block B', '2015-03-22', 'active'),
(2, 'Samiha', 'House 12, Street 3, Block A', '2017-06-15', 'Active'),
(3, 'Ahmed', 'House 17, Street 8, Block C', '2019-01-25', 'Active'),
(4, 'Hassan', 'House 7, Street 5, Block B', '2018-09-12', 'In-active'),
(5, 'Sara', 'House 7, Street 7, Block B', '2020-03-10', 'Active'),
(6, 'Farah', 'House 5, Street 5, Block A', '2021-05-22', 'In-active'),
(7, 'Osman', 'House 2, Street 6, Block C', '2019-07-19', 'Active'),
(8, 'Zain', 'House 3, Street 1, Block E', '2016-08-29', 'Active');

 

INSERT INTO Residentcontactinfo(RID, Pcontact, Scontact)
VALUES
(1, '03010304598', '0341098765'),
(2, '03015567890', '03453678901'),
(3, '03014567890', '03451234567'),
(4, '03334567891', '03451234890'),
(5, '03027812345', '03454578965'),
(6, '03324356789', '03455678901'),
(7, '03111234567', '03411234567'),
(8, '03022334455', '03324455667');
 

INSERT INTO Event (EID, EName, Edisc, EDate, EONAME, Area, Street) 
VALUES 
('E1001', 'Neighborhood Clean-Up', 'A community event for cleaning up the neighborhood areas.', '2023-11-05', 'Community Office', 'Community Office', 'Block A'),
('E1002', 'Tree Plantation Drive', 'Planting trees around the society to improve greenery.', '2024-01-10', 'Conference Hall', 'Conference Hall', 'Block B'),
('E1003', 'Sports Day', 'A day of sports and games for the local community at the community hall.', '2024-03-15', 'Community Hall', 'Community Hall', 'Block A'),
('E1004', 'Food Drive', 'Collecting food for those in need within the society.', '2024-02-20', 'Community Office', 'Community Office', 'Block A'),
('E1005', 'Health Awareness Seminar', 'A seminar on health and wellness for society residents.', '2024-04-05', 'Conference Hall', 'Conference Hall', 'Block B'),
('E1006', 'Charity Run', 'Running event to raise funds for local charities inside the society.', '2024-05-15', 'Community Hall', 'Community Hall', 'Block A'),
('E1007', 'Cultural Festival', 'Celebrating local culture with music, dance, and art performances.', '2024-06-10', 'Community Office', 'Community Office', 'Block A'),
('E1008', 'Waste Management Awareness', 'Workshop to educate residents on managing waste in the society.', '2024-07-20', 'Conference Hall', 'Conference Hall', 'Block B');
 
insert into Notification(NID,NDatesent,Nmsg,RID,EID)
 values('N1001', '2023-11-05', 'Reminder: Join us for the Neighborhood Clean-Up event this Saturday at the Community Office on Block A, Street 5.', 1, 'E1001'),
('N1002', '2024-01-10', 'Don\'t miss the Tree Plantation Drive tomorrow at the Conference Hall, Block B, Street 3.', 2, 'E1002'),
('N1003', '2024-03-15', 'Sports Day is tomorrow! Be sure to join us for the games and activities at the Community Hall, Block C, Street 2.', 3, 'E1003'),
('N1004', '2024-02-20', 'We are collecting donations for the Food Drive today at the Community Office, Block D, Street 1.', 4, 'E1004'),
('N1005', '2024-04-05', 'Reminder: The Health Awareness Seminar is tomorrow at the Conference Hall, Block A, Street 4.', 5, 'E1005'),
('N1006', '2024-05-15', 'Join us for the Charity Run event to raise funds for local charities at the Community Hall, Block B, Street 5.', 6, 'E1006'),
('N1007', '2024-06-10', 'Don\'t forget to attend the Cultural Festival at the Community Office, Block C, Street 2.', 7, 'E1007'),
('N1008', '2024-07-20', 'Join us for the Waste Management Awareness workshop tomorrow at the Conference Hall, Block D, Street 3.', 1, 'E1008');

 
insert into Notificationtype(type1,type2,NID)
  values('Reminder', 'Upcoming Event', 'N1001'),
('Alert', 'Event Notification', 'N1002'),
('Reminder', 'Event Update', 'N1003'),
('Alert', 'Donation Drive', 'N1004'),
('Reminder', 'Seminar Notification', 'N1005'),
('Alert', 'Charity Run Notification', 'N1006'),
('Reminder', 'Cultural Festival Reminder', 'N1007'),
('Alert', 'Workshop Notification', 'N1008');
 
  insert into comment(RID,Ctext,ctype,Dateposted)
   values(1, 'Garbage collection still not done in Block A, Street 5.', 'Follow-up', '2023-11-05'),
(2, 'Water leak in Block B, Street 3 still unresolved.', 'Follow-up', '2024-01-10'),
(3, 'Street lights in Block C, Street 2 are still out.', 'Follow-up', '2024-03-15'),
(4, 'Pothole in Block D, Street 1 still not fixed.', 'Follow-up', '2024-02-20'),
(5, 'Cracked road in Block A, Street 4 still not repaired.', 'Follow-up', '2024-04-05'),
(6, 'Drainage flooding in Block B, Street 5 after rain.', 'Follow-up', '2024-05-15'),
(7, 'Park in Block C, Street 2 still in bad condition.', 'Follow-up', '2024-06-10'),
(8, 'Illegal parking problem in Block D, Street 3 ongoing.', 'Follow-up', '2024-07-20');
 
   insert into Authority(AID,Role,Aname)
    values('A1001', 'Manager', 'Sara Khan'),
('A1002', 'Supervisor', 'Ali Shah'),
('A1003', 'Coordinator', 'Hassan Malik'),
('A1004', 'Team Lead', 'Mira Begum'),
('A1005', 'Manager', 'Tariq Aziz'),
('A1006', 'Supervisor', 'Fatima Ali'),
('A1007', 'Coordinator', 'Zainab Aslam'),
('A1008', 'Team Lead', 'Junaid Iqbal');

    insert into issue(IID,IDISC,Severity,IDReported,Area,Street,ReportRID,CommentRID,AID)
    values('I1001', 'Damaged streetlights causing traffic issues', 'High', '2024-01-05', 'Block A', 'Street 2', 1, 1, 'A1001'),
('I1002', 'Potholes in the main road', 'Medium', '2024-02-10', 'Block B', 'Street 4', 2, 2, 'A1002'),
('I1003', 'Uncollected garbage on the street corner', 'Low', '2024-03-12', 'Block C', 'Street 3', 3, 3, 'A1003'),
('I1004', 'Leaking water pipe in the alley', 'High', '2024-04-18', 'Block D', 'Street 1', 4, 4, 'A1004'),
('I1005', 'Overgrown trees blocking the sidewalk', 'Medium', '2024-05-22', 'Block A', 'Street 5', 5, 5, 'A1005'),
('I1006', 'Noise pollution from construction site', 'Low', '2024-06-17', 'Block B', 'Street 6', 6, 6, 'A1006'),
('I1007', 'Damaged public bench in the park', 'Low', '2024-07-21', 'Block C', 'Street 2', 7, 7, 'A1007'),
('I1008', 'Street flooding after rain', 'High', '2024-08-14', 'Block D', 'Street 4', 8, 8, 'A1008');

    insert into issueStatus(ISN,IDupdate,Idiscrip,IID)
    VALUES ('OPEN', '2024-01-06', 'Issue reported and open for investigation.', 'I1001'),
('IN-PROGRESS', '2024-02-11', 'Work in progress, technician assigned.', 'I1002'),
('CLOSED', '2024-03-13', 'Issue resolved and closed after garbage collection.', 'I1003'),
('CLOSED', '2024-04-19', 'Water pipe leakage fixed and issue closed.', 'I1004'),
('IN-PROGRESS', '2024-05-23', 'Tree trimming scheduled, work in progress.', 'I1005'),
('IN-PROGRESS', '2024-06-18', 'Noise reduction measures in progress, site visited.', 'I1006'),
('RESERVED', '2024-07-22', 'Bench replacement reserved, pending approval.', 'I1007'),
('OPEN', '2024-08-15', 'Street drainage issue reported, pending resolution.', 'I1008');
 
    insert into AuthorityContactInfo(Pcontact,Scontact,AID)
    values('03211234567', '03321234567', 'A1001'),
('03331234567', '03431234567', 'A1002'),
('03451234567', '03541234567', 'A1003'),
('03561234567', '03661234567', 'A1004'),
('03671234567', '03771234567', 'A1005'),
('03781234567', '03881234567', 'A1006'),
('03891234567', '03991234567', 'A1007'),
('03901234567', '04001234567', 'A1008');
 
    insert into CurrentProject(PID,PENDDATE,PSTARTDATE,PSTATUS,PNAME,PDIS,AID)
     values('P1001', '2024-12-31', '2024-01-15', 'In-progress', 'Neighborhood Renovation', 'Renovating the community park and streets.', 'A1001'),
('P1002', '2024-11-30', '2024-05-01', 'In-progress', 'Street Lighting', 'Installation of new street lights in Block A and B.', 'A1002'),
('P1003', '2025-03-10', '2024-08-20', 'In-progress', 'Waste Disposal Initiative', 'Implementing new waste disposal systems in the society.', 'A1003'),
('P1004', '2024-10-10', '2024-06-05', 'Completed', 'Community Hall Renovation', 'Renovation of the community hall including a new roof.', 'A1004'),
('P1005', '2025-01-25', '2024-09-10', 'In-progress', 'Road Expansion', 'Widening and improving the roads around the society.', 'A1005'),
('P1006', '2024-12-15', '2024-07-12', 'Completed', 'Security System Installation', 'Installation of new security cameras and lighting throughout the society.', 'A1006'),
('P1007', '2025-05-30', '2024-10-01', 'In-progress', 'Park Landscaping', 'Replanting trees and adding benches in the community park.', 'A1007'),
('P1008', '2025-04-05', '2024-11-15', 'In-progress', 'Recycling Program', 'Launching a community-wide recycling program.', 'A1008');

	insert into DiscussionBoard(DID,Dtitle,Dcreated,Dcontent,Dtype)
     values(1001, 'Clean-Up', '2024-10-01', 'Plans for clean-up, areas to focus on?', 'Event'),
(1002, 'Lighting Issues', '2024-10-10', 'Complaints about street lighting in Block B.', 'Issue'),
(1003, 'Park Ideas', '2024-10-15', 'Ideas for improving the community park.', 'Suggestion'),
(1004, 'Waste Awareness', '2024-10-20', 'Thoughts on new waste management initiative?', 'Discussion'),
(1005, 'Security Upgrade', '2024-10-22', 'Proposal for upgrading security systems.', 'Proposal'),
(1006, 'Cultural Festival', '2024-11-05', 'Volunteers needed for the Cultural Festival.', 'Event'),
(1007, 'Road Project', '2024-11-12', 'Thoughts on road expansion and traffic impact?', 'Project'),
(1008, 'Charity Run', '2024-11-18', 'Feedback on Charity Run event, improvements?', 'Event');

 
     insert into Discuss(RID,DID)
     values(1, 1001),
(2, 1002),
(3, 1003),
(4, 1004),
(5, 1005),
(6, 1006),
(7, 1007),
(1, 1008);
 

UPDATE Resident
SET RAddress = 'House 6, Street 2,Block B', RAccStatus = 'Active'
WHERE RID = 1;

UPDATE Resident
SET Rjoindate = '2021-12-15'
WHERE RID = 2;

UPDATE Resident
SET RName = 'Ahmed'
WHERE RID = 3;
 
update residentcontactinfo
set Pcontact='03256789211'
where RID=2;
update residentcontactinfo
set Scontact='03289089271'
where RID=5;
update residentcontactinfo
set Pcontact='03111089071'
where RID=6;
 

UPDATE Event
Set Edate='2024-08-11'
where EID='E1008';
UPDATE Event
SET EName = 'Neighborhood Clean-Up Drive', Area = 'Sector B'
WHERE EID = 'E1001';

UPDATE Event
SET Edisc = 'Annual Sports Day event for all residents.'
WHERE EID = 'E1003';
 

UPDATE NOTIFICATION
SET NDATESENT='2024-12-4'
WHERE NID='N1001';
UPDATE Notification
SET RID = 1
WHERE NID = 'N1003';

UPDATE Notification
SET EID = 'E1004'
WHERE NID = 'N1002';
 

UPDATE NotificationType
SET type1 = 'Event Reminder', type2 = 'Meeting Invitation'
WHERE NID = 'N1001';

UPDATE NotificationType
SET type1 = 'Urgent Alert'
WHERE NID = 'N1002';

UPDATE NotificationType
SET type2 = 'Event Notification'
WHERE NID = 'N1003';
 
UPDATE Comment
SET Ctext = 'Please address this issue urgently.', ctype = 'Complaint'
WHERE RID = 1;

UPDATE Comment
SET Dateposted = '2024-02-15'
WHERE RID = 2;

UPDATE Comment
SET Ctext = 'This event was well-organized. Thanks!'
WHERE RID = 3;

UPDATE Authority
SET Role = 'Maintenance Manager', AName = 'John Doe'
WHERE AID = 'A1001';

UPDATE Authority
SET Role = 'Community Manager'
WHERE AID = 'A1002';

UPDATE Authority
SET AName = 'Sarah Khan'
WHERE AID = 'A1003';
 
UPDATE Issue
SET IDisc = 'Streetlights not working in Block C', Severity = 'High'
WHERE IID = 'I1001';

UPDATE Issue
SET Area = 'Park Avenue'
WHERE IID = 'I1002';

UPDATE Issue
SET IDReported = '2024-05-15'
WHERE IID = 'I1003';

UPDATE IssueStatus
SET ISN = 'RESOLVED'
WHERE IID = 'I1001';

UPDATE IssueStatus
SET Idiscrip = 'Pending inspection by maintenance.'
WHERE IID = 'I1002';

UPDATE IssueStatus
SET IDupdate = '2024-07-01'
WHERE IID = 'I1003';

UPDATE AuthorityContactInfo
SET Pcontact = '03112223344'
WHERE AID = 'A1001';

UPDATE AuthorityContactInfo
SET Scontact = '03223334455'
WHERE AID = 'A1002';

UPDATE AuthorityContactInfo
SET Pcontact = '03441112222'
WHERE AID = 'A1003';

 UPDATE CurrentProject
SET PStatus = 'Paused'
WHERE PID = 'P1001';

UPDATE CurrentProject
SET PENDDATE = '2025-12-31'
WHERE PID = 'P1002';

UPDATE CurrentProject
SET PDIS = 'Renovating community center and playground.'
WHERE PID = 'P1003';
 
UPDATE DiscussionBoard
SET Dtitle = 'Upcoming Events in December'
WHERE DID = 1001;

UPDATE DiscussionBoard
SET DContent = 'Suggestions for improving park facilities.'
WHERE DID = 1002;

UPDATE DiscussionBoard
SET Dtype = 'Community Ideas'
WHERE DID = 1003;

UPDATE Discuss
SET RID = 2
WHERE DID = 1001;

UPDATE Discuss
SET DID = 1002
WHERE RID = 3;

UPDATE Discuss
SET RID = 4
WHERE DID = 1003;

DELETE FROM DISCUSS
WHERE RID IN (5,6,7) AND DID IN (1005,1006,1007);
DELETE FROM DISCUSSIONBOARD
WHERE DID IN(1005,1006,1007);
DELETE FROM CURRENTPROJECT
WHERE PID IN('P1006','P1007','P1008');
DELETE FROM AUTHORITYContactinfo
WHERE AID IN('A1006','A1007','A1008');
DELETE FROM ISSUESTATUS
WHERE IID IN('I1006','I1007','I1008');


 


DELETE FROM ISSUE 
WHERE IID IN('I1006','I1007','I1008');

 

DELETE FROM AUTHORITY
WHERE AID IN('A1006','A1007','A1008');

 


DELETE FROM COMMENT
WHERE RID IN(6,7,8);



 
DELETE FROM   Notificationtype
WHERE NID IN('N1005','N1006','N1007');

 

DELETE FROM NOTIFICATION
WHERE NID IN('N1005','N1006','N1007');

DELETE FROM EVENT 
WHERE EID IN('E1005','E1006','E1007');
 

DELETE FROM residentcontactinfo
WHERE RID IN(6,7,8);

DELETE FROM RESIDENT
WHERE RID IN(6,7,8);
 
show tables;
SELECT * FROM RESIDENT;
INSERT INTO Resident(RID, RName, RAddress, Rjoindate, RAccStatus)  
VALUES 
(11, 'Aliya', 'House no 2, Street 1 , Block B', '2010-01-22', 'active'),
(21, 'SAIMA', 'House 12, Street 3, Block A', '2019-01-25', 'Active'),
(31, 'Ahmed ALI ', 'House 17, Street 8, Block C', '2022-07-05', 'Active'),
(41, 'Hassan', 'House 9, Street 9, Block D', '2008-07-12', 'In-active');
-- resident 
-- resident self join
