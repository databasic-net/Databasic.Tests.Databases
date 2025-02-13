USE DatabasicDemoMLM;
GO


CREATE NONCLUSTERED INDEX IX_Clients_City ON Clients (City ASC)
CREATE NONCLUSTERED INDEX IX_Clients_Country ON Clients (Country ASC)
CREATE NONCLUSTERED INDEX IX_Clients_Discount ON Clients (Discount ASC)
CREATE NONCLUSTERED INDEX IX_Clients_Fullname ON Clients (Fullname ASC)
CREATE NONCLUSTERED INDEX IX_Clients_Name ON Clients (Name ASC)
CREATE NONCLUSTERED INDEX IX_Clients_Region ON Clients (Region ASC)
CREATE NONCLUSTERED INDEX IX_Clients_Street ON Clients (Street ASC)
CREATE NONCLUSTERED INDEX IX_Clients_Zip ON Clients (Zip ASC)
CREATE NONCLUSTERED INDEX IX_Dealers_Name ON Dealers (Name ASC)
CREATE NONCLUSTERED INDEX IX_Dealers_Surname ON Dealers (Surname ASC)
CREATE NONCLUSTERED INDEX IX_Dealers_TurnOverExclVat ON Dealers (TurnOverExclVat ASC)
CREATE NONCLUSTERED INDEX IX_Dealers_TurnOverInclVat ON Dealers (TurnOverInclVat ASC)
CREATE NONCLUSTERED INDEX IX_Orders_DateDispatch ON Orders (DateDispatch ASC)
CREATE NONCLUSTERED INDEX IX_Orders_DateSubmit ON Orders (DateSubmit ASC)
CREATE NONCLUSTERED INDEX IX_Orders_Paid ON Orders (Paid ASC)
CREATE NONCLUSTERED INDEX IX_Orders_PriceExclVat ON Orders (PriceExclVat ASC)
CREATE NONCLUSTERED INDEX IX_Orders_PriceInclVat ON Orders (PriceInclVat ASC)
CREATE NONCLUSTERED INDEX IX_Orders_Status ON Orders (Status ASC)
GO


ALTER TABLE Dealers  WITH CHECK ADD  CONSTRAINT FK_Dealers_Dealers FOREIGN KEY (IdParent)
REFERENCES Dealers (Id)
ALTER TABLE Dealers CHECK CONSTRAINT FK_Dealers_Dealers
GO

ALTER TABLE Orders  WITH CHECK ADD  CONSTRAINT FK_Order_Client FOREIGN KEY (IdClient)
REFERENCES Clients (Id)
ALTER TABLE Orders CHECK CONSTRAINT FK_Order_Client
GO

ALTER TABLE Orders  WITH CHECK ADD  CONSTRAINT FK_Orders_Dealers FOREIGN KEY (IdDealer)
REFERENCES Dealers (Id)
ALTER TABLE Orders CHECK CONSTRAINT FK_Orders_Dealers
GO
