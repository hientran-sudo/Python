USE Vaccination;
GO

DROP TABLE Fact.Vaccinations;
CREATE TABLE Fact.Vaccinations (
    VaccinationID int IDENTITY (1,1) NOT NULL,
    iso_code nvarchar(20) NOT NULL,
	datekey int NOT NULL,
	vaccinekey int NOT NULL,
	
    
	total_vaccinations int,
	people_vaccinated int,
	people_fully_vaccinated int,
	daily_vaccinations_raw int,
	daily_vaccinations int,
	total_vaccinations_per_hundred decimal(5,2),
	people_vaccinated_per_hundred decimal(5,2),
	people_fully_vaccinated_per_hundred decimal(5,2),
	daily_vaccinations_per_million int,


    CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (
        VaccinationID ASC
    )
);
GO

ALTER TABLE Fact.Vaccinations WITH CHECK ADD CONSTRAINT FK_Fact_Vaccinations_iso_code_Dimension_Country FOREIGN KEY(iso_code)
REFERENCES Dimension.Country (iso_code);
GO

ALTER TABLE Fact.Vaccinations CHECK CONSTRAINT FK_Fact_Vaccinations_iso_code_Dimension_Country;
GO
--
ALTER TABLE Fact.Vaccinations WITH CHECK ADD CONSTRAINT FK_Fact_Vaccinations_datekey_Dimension_Date FOREIGN KEY(datekey)
REFERENCES Dimension.Date (datekey);
GO

ALTER TABLE Fact.Vaccinations CHECK CONSTRAINT FK_Fact_Vaccinations_datekey_Dimension_Date;
GO
--
ALTER TABLE Fact.Vaccinations WITH CHECK ADD CONSTRAINT FK_Fact_Vaccinations_vaccinekey_Dimension_Vaccine FOREIGN KEY(vaccinekey)
REFERENCES Dimension.Vaccine (vaccinekey);
GO

ALTER TABLE Fact.Vaccinations CHECK CONSTRAINT FK_Fact_Vaccinations_vaccinekey_Dimension_Vaccine;
GO
--

