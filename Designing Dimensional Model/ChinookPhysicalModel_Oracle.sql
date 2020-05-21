--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Chinook_ERtoDimensional.DM1
--
-- Date Created : Thursday, January 30, 2020 11:25:27
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: Dim_Album 
--

CREATE TABLE Dim_Album(
    AlbumId_SK    NUMBER(38, 0)     NOT NULL,
    Artist_Id     NUMBER(38, 0)     NOT NULL,
    AlbumTitle    NVARCHAR2(160)    NOT NULL,
    ArtistName    NVARCHAR2(120),
    CONSTRAINT PK7 PRIMARY KEY (AlbumId_SK, Artist_Id)
)
;



-- 
-- TABLE: Dim_Customer 
--

CREATE TABLE Dim_Customer(
    CustomerId_SK     NUMBER(38, 0)    NOT NULL,
    Company           NVARCHAR2(80),
    Fax               VARCHAR2(30),
    FirstName         NVARCHAR2(40)    NOT NULL,
    LastName          NVARCHAR2(20)    NOT NULL,
    Phone             NVARCHAR2(24),
    Email             NVARCHAR2(60)    NOT NULL,
    Type              NVARCHAR2(60)    NOT NULL,
    GeographyId_SK    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK5_2 PRIMARY KEY (CustomerId_SK)
)
;



-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    DateKey    NUMBER(38, 0)    NOT NULL,
    Year       NUMBER(38, 0),
    Quarter    VARCHAR2(10),
    Month      VARCHAR2(10),
    Date       DATE,
    Day        VARCHAR2(30),
    CONSTRAINT PK6 PRIMARY KEY (DateKey)
)
;



-- 
-- TABLE: Dim_Employee 
--

CREATE TABLE Dim_Employee(
    EmployeeId_SK     NUMBER(38, 0)    NOT NULL,
    ReportsTo         NUMBER(38, 0),
    BirthDate         TIMESTAMP(6)     NOT NULL,
    HireDate          TIMESTAMP(6),
    Fax               VARCHAR2(30),
    FirstName         NVARCHAR2(40)    NOT NULL,
    LastName          NVARCHAR2(20)    NOT NULL,
    Phone             NVARCHAR2(24),
    Email             NVARCHAR2(60)    NOT NULL,
    Title             NVARCHAR2(30)    NOT NULL,
    GeographyId_SK    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK5_1 PRIMARY KEY (EmployeeId_SK)
)
;



-- 
-- TABLE: Dim_Geography 
--

CREATE TABLE Dim_Geography(
    GeographyId_SK    NUMBER(38, 0)    NOT NULL,
    Country           NVARCHAR2(40)    NOT NULL,
    State             NVARCHAR2(40),
    City              NVARCHAR2(40),
    PostalCode        NVARCHAR2(10),
    CONSTRAINT PK8 PRIMARY KEY (GeographyId_SK)
)
;



-- 
-- TABLE: Dim_Playlist 
--

CREATE TABLE Dim_Playlist(
    PlaylistId_SK    NUMBER(38, 0)     NOT NULL,
    PlaylistName     NVARCHAR2(120),
    CONSTRAINT PK1_1 PRIMARY KEY (PlaylistId_SK)
)
;



-- 
-- TABLE: Dim_Track 
--

CREATE TABLE Dim_Track(
    TrackId_SK       NUMBER(38, 0)     NOT NULL,
    PlaylistId_SK    NUMBER(38, 0)     NOT NULL,
    MediaName        NVARCHAR2(120),
    GenreName        NVARCHAR2(120),
    MediaTypeId      NUMBER(38, 0)     NOT NULL,
    GenreId          NUMBER(38, 0)     NOT NULL,
    Bytes            NUMBER(38, 0),
    TrackName        NVARCHAR2(200)    NOT NULL,
    Composer         NVARCHAR2(220),
    Millisecond      NUMBER(38, 0)     NOT NULL,
    AlbumId_SK       NUMBER(38, 0)     NOT NULL,
    Artist_Id        NUMBER(38, 0)     NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (TrackId_SK, PlaylistId_SK)
)
;



-- 
-- TABLE: FactInvoice 
--

CREATE TABLE FactInvoice(
    InvoiceId_SK      NUMBER(38, 0)    NOT NULL,
    InvoiceLineId     NUMBER(38, 0)    NOT NULL,
    DateKey           NUMBER(38, 0)    NOT NULL,
    BillingAddress    NVARCHAR2(70),
    UnitPrice         NUMBER(10, 2)    NOT NULL,
    Quantity          NUMBER(38, 0)    NOT NULL,
    Total             NUMBER(10, 2)    NOT NULL,
    TrackId_SK        NUMBER(38, 0)    NOT NULL,
    PlaylistId_SK     NUMBER(38, 0)    NOT NULL,
    EmployeeId_SK     NUMBER(38, 0)    NOT NULL,
    CustomerId_SK     NUMBER(38, 0)    NOT NULL,
    GeographyId_SK    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (InvoiceId_SK, InvoiceLineId, DateKey)
)
;



-- 
-- TABLE: Dim_Customer 
--

ALTER TABLE Dim_Customer ADD CONSTRAINT RefDim_Geography27 
    FOREIGN KEY (GeographyId_SK)
    REFERENCES Dim_Geography(GeographyId_SK)
;


-- 
-- TABLE: Dim_Employee 
--

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Employee24 
    FOREIGN KEY (ReportsTo)
    REFERENCES Dim_Employee(EmployeeId_SK)
;

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Geography26 
    FOREIGN KEY (GeographyId_SK)
    REFERENCES Dim_Geography(GeographyId_SK)
;


-- 
-- TABLE: Dim_Track 
--

ALTER TABLE Dim_Track ADD CONSTRAINT RefDim_Playlist15 
    FOREIGN KEY (PlaylistId_SK)
    REFERENCES Dim_Playlist(PlaylistId_SK)
;

ALTER TABLE Dim_Track ADD CONSTRAINT RefDim_Album16 
    FOREIGN KEY (AlbumId_SK, Artist_Id)
    REFERENCES Dim_Album(AlbumId_SK, Artist_Id)
;


-- 
-- TABLE: FactInvoice 
--

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Track4 
    FOREIGN KEY (TrackId_SK, PlaylistId_SK)
    REFERENCES Dim_Track(TrackId_SK, PlaylistId_SK)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Date23 
    FOREIGN KEY (DateKey)
    REFERENCES Dim_Date(DateKey)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Employee28 
    FOREIGN KEY (EmployeeId_SK)
    REFERENCES Dim_Employee(EmployeeId_SK)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Customer29 
    FOREIGN KEY (CustomerId_SK)
    REFERENCES Dim_Customer(CustomerId_SK)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Geography30 
    FOREIGN KEY (GeographyId_SK)
    REFERENCES Dim_Geography(GeographyId_SK)
;


