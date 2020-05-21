--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Chinook_ERtoDimensional.DM1
--
-- Date Created : Thursday, January 30, 2020 11:26:14
-- Target DBMS : PostgreSQL 9.x
--

-- 
-- TABLE: "Dim_Album" 
--

CREATE TABLE "Dim_Album"(
    "AlbumId_SK"  int4            NOT NULL,
    "Artist_Id"   int4            NOT NULL,
    "AlbumTitle"  varchar(160)    NOT NULL,
    "ArtistName"  varchar(120),
    CONSTRAINT "PK7" PRIMARY KEY ("AlbumId_SK", "Artist_Id")
)
;



-- 
-- TABLE: "Dim_Customer" 
--

CREATE TABLE "Dim_Customer"(
    "CustomerId_SK"   int4           NOT NULL,
    "Company"         varchar(80),
    "Fax"             varchar(30),
    "FirstName"       varchar(40)    NOT NULL,
    "LastName"        varchar(20)    NOT NULL,
    "Phone"           varchar(24),
    "Email"           varchar(60)    NOT NULL,
    "Type"            varchar(60)    NOT NULL,
    "GeographyId_SK"  int4           NOT NULL,
    CONSTRAINT "PK5_2" PRIMARY KEY ("CustomerId_SK")
)
;



-- 
-- TABLE: "Dim_Date" 
--

CREATE TABLE "Dim_Date"(
    "DateKey"  int4           NOT NULL,
    "Year"     int4,
    "Quarter"  varchar(10),
    "Month"    varchar(10),
    "Date"     date,
    "Day"      varchar(30),
    CONSTRAINT "PK6" PRIMARY KEY ("DateKey")
)
;



-- 
-- TABLE: "Dim_Employee" 
--

CREATE TABLE "Dim_Employee"(
    "EmployeeId_SK"   int4           NOT NULL,
    "ReportsTo"       int4,
    "BirthDate"       timestamp      NOT NULL,
    "HireDate"        timestamp,
    "Fax"             varchar(30),
    "FirstName"       varchar(40)    NOT NULL,
    "LastName"        varchar(20)    NOT NULL,
    "Phone"           varchar(24),
    "Email"           varchar(60)    NOT NULL,
    "Title"           varchar(30)    NOT NULL,
    "GeographyId_SK"  int4           NOT NULL,
    CONSTRAINT "PK5_1" PRIMARY KEY ("EmployeeId_SK")
)
;



-- 
-- TABLE: "Dim_Geography" 
--

CREATE TABLE "Dim_Geography"(
    "GeographyId_SK"  int4           NOT NULL,
    "Country"         varchar(40)    NOT NULL,
    "State"           varchar(40),
    "City"            varchar(40),
    "PostalCode"      varchar(10),
    CONSTRAINT "PK8" PRIMARY KEY ("GeographyId_SK")
)
;



-- 
-- TABLE: "Dim_Playlist" 
--

CREATE TABLE "Dim_Playlist"(
    "PlaylistId_SK"  int4            NOT NULL,
    "PlaylistName"   varchar(120),
    CONSTRAINT "PK1_1" PRIMARY KEY ("PlaylistId_SK")
)
;



-- 
-- TABLE: "Dim_Track" 
--

CREATE TABLE "Dim_Track"(
    "TrackId_SK"     int4            NOT NULL,
    "PlaylistId_SK"  int4            NOT NULL,
    "MediaName"      varchar(120),
    "GenreName"      varchar(120),
    "MediaTypeId"    int4            NOT NULL,
    "GenreId"        int4            NOT NULL,
    "Bytes"          int4,
    "TrackName"      varchar(200)    NOT NULL,
    "Composer"       varchar(220),
    "Millisecond"    int4            NOT NULL,
    "AlbumId_SK"     int4            NOT NULL,
    "Artist_Id"      int4            NOT NULL,
    CONSTRAINT "PK4" PRIMARY KEY ("TrackId_SK", "PlaylistId_SK")
)
;



-- 
-- TABLE: "FactInvoice" 
--

CREATE TABLE "FactInvoice"(
    "InvoiceId_SK"    int4              NOT NULL,
    "InvoiceLineId"   int4              NOT NULL,
    "DateKey"         int4              NOT NULL,
    "BillingAddress"  varchar(70),
    "UnitPrice"       numeric(10, 2)    NOT NULL,
    "Quantity"        int4              NOT NULL,
    "Total"           numeric(10, 2)    NOT NULL,
    "TrackId_SK"      int4              NOT NULL,
    "PlaylistId_SK"   int4              NOT NULL,
    "EmployeeId_SK"   int4              NOT NULL,
    "CustomerId_SK"   int4              NOT NULL,
    "GeographyId_SK"  int4              NOT NULL,
    CONSTRAINT "PK2" PRIMARY KEY ("InvoiceId_SK", "InvoiceLineId", "DateKey")
)
;



-- 
-- TABLE: "Dim_Customer" 
--

ALTER TABLE "Dim_Customer" ADD CONSTRAINT "RefDim_Geography27" 
    FOREIGN KEY ("GeographyId_SK")
    REFERENCES "Dim_Geography"("GeographyId_SK")
;


-- 
-- TABLE: "Dim_Employee" 
--

ALTER TABLE "Dim_Employee" ADD CONSTRAINT "RefDim_Employee24" 
    FOREIGN KEY ("ReportsTo")
    REFERENCES "Dim_Employee"("EmployeeId_SK")
;

ALTER TABLE "Dim_Employee" ADD CONSTRAINT "RefDim_Geography26" 
    FOREIGN KEY ("GeographyId_SK")
    REFERENCES "Dim_Geography"("GeographyId_SK")
;


-- 
-- TABLE: "Dim_Track" 
--

ALTER TABLE "Dim_Track" ADD CONSTRAINT "RefDim_Playlist15" 
    FOREIGN KEY ("PlaylistId_SK")
    REFERENCES "Dim_Playlist"("PlaylistId_SK")
;

ALTER TABLE "Dim_Track" ADD CONSTRAINT "RefDim_Album16" 
    FOREIGN KEY ("AlbumId_SK", "Artist_Id")
    REFERENCES "Dim_Album"("AlbumId_SK", "Artist_Id")
;


-- 
-- TABLE: "FactInvoice" 
--

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Track4" 
    FOREIGN KEY ("TrackId_SK", "PlaylistId_SK")
    REFERENCES "Dim_Track"("TrackId_SK", "PlaylistId_SK")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Date23" 
    FOREIGN KEY ("DateKey")
    REFERENCES "Dim_Date"("DateKey")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Employee28" 
    FOREIGN KEY ("EmployeeId_SK")
    REFERENCES "Dim_Employee"("EmployeeId_SK")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Customer29" 
    FOREIGN KEY ("CustomerId_SK")
    REFERENCES "Dim_Customer"("CustomerId_SK")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Geography30" 
    FOREIGN KEY ("GeographyId_SK")
    REFERENCES "Dim_Geography"("GeographyId_SK")
;


