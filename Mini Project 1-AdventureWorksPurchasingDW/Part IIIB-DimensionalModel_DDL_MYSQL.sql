--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Talend_ER.DM1
--
-- Date Created : Wednesday, February 26, 2020 23:44:06
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Dim_RejectCodes 
--

CREATE TABLE Dim_RejectCodes(
    RejectCode_SK           INT                     AUTO_INCREMENT,
    DI_RejectCode           NATIONAL VARCHAR(10)    NOT NULL,
    DI_RejectReason         NATIONAL VARCHAR(50)    NOT NULL,
    DI_RejectDescription    NATIONAL VARCHAR(50)    NOT NULL,
    SOR_ID                  INT,
    DI_Job_ID               INT                     NOT NULL,
    DI_Create_Date          DATE                    NOT NULL,
    DI_Modified_Date        DATE                    NOT NULL,
    PRIMARY KEY (RejectCode_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_SORSystem 
--

CREATE TABLE Dim_SORSystem(
    SOR_ID              INT                     AUTO_INCREMENT,
    SOR_Name            NATIONAL VARCHAR(30)    NOT NULL,
    SOR_Module          NATIONAL VARCHAR(30)    NOT NULL,
    SOR_Table           NATIONAL VARCHAR(30)    NOT NULL,
    DI_Job_ID           INT                     NOT NULL,
    DI_Create_Date      DATE                    NOT NULL,
    DI_Modified_Date    DATE                    NOT NULL,
    PRIMARY KEY (SOR_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateSK               BIGINT                  NOT NULL,
    DateAK               DATE                    NOT NULL,
    DayNameOfWeek        CHAR(10),
    DayNumberOfWeek      INT                     NOT NULL,
    DayNameOfWeekAbbr    CHAR(10),
    DayNumberOfMonth     TINYINT                 NOT NULL,
    WeekNumberOfYear     INT,
    MonthName            NATIONAL VARCHAR(10)    NOT NULL,
    MonthNameAbbr        NATIONAL VARCHAR(10),
    MonthNumber          TINYINT                 NOT NULL,
    Year                 INT,
    DayNumberOfYear      SMALLINT                NOT NULL,
    SOR_ID               INT,
    DI_Create_Date       DATE,
    DI_Modified_Date     DATE,
    DI_Job_ID            INT                     NOT NULL,
    PRIMARY KEY (DateSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeID_SK          INT                     AUTO_INCREMENT,
    BusinessEntityID_NK    INT                     NOT NULL,
    AddressLine1           NATIONAL VARCHAR(60),
    RateChangeDate_NK      DATETIME                NOT NULL,
    Rate                   DECIMAL(19, 2)          NOT NULL,
    PayFrequency           SMALLINT                NOT NULL,
    FirstName              NATIONAL VARCHAR(50)    NOT NULL,
    LastName               NATIONAL VARCHAR(50)    NOT NULL,
    EmailAddress           NATIONAL VARCHAR(50)    NOT NULL,
    Phone                  NATIONAL VARCHAR(25)    NOT NULL,
    CurrentFlag            BINARY(1)               NOT NULL,
    NationalIDNumber       NATIONAL VARCHAR(15)    NOT NULL,
    LoginID                NATIONAL VARCHAR(25)    NOT NULL,
    OrganizationNode       CHAR(10)                NOT NULL,
    OrganizationLevel      NATIONAL VARCHAR(10)    NOT NULL,
    JobTitle               NATIONAL VARCHAR(50)    NOT NULL,
    MaritalStatus          BINARY(1)               NOT NULL,
    Gender                 NATIONAL CHAR(1)        NOT NULL,
    SalariedFlag           BINARY(1)               NOT NULL,
    VacationHours          SMALLINT                NOT NULL,
    SickLevelHours         SMALLINT                NOT NULL,
    BirthDate              BIGINT,
    HireDate               BIGINT,
    GeographyID_SK         INT,
    SOR_ID                 INT,
    ETLLoadID              INT,
    ETLLoadDate            DATETIME                NOT NULL,
    DI_Job_ID              INT                     NOT NULL,
    DI_Create_Date         DATE                    NOT NULL,
    DI_Modified_Date       DATE                    NOT NULL,
    PRIMARY KEY (EmployeeID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployeePay 
--

CREATE TABLE DimEmployeePay(
    EmployeePay_Table_SK     INT               NOT NULL,
    EmployeeID_Durable_SK    INT,
    BusinessEntityID_NK      INT               NOT NULL,
    RateChangeDate_NK        DATETIME          NOT NULL,
    `Current Indicator`      BINARY(1)         NOT NULL,
    IneffectiveDate          DATETIME          NOT NULL,
    EffectiveDate            DATETIME          NOT NULL,
    ModifiedDate             DATETIME          NOT NULL,
    Rate                     DECIMAL(19, 2)    NOT NULL,
    PayFrequency             TINYINT           NOT NULL,
    ETLLoadDate              DATETIME,
    ETLLoadID                INT,
    DI_Job_ID                INT,
    DI_Create_Date           DATE              NOT NULL,
    DI_Modified_Date         DATE              NOT NULL,
    SOR_ID                   INT,
    PRIMARY KEY (EmployeePay_Table_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeographyID_SK         INT                     AUTO_INCREMENT,
    StateProvinceCode      NATIONAL VARCHAR(3),
    CountryRegionCode      NATIONAL VARCHAR(3),
    CountryRegionName      NATIONAL VARCHAR(20)    NOT NULL,
    State                  NATIONAL VARCHAR(30)    NOT NULL,
    City                   NATIONAL VARCHAR(30)    NOT NULL,
    ZipCode                NATIONAL VARCHAR(30)    NOT NULL,
    SOR_ID                 INT,
    ETLLoadID              INT,
    ETLLoadDate            DATETIME,
    DI_Job_ID              INT                     NOT NULL,
    DI_Create_Date         DATE                    NOT NULL,
    DI_Modified_Date       DATE                    NOT NULL,
    SalesTerritoryID_SK    INT,
    PRIMARY KEY (GeographyID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimLocation 
--

CREATE TABLE DimLocation(
    LocationID_SK       INT                     AUTO_INCREMENT,
    LocationID_NK       SMALLINT                NOT NULL,
    LocationName        NATIONAL VARCHAR(50)    NOT NULL,
    CostRate            DECIMAL(7, 2)           NOT NULL,
    Availability        DECIMAL(8, 2)           NOT NULL,
    SOR_ID              INT,
    DI_Job_ID           INT                     NOT NULL,
    DI_Create_Date      DATE                    NOT NULL,
    DI_Modified_Date    DATE                    NOT NULL,
    PRIMARY KEY (LocationID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductCostHistory 
--

CREATE TABLE DimProductCostHistory(
    ProStdCost_SK        INT               AUTO_INCREMENT,
    ProdID_Durable_SK    INT,
    CostPrice            DECIMAL(19, 2)    NOT NULL,
    EffectiveDate        BIGINT,
    IneffectiveDate      BIGINT,
    CurrentIndicator     BINARY(1)         NOT NULL,
    SOR_ID               INT,
    DI_Job_ID            INT               NOT NULL,
    DI_Create_Date       DATE              NOT NULL,
    DI_Modified_Date     DATE              NOT NULL,
    PRIMARY KEY (ProStdCost_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductPriceHistory 
--

CREATE TABLE DimProductPriceHistory(
    ProdLisPrice_SK      INT               AUTO_INCREMENT,
    ProdID_Durable_SK    INT,
    CurrentIndicator     BINARY(1)         NOT NULL,
    ListPrice            DECIMAL(19, 2)    NOT NULL,
    EffectiveDate        BIGINT,
    IneffectiveDate      BIGINT,
    SOR_ID               INT,
    DI_Job_ID            INT               NOT NULL,
    DI_Create_Date       DATE              NOT NULL,
    DI_Modified_Date     DATE              NOT NULL,
    PRIMARY KEY (ProdLisPrice_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProducts_Purchased 
--

CREATE TABLE DimProducts_Purchased(
    ProductID_SK         INT                     AUTO_INCREMENT,
    ProductID_NK         INT                     NOT NULL,
    StandardCost         DECIMAL(19, 2)          NOT NULL,
    ListPrice            DECIMAL(19, 2)          NOT NULL,
    Name                 NATIONAL VARCHAR(50)    NOT NULL,
    ProductNumber        NATIONAL VARCHAR(25)    NOT NULL,
    ProductModelID       INT                     NOT NULL,
    ModelName            NATIONAL VARCHAR(50)    NOT NULL,
    ProductCategoryID    INT                     NOT NULL,
    CategoryName         NATIONAL VARCHAR(50)    NOT NULL,
    SubCategoryID        INT                     NOT NULL,
    SubCategoryName      NATIONAL VARCHAR(50)    NOT NULL,
    Weight               DECIMAL(8, 2)           NOT NULL,
    Size                 NATIONAL VARCHAR(5)     NOT NULL,
    SOR_ID               INT,
    DI_Job_ID            INT,
    DI_Create_Date       DATE                    NOT NULL,
    DI_Modified_Date     DATE                    NOT NULL,
    PRIMARY KEY (ProductID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductVendor 
--

CREATE TABLE DimProductVendor(
    ProductVendor_SK       INT               AUTO_INCREMENT,
    ProductID_NK           INT,
    BusinessEntityID_NK    INT               NOT NULL,
    AverageLeadTime        INT               NOT NULL,
    StandardPrice          DECIMAL(19, 2)    NOT NULL,
    MinOrderqty            INT               NOT NULL,
    MaxOrderQty            INT               NOT NULL,
    OnOrderQty             INT               NOT NULL,
    LastReceiptDate        BIGINT,
    SOR_ID                 INT,
    ETLLoadID              INT,
    ETLLoadDate            DATETIME          NOT NULL,
    DI_Job_ID              INT               NOT NULL,
    DI_Create_Date         DATE              NOT NULL,
    DI_Modified_Date       DATE              NOT NULL,
    PRIMARY KEY (ProductVendor_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritoryID_SK    INT                     AUTO_INCREMENT,
    TerritoryID_PK         INT                     NOT NULL,
    CountryRegionCode      NATIONAL VARCHAR(3)     NOT NULL,
    TerritoryName          NATIONAL VARCHAR(50)    NOT NULL,
    CostLastYear           DECIMAL(19, 2)          NOT NULL,
    CostYTD                DECIMAL(19, 2)          NOT NULL,
    SalesLastYear          DECIMAL(19, 2)          NOT NULL,
    SalesYTD               DECIMAL(19, 2)          NOT NULL,
    Group                  NATIONAL VARCHAR(50)    NOT NULL,
    DI_Job_ID              INT,
    DI_Create_Date         DATE                    NOT NULL,
    DI_Modified_Date       DATE                    NOT NULL,
    SOR_ID                 INT,
    PRIMARY KEY (SalesTerritoryID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimShipMethod 
--

CREATE TABLE DimShipMethod(
    ShipMethodID_SK     INT                     AUTO_INCREMENT,
    ShipMethodID_NK     INT                     NOT NULL,
    ShipRate            DECIMAL(19, 2)          NOT NULL,
    ShipBase            DECIMAL(19, 2)          NOT NULL,
    ShipMethodName      NATIONAL VARCHAR(50)    NOT NULL,
    SOR_ID              INT,
    ETLLoadID           INT,
    ETLLoadDate         DATETIME                NOT NULL,
    DI_Job_ID           INT                     NOT NULL,
    DI_Create_Date      DATE                    NOT NULL,
    DI_Modified_Date    DATE                    NOT NULL,
    PRIMARY KEY (ShipMethodID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimVendor 
--

CREATE TABLE DimVendor(
    VendorID_SK              INT                      AUTO_INCREMENT,
    BusinessEntityID_NK      INT                      NOT NULL,
    Title                    NATIONAL VARCHAR(8),
    FirstName                NATIONAL VARCHAR(50)     NOT NULL,
    MiddleName               NATIONAL VARCHAR(50),
    LastName                 NATIONAL VARCHAR(50)     NOT NULL,
    AddressLine1             NATIONAL VARCHAR(254),
    ActiveFlag               BINARY(1)                NOT NULL,
    PrefferedVendorStatus    BINARY(1)                NOT NULL,
    AccountNumber            NATIONAL VARCHAR(15)     NOT NULL,
    VendorName               NATIONAL VARCHAR(50)     NOT NULL,
    CreditRating             TINYINT                  NOT NULL,
    SOR_ID                   INT,
    ETLLoadID                INT,
    ETLLoadDate              DATETIME                 NOT NULL,
    DI_Job_ID                INT                      NOT NULL,
    DI_Create_Date           DATE                     NOT NULL,
    DI_Modified_Date         DATE                     NOT NULL,
    PRIMARY KEY (VendorID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimVendorContacts 
--

CREATE TABLE DimVendorContacts(
    VendorContact_SK        INT                     AUTO_INCREMENT,
    Title                   NATIONAL VARCHAR(30),
    FirstName               NATIONAL VARCHAR(50),
    MiddleName              NATIONAL VARCHAR(50),
    LastName                NATIONAL VARCHAR(50),
    BusinessEntittyID_NK    INT                     NOT NULL,
    ContactType             NATIONAL VARCHAR(50)    NOT NULL,
    PhoneNumber             NATIONAL VARCHAR(25),
    PhoneNumberType         NATIONAL VARCHAR(50),
    EmailAddress            NATIONAL VARCHAR(50),
    EmailPromotion          INT                     NOT NULL,
    VendorID_SK             INT,
    SOR_ID                  INT,
    ETLLoadID               INT,
    ETLLoadDate             DATETIME                NOT NULL,
    DI_Job_ID               INT                     NOT NULL,
    DI_Create_Date          DATE                    NOT NULL,
    DI_Modified_Date        DATE                    NOT NULL,
    PRIMARY KEY (VendorContact_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactProductInventory 
--

CREATE TABLE FactProductInventory(
    ProductInventory_SK      INT                     AUTO_INCREMENT,
    ProductID_Durable_SK     INT,
    LocationID_Durable_SK    INT,
    Bin                      TINYINT                 NOT NULL,
    Shelf                    NATIONAL VARCHAR(10)    NOT NULL,
    Quantity                 SMALLINT                NOT NULL,
    DI_Modified_Date         DATE                    NOT NULL,
    DI_Create_Date           DATE                    NOT NULL,
    DI_Job_ID                INT,
    SOR_ID                   INT,
    PRIMARY KEY (ProductInventory_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactPurchases 
--

CREATE TABLE FactPurchases(
    ProductOrderID         INT               AUTO_INCREMENT,
    RevisionNumber         TINYINT           NOT NULL,
    Status                 TINYINT           NOT NULL,
    TaxAmount              DECIMAL(19, 2)    NOT NULL,
    SubTotal               DECIMAL(19, 2)    NOT NULL,
    TotalDue               DECIMAL(19, 2)    NOT NULL,
    Freight                DECIMAL(19, 2)    NOT NULL,
    StockedQty             DECIMAL(8, 2)     NOT NULL,
    OrderQty               SMALLINT          NOT NULL,
    LineTotal              DECIMAL(19, 2)    NOT NULL,
    RejectedQty            DECIMAL(8, 2)     NOT NULL,
    RecievedQty            DECIMAL(8, 2)     NOT NULL,
    ProductID_SK           INT,
    ProductVendor_SK       INT,
    ShipMethodID_SK        INT,
    GeographyID_SK         INT,
    VendorID_SK            INT,
    EmployeeID_SK          INT,
    OrderDate              BIGINT,
    DueDate                BIGINT,
    ShipDate               BIGINT,
    SOR_ID                 INT,
    ETLLoadID              INT,
    ETLLoadDate            DATETIME          NOT NULL,
    DI_Job_ID              INT               NOT NULL,
    DI_Create_Date         DATE              NOT NULL,
    DI_Modified_Date       DATE              NOT NULL,
    SalesTerritoryID_SK    INT,
    PRIMARY KEY (ProductOrderID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactPurchases_Rejects 
--

CREATE TABLE FactPurchases_Rejects(
    ProdOrderRejectID    INT               AUTO_INCREMENT,
    RevisionNumber       TINYINT           NOT NULL,
    Status               TINYINT           NOT NULL,
    TaxAmount            DECIMAL(19, 2)    NOT NULL,
    SubTotal             DECIMAL(19, 2)    NOT NULL,
    TotalDue             DECIMAL(19, 2)    NOT NULL,
    Freight              DECIMAL(19, 2)    NOT NULL,
    StockedQty           DECIMAL(8, 2)     NOT NULL,
    OrderQty             SMALLINT          NOT NULL,
    LineTotal            DECIMAL(19, 2)    NOT NULL,
    RejectedQty          DECIMAL(8, 2)     NOT NULL,
    RecievedQty          DECIMAL(8, 2)     NOT NULL,
    ProductID_SK         INT,
    ProductVendor_SK     INT,
    ShipMethodID_SK      INT,
    GeographyID_SK       INT,
    VendorID_SK          INT,
    EmployeeID_SK        INT,
    OrderDate            DATETIME,
    DueDate              DATETIME,
    ShipDate             DATETIME,
    ProductOrderID       INT,
    RejectCode_SK        INT,
    SOR_ID               INT,
    DI_Job_ID            INT               NOT NULL,
    DI_Create_Date       DATE              NOT NULL,
    DI_Modified_Date     DATE              NOT NULL,
    ETLLoadID            INT,
    ETLLoadDate          DATETIME,
    PRIMARY KEY (ProdOrderRejectID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactWorkOrder 
--

CREATE TABLE FactWorkOrder(
    WorkOrderID         INT         AUTO_INCREMENT,
    ScrappedQty         SMALLINT    NOT NULL,
    OrderQty            INT         NOT NULL,
    ScrapReasonID_SK    SMALLINT,
    ProductID_SK        INT,
    StartDate           BIGINT,
    EndDate             BIGINT,
    DueDate             BIGINT,
    SOR_ID              INT,
    DI_Job_ID           INT         NOT NULL,
    DI_Create_Date      DATE        NOT NULL,
    DI_Modified_Date    DATE        NOT NULL,
    PRIMARY KEY (WorkOrderID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactWorkOrder_Rejects 
--

CREATE TABLE FactWorkOrder_Rejects(
    WorkOrderRejectID    INT         AUTO_INCREMENT,
    ScrappedQty          SMALLINT    NOT NULL,
    StartDate            DATETIME    NOT NULL,
    EndDate              DATETIME    NOT NULL,
    DueDate              INT         NOT NULL,
    OrderQty             INT         NOT NULL,
    ScrapReasonID_SK     SMALLINT,
    ProductID_SK         INT,
    WorkOrderID          INT,
    RejectCode_SK        INT,
    SOR_ID               INT,
    DI_Job_ID            INT         NOT NULL,
    DI_Create_Date       DATE        NOT NULL,
    DI_Modified_Date     DATE        NOT NULL,
    PRIMARY KEY (WorkOrderRejectID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactWorkOrderRouting 
--

CREATE TABLE FactWorkOrderRouting(
    WorkRoutingID_SK        INT               AUTO_INCREMENT,
    OperationSequence_NK    SMALLINT          NOT NULL,
    ActualResourceHrs       DECIMAL(9, 4),
    PlannedCost             DECIMAL(19, 2)    NOT NULL,
    ActualCost              DECIMAL(19, 2),
    WorkOrderID             INT,
    ProductID_SK            INT,
    LocationID_SK           INT,
    ActualStartDate         BIGINT,
    ActualEndDate           BIGINT,
    ScheduledStartDate      BIGINT,
    ScheduledEndDate        BIGINT,
    SOR_ID                  INT,
    DI_Job_ID               INT               NOT NULL,
    DI_Create_Date          DATE              NOT NULL,
    DI_Modified_Date        DATE              NOT NULL,
    PRIMARY KEY (WorkRoutingID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactWorkOrderRouting_Rejects 
--

CREATE TABLE FactWorkOrderRouting_Rejects(
    WorkRoutRejectID_SK     INT               AUTO_INCREMENT,
    OperationSequence_NK    SMALLINT          NOT NULL,
    ScheduledStartDate      DATETIME          NOT NULL,
    ScheduledEndDate        INT               NOT NULL,
    ActualStartDate         DATETIME,
    ActualEndDate           DATETIME          NOT NULL,
    ActualResourceHrs       DECIMAL(9, 4),
    PlannedCost             DECIMAL(19, 2)    NOT NULL,
    ActualCost              DECIMAL(19, 2),
    WorkOrderID             INT,
    ProductID_SK            INT,
    LocationID_SK           INT,
    WorkRoutingID_SK        INT,
    RejectCode_SK           INT,
    SOR_ID                  INT,
    DI_Job_ID               INT               NOT NULL,
    DI_Create_Date          DATE              NOT NULL,
    DI_Modified_Date        DATE              NOT NULL,
    PRIMARY KEY (WorkRoutRejectID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: ScrapReason 
--

CREATE TABLE ScrapReason(
    ScrapReasonID_SK    SMALLINT                AUTO_INCREMENT,
    ScrapReasonID_NK    SMALLINT                NOT NULL,
    ScrapReasonName     NATIONAL VARCHAR(50)    NOT NULL,
    SOR_ID              INT,
    DI_Job_ID           INT                     NOT NULL,
    DI_Create_Date      DATE                    NOT NULL,
    DI_Modified_Date    DATE                    NOT NULL,
    PRIMARY KEY (ScrapReasonID_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_RejectCodes 
--

ALTER TABLE Dim_RejectCodes ADD CONSTRAINT RefDim_SORSystem48 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimEmployee 
--

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimDate69 
    FOREIGN KEY (BirthDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimDate70 
    FOREIGN KEY (HireDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimGeography25 
    FOREIGN KEY (GeographyID_SK)
    REFERENCES DimGeography(GeographyID_SK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDim_SORSystem50 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimEmployeePay 
--

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimEmployee76 
    FOREIGN KEY (EmployeeID_Durable_SK)
    REFERENCES DimEmployee(EmployeeID_SK)
;

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDim_SORSystem85 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimGeography 
--

ALTER TABLE DimGeography ADD CONSTRAINT RefDim_SORSystem57 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE DimGeography ADD CONSTRAINT RefDimSalesTerritory87 
    FOREIGN KEY (SalesTerritoryID_SK)
    REFERENCES DimSalesTerritory(SalesTerritoryID_SK)
;


-- 
-- TABLE: DimLocation 
--

ALTER TABLE DimLocation ADD CONSTRAINT RefDim_SORSystem53 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimProductCostHistory 
--

ALTER TABLE DimProductCostHistory ADD CONSTRAINT RefDimDate71 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE DimProductCostHistory ADD CONSTRAINT RefDimDate72 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE DimProductCostHistory ADD CONSTRAINT RefDimProducts_Purchased26 
    FOREIGN KEY (ProdID_Durable_SK)
    REFERENCES DimProducts_Purchased(ProductID_SK)
;

ALTER TABLE DimProductCostHistory ADD CONSTRAINT RefDim_SORSystem51 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimProductPriceHistory 
--

ALTER TABLE DimProductPriceHistory ADD CONSTRAINT RefDimDate73 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE DimProductPriceHistory ADD CONSTRAINT RefDimDate74 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE DimProductPriceHistory ADD CONSTRAINT RefDimProducts_Purchased4 
    FOREIGN KEY (ProdID_Durable_SK)
    REFERENCES DimProducts_Purchased(ProductID_SK)
;

ALTER TABLE DimProductPriceHistory ADD CONSTRAINT RefDim_SORSystem59 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimProducts_Purchased 
--

ALTER TABLE DimProducts_Purchased ADD CONSTRAINT RefDim_SORSystem58 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimProductVendor 
--

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimDate75 
    FOREIGN KEY (LastReceiptDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDim_SORSystem52 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimSalesTerritory 
--

ALTER TABLE DimSalesTerritory ADD CONSTRAINT RefDim_SORSystem84 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimShipMethod 
--

ALTER TABLE DimShipMethod ADD CONSTRAINT RefDim_SORSystem54 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimVendor 
--

ALTER TABLE DimVendor ADD CONSTRAINT RefDim_SORSystem46 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimVendorContacts 
--

ALTER TABLE DimVendorContacts ADD CONSTRAINT RefDimVendor23 
    FOREIGN KEY (VendorID_SK)
    REFERENCES DimVendor(VendorID_SK)
;

ALTER TABLE DimVendorContacts ADD CONSTRAINT RefDim_SORSystem47 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: FactProductInventory 
--

ALTER TABLE FactProductInventory ADD CONSTRAINT RefDimLocation81 
    FOREIGN KEY (LocationID_Durable_SK)
    REFERENCES DimLocation(LocationID_SK)
;

ALTER TABLE FactProductInventory ADD CONSTRAINT RefDimProducts_Purchased82 
    FOREIGN KEY (ProductID_Durable_SK)
    REFERENCES DimProducts_Purchased(ProductID_SK)
;

ALTER TABLE FactProductInventory ADD CONSTRAINT RefDim_SORSystem86 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: FactPurchases 
--

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimSalesTerritory78 
    FOREIGN KEY (SalesTerritoryID_SK)
    REFERENCES DimSalesTerritory(SalesTerritoryID_SK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimGeography7 
    FOREIGN KEY (GeographyID_SK)
    REFERENCES DimGeography(GeographyID_SK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimProducts_Purchased8 
    FOREIGN KEY (ProductID_SK)
    REFERENCES DimProducts_Purchased(ProductID_SK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimProductVendor9 
    FOREIGN KEY (ProductVendor_SK)
    REFERENCES DimProductVendor(ProductVendor_SK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimShipMethod10 
    FOREIGN KEY (ShipMethodID_SK)
    REFERENCES DimShipMethod(ShipMethodID_SK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimVendor11 
    FOREIGN KEY (VendorID_SK)
    REFERENCES DimVendor(VendorID_SK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimEmployee12 
    FOREIGN KEY (EmployeeID_SK)
    REFERENCES DimEmployee(EmployeeID_SK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimDate13 
    FOREIGN KEY (OrderDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimDate14 
    FOREIGN KEY (OrderDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimDate15 
    FOREIGN KEY (DueDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimDate16 
    FOREIGN KEY (ShipDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDim_SORSystem68 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: FactPurchases_Rejects 
--

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefFactPurchases28 
    FOREIGN KEY (ProductOrderID)
    REFERENCES FactPurchases(ProductOrderID)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDim_RejectCodes61 
    FOREIGN KEY (RejectCode_SK)
    REFERENCES Dim_RejectCodes(RejectCode_SK)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDim_SORSystem64 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: FactWorkOrder 
--

ALTER TABLE FactWorkOrder ADD CONSTRAINT RefScrapReason6 
    FOREIGN KEY (ScrapReasonID_SK)
    REFERENCES ScrapReason(ScrapReasonID_SK)
;

ALTER TABLE FactWorkOrder ADD CONSTRAINT RefDimProducts_Purchased19 
    FOREIGN KEY (ProductID_SK)
    REFERENCES DimProducts_Purchased(ProductID_SK)
;

ALTER TABLE FactWorkOrder ADD CONSTRAINT RefDimDate39 
    FOREIGN KEY (StartDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactWorkOrder ADD CONSTRAINT RefDimDate41 
    FOREIGN KEY (EndDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactWorkOrder ADD CONSTRAINT RefDimDate42 
    FOREIGN KEY (DueDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactWorkOrder ADD CONSTRAINT RefDim_SORSystem67 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: FactWorkOrder_Rejects 
--

ALTER TABLE FactWorkOrder_Rejects ADD CONSTRAINT RefFactWorkOrder30 
    FOREIGN KEY (WorkOrderID)
    REFERENCES FactWorkOrder(WorkOrderID)
;

ALTER TABLE FactWorkOrder_Rejects ADD CONSTRAINT RefDim_RejectCodes62 
    FOREIGN KEY (RejectCode_SK)
    REFERENCES Dim_RejectCodes(RejectCode_SK)
;

ALTER TABLE FactWorkOrder_Rejects ADD CONSTRAINT RefDim_SORSystem65 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: FactWorkOrderRouting 
--

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefFactWorkOrder17 
    FOREIGN KEY (WorkOrderID)
    REFERENCES FactWorkOrder(WorkOrderID)
;

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefDimProducts_Purchased18 
    FOREIGN KEY (ProductID_SK)
    REFERENCES DimProducts_Purchased(ProductID_SK)
;

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefDimLocation24 
    FOREIGN KEY (LocationID_SK)
    REFERENCES DimLocation(LocationID_SK)
;

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefDimDate40 
    FOREIGN KEY (ActualStartDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefDimDate43 
    FOREIGN KEY (ActualEndDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefDimDate44 
    FOREIGN KEY (ScheduledStartDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefDimDate45 
    FOREIGN KEY (ScheduledEndDate)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactWorkOrderRouting ADD CONSTRAINT RefDim_SORSystem66 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: FactWorkOrderRouting_Rejects 
--

ALTER TABLE FactWorkOrderRouting_Rejects ADD CONSTRAINT RefFactWorkOrderRouting29 
    FOREIGN KEY (WorkRoutingID_SK)
    REFERENCES FactWorkOrderRouting(WorkRoutingID_SK)
;

ALTER TABLE FactWorkOrderRouting_Rejects ADD CONSTRAINT RefDim_RejectCodes60 
    FOREIGN KEY (RejectCode_SK)
    REFERENCES Dim_RejectCodes(RejectCode_SK)
;

ALTER TABLE FactWorkOrderRouting_Rejects ADD CONSTRAINT RefDim_SORSystem63 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: ScrapReason 
--

ALTER TABLE ScrapReason ADD CONSTRAINT RefDim_SORSystem49 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


