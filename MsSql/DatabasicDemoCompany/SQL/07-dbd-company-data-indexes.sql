USE DatabasicDemoCompany;
GO


CREATE NONCLUSTERED INDEX IX_Attendance_DateAndTime ON Attendance (Date ASC, Time ASC)
CREATE NONCLUSTERED INDEX IX_Attendance_IdPerson ON Attendance (IdPerson ASC)
CREATE NONCLUSTERED INDEX IX_Attendance_Time ON Attendance (Time ASC)
CREATE NONCLUSTERED INDEX IX_Contacts_Value ON Contacts (Value ASC)
CREATE NONCLUSTERED INDEX IX_ContactsCategories_Name ON ContactsCategories (Name ASC)
CREATE NONCLUSTERED INDEX IX_Departments_Name ON Departments (Name ASC)
CREATE NONCLUSTERED INDEX IX_Persons_Gender ON Persons (Gender ASC)
CREATE NONCLUSTERED INDEX IX_Persons_Name ON Persons (Name ASC)
CREATE NONCLUSTERED INDEX IX_Persons_Salary ON Persons (Salary ASC)
CREATE NONCLUSTERED INDEX IX_Persons_Surname ON Persons (Surname ASC)
GO


ALTER TABLE Attendance  WITH CHECK ADD  CONSTRAINT FK_Attendance_Persons FOREIGN KEY (IdPerson)
REFERENCES Persons (IdPerson)
ALTER TABLE Attendance CHECK CONSTRAINT FK_Attendance_Persons
GO

ALTER TABLE Contacts  WITH CHECK ADD  CONSTRAINT FK_Contact_Person FOREIGN KEY (IdPerson)
REFERENCES Persons (IdPerson)
ALTER TABLE Contacts CHECK CONSTRAINT FK_Contact_Person
GO

ALTER TABLE Contacts  WITH CHECK ADD  CONSTRAINT FK_Contacts_ContactsCategories FOREIGN KEY (IdContactCategory)
REFERENCES ContactsCategories (IdContactCategory)
ALTER TABLE Contacts CHECK CONSTRAINT FK_Contacts_ContactsCategories
GO

ALTER TABLE Persons  WITH CHECK ADD  CONSTRAINT FK_Person_Department FOREIGN KEY (IdDepartment)
REFERENCES Departments (IdDepartment)
ALTER TABLE Persons CHECK CONSTRAINT FK_Person_Department
GO

ALTER TABLE Persons  WITH CHECK ADD  CONSTRAINT FK_Person_Person FOREIGN KEY (IdParent)
REFERENCES Persons (IdPerson)
ALTER TABLE Persons CHECK CONSTRAINT FK_Person_Person
GO

