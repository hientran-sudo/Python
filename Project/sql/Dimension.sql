USE Vaccination;
GO

CREATE TABLE Dimension.Country (   
	iso_code nvarchar(5) NOT NULL,
	country  nvarchar(50) NOT NULL,
    CONSTRAINT PK_Code PRIMARY KEY CLUSTERED (
        iso_code ASC
    )
);
GO

CREATE TABLE Dimension.Date (   
	datekey int NOT NULL,
	fulldate date NOT NULL,
    CONSTRAINT PK_Date PRIMARY KEY CLUSTERED (
        datekey ASC
    )
);
GO

CREATE TABLE Dimension.SourceName (   
	sourcekey int NOT NULL,
	source_name nvarchar(500)  NOT NULL,
    CONSTRAINT PK_Source PRIMARY KEY CLUSTERED (
        sourcekey ASC
    )
);
GO

CREATE TABLE Dimension.Vaccine (   
	vaccinekey int NOT NULL,
	vaccine nvarchar(50)  NOT NULL,
    CONSTRAINT PK_Vaccine PRIMARY KEY CLUSTERED (
        vaccinekey ASC
    )
);
GO

CREATE TABLE Dimension.Website (   
	websitekey int NOT NULL,
	source_website nvarchar(500)  NOT NULL,
    CONSTRAINT PK_Website PRIMARY KEY CLUSTERED (
        websitekey ASC
    )
);
GO







