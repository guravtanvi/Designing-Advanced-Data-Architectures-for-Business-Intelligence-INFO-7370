--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Talend_ER.DM1
--
-- Date Created : Wednesday, February 26, 2020 23:45:04
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: Dim_RejectCodes 
--

CREATE TABLE Dim_RejectCodes(
    RejectCode_SK           NUMBER(38, 0)    NOT NULL,
    DI_RejectCode           NVARCHAR2(10)    NOT NULL,
    DI_RejectReason         NVARCHAR2(50)    NOT NULL,
    DI_RejectDescription    NVARCHAR2(50)    NOT NULL,
    SOR_ID                  NUMBER(38, 0),
    DI_Job_ID               NUMBER(38, 0)    NOT NULL,
    DI_Create_Date          DATE             NOT NULL,
    DI_Modified_Date        DATE             NOT NULL,
    CONSTRAINT PK13_1 PRIMARY KEY (RejectCode_SK)
)
;



-- 
-- TABLE: Dim_SORSystem 
--

CREATE TABLE Dim_SORSystem(
    SOR_ID              NUMBER(38, 0)    NOT NULL,
    SOR_Name            NVARCHAR2(30)    NOT NULL,
    SOR_Module          NVARCHAR2(30)    NOT NULL,
    SOR_Table           NVARCHAR2(30)    NOT NULL,
    DI_Job_ID           NUMBER(38, 0)    NOT NULL,
    DI_Create_Date      DATE             NOT NULL,
    DI_Modified_Date    DATE             NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (SOR_ID)
)
;



-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateSK               NUMBER(19, 0)    NOT NULL,
    DateAK               DATE             NOT NULL,
    DayNameOfWeek        CHAR(10),
    DayNumberOfWeek      NUMBER(38, 0)    NOT NULL,
    DayNameOfWeekAbbr    CHAR(10),
    DayNumberOfMonth     NUMBER(3, 0)     NOT NULL,
    WeekNumberOfYear     NUMBER(38, 0),
    MonthName            NVARCHAR2(10)    NOT NULL,
    MonthNameAbbr        NVARCHAR2(10),
    MonthNumber          NUMBER(3, 0)     NOT NULL,
    Year                 NUMBER(38, 0),
    DayNumberOfYear      SMALLINT         NOT NULL,
    SOR_ID               NUMBER(38, 0),
    DI_Create_Date       DATE,
    DI_Modified_Date     DATE,
    DI_Job_ID            NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (DateSK)
)
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeID_SK          NUMBER(38, 0)    NOT NULL,
    BusinessEntityID_NK    NUMBER(38, 0)    NOT NULL,
    AddressLine1           NVARCHAR2(60),
    RateChangeDate_NK      TIMESTAMP(6)     NOT NULL,
    Rate                   NUMBER(19, 2)    NOT NULL,
    PayFrequency           SMALLINT         NOT NULL,
    FirstName              NVARCHAR2(50)    NOT NULL,
    LastName               NVARCHAR2(50)    NOT NULL,
    EmailAddress           NVARCHAR2(50)    NOT NULL,
    Phone                  NVARCHAR2(25)    NOT NULL,
    CurrentFlag            RAW(1)           NOT NULL,
    NationalIDNumber       NVARCHAR2(15)    NOT NULL,
    LoginID                NVARCHAR2(25)    NOT NULL,
    OrganizationNode       CHAR(10)         NOT NULL,
    OrganizationLevel      NVARCHAR2(10)    NOT NULL,
    JobTitle               NVARCHAR2(50)    NOT NULL,
    MaritalStatus          RAW(1)           NOT NULL,
    Gender                 NCHAR(1)         NOT NULL,
    SalariedFlag           RAW(1)           NOT NULL,
    VacationHours          SMALLINT         NOT NULL,
    SickLevelHours         SMALLINT         NOT NULL,
    BirthDate              NUMBER(19, 0),
    HireDate               NUMBER(19, 0),
    GeographyID_SK         NUMBER(38, 0),
    SOR_ID                 NUMBER(38, 0),
    ETLLoadID              NUMBER(38, 0),
    ETLLoadDate            TIMESTAMP(6)     NOT NULL,
    DI_Job_ID              NUMBER(38, 0)    NOT NULL,
    DI_Create_Date         DATE             NOT NULL,
    DI_Modified_Date       DATE             NOT NULL,
    CONSTRAINT PK1_2 PRIMARY KEY (EmployeeID_SK)
)
;



-- 
-- TABLE: DimEmployeePay 
--

CREATE TABLE DimEmployeePay(
    EmployeePay_Table_SK     NUMBER(38, 0)    NOT NULL,
    EmployeeID_Durable_SK    NUMBER(38, 0),
    BusinessEntityID_NK      NUMBER(38, 0)    NOT NULL,
    RateChangeDate_NK        TIMESTAMP(6)     NOT NULL,
    "Current Indicator"      RAW(1)           NOT NULL,
    IneffectiveDate          TIMESTAMP(6)     NOT NULL,
    EffectiveDate            TIMESTAMP(6)     NOT NULL,
    ModifiedDate             TIMESTAMP(6)     NOT NULL,
    Rate                     NUMBER(19, 2)    NOT NULL,
    PayFrequency             NUMBER(3, 0)     NOT NULL,
    ETLLoadDate              TIMESTAMP(6),
    ETLLoadID                NUMBER(38, 0),
    DI_Job_ID                NUMBER(38, 0),
    DI_Create_Date           DATE             NOT NULL,
    DI_Modified_Date         DATE             NOT NULL,
    SOR_ID                   NUMBER(38, 0),
    CONSTRAINT PK2 PRIMARY KEY (EmployeePay_Table_SK)
)
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeographyID_SK         NUMBER(38, 0)    NOT NULL,
    StateProvinceCode      NVARCHAR2(3),
    CountryRegionCode      NVARCHAR2(3),
    CountryRegionName      NVARCHAR2(20)    NOT NULL,
    State                  NVARCHAR2(30)    NOT NULL,
    City                   NVARCHAR2(30)    NOT NULL,
    ZipCode                NVARCHAR2(30)    NOT NULL,
    SOR_ID                 NUMBER(38, 0),
    ETLLoadID              NUMBER(38, 0),
    ETLLoadDate            TIMESTAMP(6),
    DI_Job_ID              NUMBER(38, 0)    NOT NULL,
    DI_Create_Date         DATE             NOT NULL,
    DI_Modified_Date       DATE             NOT NULL,
    SalesTerritoryID_SK    NUMBER(38, 0),
    CONSTRAINT PK7 PRIMARY KEY (GeographyID_SK)
)
;



-- 
-- TABLE: DimLocation 
--

CREATE TABLE DimLocation(
    LocationID_SK       NUMBER(38, 0)    NOT NULL,
    LocationID_NK       SMALLINT         NOT NULL,
    LocationName        NVARCHAR2(50)    NOT NULL,
    CostRate            NUMBER(7, 2)     NOT NULL,
    Availability        NUMBER(8, 2)     NOT NULL,
    SOR_ID              NUMBER(38, 0),
    DI_Job_ID           NUMBER(38, 0)    NOT NULL,
    DI_Create_Date      DATE             NOT NULL,
    DI_Modified_Date    DATE             NOT NULL,
    CONSTRAINT PK1_1_3_1 PRIMARY KEY (LocationID_SK)
)
;



-- 
-- TABLE: DimProductCostHistory 
--

CREATE TABLE DimProductCostHistory(
    ProStdCost_SK        NUMBER(38, 0)    NOT NULL,
    ProdID_Durable_SK    NUMBER(38, 0),
    CostPrice            NUMBER(19, 2)    NOT NULL,
    EffectiveDate        NUMBER(19, 0),
    IneffectiveDate      NUMBER(19, 0),
    CurrentIndicator     RAW(1)           NOT NULL,
    SOR_ID               NUMBER(38, 0),
    DI_Job_ID            NUMBER(38, 0)    NOT NULL,
    DI_Create_Date       DATE             NOT NULL,
    DI_Modified_Date     DATE             NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (ProStdCost_SK)
)
;



-- 
-- TABLE: DimProductPriceHistory 
--

CREATE TABLE DimProductPriceHistory(
    ProdLisPrice_SK      NUMBER(38, 0)    NOT NULL,
    ProdID_Durable_SK    NUMBER(38, 0),
    CurrentIndicator     RAW(1)           NOT NULL,
    ListPrice            NUMBER(19, 2)    NOT NULL,
    EffectiveDate        NUMBER(19, 0),
    IneffectiveDate      NUMBER(19, 0),
    SOR_ID               NUMBER(38, 0),
    DI_Job_ID            NUMBER(38, 0)    NOT NULL,
    DI_Create_Date       DATE             NOT NULL,
    DI_Modified_Date     DATE             NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (ProdLisPrice_SK)
)
;



-- 
-- TABLE: DimProducts_Purchased 
--

CREATE TABLE DimProducts_Purchased(
    ProductID_SK         NUMBER(38, 0)    NOT NULL,
    ProductID_NK         NUMBER(38, 0)    NOT NULL,
    StandardCost         NUMBER(19, 2)    NOT NULL,
    ListPrice            NUMBER(19, 2)    NOT NULL,
    Name                 NVARCHAR2(50)    NOT NULL,
    ProductNumber        NVARCHAR2(25)    NOT NULL,
    ProductModelID       NUMBER(38, 0)    NOT NULL,
    ModelName            NVARCHAR2(50)    NOT NULL,
    ProductCategoryID    NUMBER(38, 0)    NOT NULL,
    CategoryName         NVARCHAR2(50)    NOT NULL,
    SubCategoryID        NUMBER(38, 0)    NOT NULL,
    SubCategoryName      NVARCHAR2(50)    NOT NULL,
    Weight               NUMBER(8, 2)     NOT NULL,
    Size                 NVARCHAR2(5)     NOT NULL,
    SOR_ID               NUMBER(38, 0),
    DI_Job_ID            NUMBER(38, 0),
    DI_Create_Date       DATE             NOT NULL,
    DI_Modified_Date     DATE             NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (ProductID_SK)
)
;



-- 
-- TABLE: DimProductVendor 
--

CREATE TABLE DimProductVendor(
    ProductVendor_SK       NUMBER(38, 0)    NOT NULL,
    ProductID_NK           NUMBER(38, 0),
    BusinessEntityID_NK    NUMBER(38, 0)    NOT NULL,
    AverageLeadTime        NUMBER(38, 0)    NOT NULL,
    StandardPrice          NUMBER(19, 2)    NOT NULL,
    MinOrderqty            NUMBER(38, 0)    NOT NULL,
    MaxOrderQty            NUMBER(38, 0)    NOT NULL,
    OnOrderQty             NUMBER(38, 0)    NOT NULL,
    LastReceiptDate        NUMBER(19, 0),
    SOR_ID                 NUMBER(38, 0),
    ETLLoadID              NUMBER(38, 0),
    ETLLoadDate            TIMESTAMP(6)     NOT NULL,
    DI_Job_ID              NUMBER(38, 0)    NOT NULL,
    DI_Create_Date         DATE             NOT NULL,
    DI_Modified_Date       DATE             NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (ProductVendor_SK)
)
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritoryID_SK    NUMBER(38, 0)    NOT NULL,
    TerritoryID_PK         NUMBER(38, 0)    NOT NULL,
    CountryRegionCode      NVARCHAR2(3)     NOT NULL,
    TerritoryName          NVARCHAR2(50)    NOT NULL,
    CostLastYear           NUMBER(19, 2)    NOT NULL,
    CostYTD                NUMBER(19, 2)    NOT NULL,
    SalesLastYear          NUMBER(19, 2)    NOT NULL,
    SalesYTD               NUMBER(19, 2)    NOT NULL,
    Group                  NVARCHAR2(50)    NOT NULL,
    DI_Job_ID              NUMBER(38, 0),
    DI_Create_Date         DATE             NOT NULL,
    DI_Modified_Date       DATE             NOT NULL,
    SOR_ID                 NUMBER(38, 0),
    CONSTRAINT PK1_1_3 PRIMARY KEY (SalesTerritoryID_SK)
)
;



-- 
-- TABLE: DimShipMethod 
--

CREATE TABLE DimShipMethod(
    ShipMethodID_SK     NUMBER(38, 0)    NOT NULL,
    ShipMethodID_NK     NUMBER(38, 0)    NOT NULL,
    ShipRate            NUMBER(19, 2)    NOT NULL,
    ShipBase            NUMBER(19, 2)    NOT NULL,
    ShipMethodName      NVARCHAR2(50)    NOT NULL,
    SOR_ID              NUMBER(38, 0),
    ETLLoadID           NUMBER(38, 0),
    ETLLoadDate         TIMESTAMP(6)     NOT NULL,
    DI_Job_ID           NUMBER(38, 0)    NOT NULL,
    DI_Create_Date      DATE             NOT NULL,
    DI_Modified_Date    DATE             NOT NULL,
    CONSTRAINT PK1_1_1_1 PRIMARY KEY (ShipMethodID_SK)
)
;



-- 
-- TABLE: DimVendor 
--

CREATE TABLE DimVendor(
    VendorID_SK              NUMBER(38, 0)     NOT NULL,
    BusinessEntityID_NK      NUMBER(38, 0)     NOT NULL,
    Title                    NVARCHAR2(8),
    FirstName                NVARCHAR2(50)     NOT NULL,
    MiddleName               NVARCHAR2(50),
    LastName                 NVARCHAR2(50)     NOT NULL,
    AddressLine1             NVARCHAR2(254),
    ActiveFlag               RAW(1)            NOT NULL,
    PrefferedVendorStatus    RAW(1)            NOT NULL,
    AccountNumber            NVARCHAR2(15)     NOT NULL,
    VendorName               NVARCHAR2(50)     NOT NULL,
    CreditRating             NUMBER(3, 0)      NOT NULL,
    SOR_ID                   NUMBER(38, 0),
    ETLLoadID                NUMBER(38, 0),
    ETLLoadDate              TIMESTAMP(6)      NOT NULL,
    DI_Job_ID                NUMBER(38, 0)     NOT NULL,
    DI_Create_Date           DATE              NOT NULL,
    DI_Modified_Date         DATE              NOT NULL,
    CONSTRAINT PK1_3 PRIMARY KEY (VendorID_SK)
)
;



-- 
-- TABLE: DimVendorContacts 
--

CREATE TABLE DimVendorContacts(
    VendorContact_SK        NUMBER(38, 0)    NOT NULL,
    Title                   NVARCHAR2(30),
    FirstName               NVARCHAR2(50),
    MiddleName              NVARCHAR2(50),
    LastName                NVARCHAR2(50),
    BusinessEntittyID_NK    NUMBER(38, 0)    NOT NULL,
    ContactType             NVARCHAR2(50)    NOT NULL,
    PhoneNumber             NVARCHAR2(25),
    PhoneNumberType         NVARCHAR2(50),
    EmailAddress            NVARCHAR2(50),
    EmailPromotion          NUMBER(38, 0)    NOT NULL,
    VendorID_SK             NUMBER(38, 0),
    SOR_ID                  NUMBER(38, 0),
    ETLLoadID               NUMBER(38, 0),
    ETLLoadDate             TIMESTAMP(6)     NOT NULL,
    DI_Job_ID               NUMBER(38, 0)    NOT NULL,
    DI_Create_Date          DATE             NOT NULL,
    DI_Modified_Date        DATE             NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY (VendorContact_SK)
)
;



-- 
-- TABLE: FactProductInventory 
--

CREATE TABLE FactProductInventory(
    ProductInventory_SK      NUMBER(38, 0)    NOT NULL,
    ProductID_Durable_SK     NUMBER(38, 0),
    LocationID_Durable_SK    NUMBER(38, 0),
    Bin                      NUMBER(3, 0)     NOT NULL,
    Shelf                    NVARCHAR2(10)    NOT NULL,
    Quantity                 SMALLINT         NOT NULL,
    DI_Modified_Date         DATE             NOT NULL,
    DI_Create_Date           DATE             NOT NULL,
    DI_Job_ID                NUMBER(38, 0),
    SOR_ID                   NUMBER(38, 0),
    CONSTRAINT PK1_1_2_1 PRIMARY KEY (ProductInventory_SK)
)
;



-- 
-- TABLE: FactPurchases 
--

CREATE TABLE FactPurchases(
    ProductOrderID         NUMBER(38, 0)    NOT NULL,
    RevisionNumber         NUMBER(3, 0)     NOT NULL,
    Status                 NUMBER(3, 0)     NOT NULL,
    TaxAmount              NUMBER(19, 2)    NOT NULL,
    SubTotal               NUMBER(19, 2)    NOT NULL,
    TotalDue               NUMBER(19, 2)    NOT NULL,
    Freight                NUMBER(19, 2)    NOT NULL,
    StockedQty             NUMBER(8, 2)     NOT NULL,
    OrderQty               SMALLINT         NOT NULL,
    LineTotal              NUMBER(19, 2)    NOT NULL,
    RejectedQty            NUMBER(8, 2)     NOT NULL,
    RecievedQty            NUMBER(8, 2)     NOT NULL,
    ProductID_SK           NUMBER(38, 0),
    ProductVendor_SK       NUMBER(38, 0),
    ShipMethodID_SK        NUMBER(38, 0),
    GeographyID_SK         NUMBER(38, 0),
    VendorID_SK            NUMBER(38, 0),
    EmployeeID_SK          NUMBER(38, 0),
    OrderDate              NUMBER(19, 0),
    DueDate                NUMBER(19, 0),
    ShipDate               NUMBER(19, 0),
    SOR_ID                 NUMBER(38, 0),
    ETLLoadID              NUMBER(38, 0),
    ETLLoadDate            TIMESTAMP(6)     NOT NULL,
    DI_Job_ID              NUMBER(38, 0)    NOT NULL,
    DI_Create_Date         DATE             NOT NULL,
    DI_Modified_Date       DATE             NOT NULL,
    SalesTerritoryID_SK    NUMBER(38, 0),
    CONSTRAINT PK3_1 PRIMARY KEY (ProductOrderID)
)
;



-- 
-- TABLE: FactPurchases_Rejects 
--

CREATE TABLE FactPurchases_Rejects(
    ProdOrderRejectID    NUMBER(38, 0)    NOT NULL,
    RevisionNumber       NUMBER(3, 0)     NOT NULL,
    Status               NUMBER(3, 0)     NOT NULL,
    TaxAmount            NUMBER(19, 2)    NOT NULL,
    SubTotal             NUMBER(19, 2)    NOT NULL,
    TotalDue             NUMBER(19, 2)    NOT NULL,
    Freight              NUMBER(19, 2)    NOT NULL,
    StockedQty           NUMBER(8, 2)     NOT NULL,
    OrderQty             SMALLINT         NOT NULL,
    LineTotal            NUMBER(19, 2)    NOT NULL,
    RejectedQty          NUMBER(8, 2)     NOT NULL,
    RecievedQty          NUMBER(8, 2)     NOT NULL,
    ProductID_SK         NUMBER(38, 0),
    ProductVendor_SK     NUMBER(38, 0),
    ShipMethodID_SK      NUMBER(38, 0),
    GeographyID_SK       NUMBER(38, 0),
    VendorID_SK          NUMBER(38, 0),
    EmployeeID_SK        NUMBER(38, 0),
    OrderDate            TIMESTAMP(6),
    DueDate              TIMESTAMP(6),
    ShipDate             TIMESTAMP(6),
    ProductOrderID       NUMBER(38, 0),
    RejectCode_SK        NUMBER(38, 0),
    SOR_ID               NUMBER(38, 0),
    DI_Job_ID            NUMBER(38, 0)    NOT NULL,
    DI_Create_Date       DATE             NOT NULL,
    DI_Modified_Date     DATE             NOT NULL,
    ETLLoadID            NUMBER(38, 0),
    ETLLoadDate          TIMESTAMP(6),
    CONSTRAINT PK3_1_1 PRIMARY KEY (ProdOrderRejectID)
)
;



-- 
-- TABLE: FactWorkOrder 
--

CREATE TABLE FactWorkOrder(
    WorkOrderID         NUMBER(38, 0)    NOT NULL,
    ScrappedQty         SMALLINT         NOT NULL,
    OrderQty            NUMBER(38, 0)    NOT NULL,
    ScrapReasonID_SK    SMALLINT,
    ProductID_SK        NUMBER(38, 0),
    StartDate           NUMBER(19, 0),
    EndDate             NUMBER(19, 0),
    DueDate             NUMBER(19, 0),
    SOR_ID              NUMBER(38, 0),
    DI_Job_ID           NUMBER(38, 0)    NOT NULL,
    DI_Create_Date      DATE             NOT NULL,
    DI_Modified_Date    DATE             NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (WorkOrderID)
)
;



-- 
-- TABLE: FactWorkOrder_Rejects 
--

CREATE TABLE FactWorkOrder_Rejects(
    WorkOrderRejectID    NUMBER(38, 0)    NOT NULL,
    ScrappedQty          SMALLINT         NOT NULL,
    StartDate            TIMESTAMP(6)     NOT NULL,
    EndDate              TIMESTAMP(6)     NOT NULL,
    DueDate              NUMBER(38, 0)    NOT NULL,
    OrderQty             NUMBER(38, 0)    NOT NULL,
    ScrapReasonID_SK     SMALLINT,
    ProductID_SK         NUMBER(38, 0),
    WorkOrderID          NUMBER(38, 0),
    RejectCode_SK        NUMBER(38, 0),
    SOR_ID               NUMBER(38, 0),
    DI_Job_ID            NUMBER(38, 0)    NOT NULL,
    DI_Create_Date       DATE             NOT NULL,
    DI_Modified_Date     DATE             NOT NULL,
    CONSTRAINT PK15_1 PRIMARY KEY (WorkOrderRejectID)
)
;



-- 
-- TABLE: FactWorkOrderRouting 
--

CREATE TABLE FactWorkOrderRouting(
    WorkRoutingID_SK        NUMBER(38, 0)    NOT NULL,
    OperationSequence_NK    SMALLINT         NOT NULL,
    ActualResourceHrs       NUMBER(9, 4),
    PlannedCost             NUMBER(19, 2)    NOT NULL,
    ActualCost              NUMBER(19, 2),
    WorkOrderID             NUMBER(38, 0),
    ProductID_SK            NUMBER(38, 0),
    LocationID_SK           NUMBER(38, 0),
    ActualStartDate         NUMBER(19, 0),
    ActualEndDate           NUMBER(19, 0),
    ScheduledStartDate      NUMBER(19, 0),
    ScheduledEndDate        NUMBER(19, 0),
    SOR_ID                  NUMBER(38, 0),
    DI_Job_ID               NUMBER(38, 0)    NOT NULL,
    DI_Create_Date          DATE             NOT NULL,
    DI_Modified_Date        DATE             NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY (WorkRoutingID_SK)
)
;



-- 
-- TABLE: FactWorkOrderRouting_Rejects 
--

CREATE TABLE FactWorkOrderRouting_Rejects(
    WorkRoutRejectID_SK     NUMBER(38, 0)    NOT NULL,
    OperationSequence_NK    SMALLINT         NOT NULL,
    ScheduledStartDate      TIMESTAMP(6)     NOT NULL,
    ScheduledEndDate        NUMBER(38, 0)    NOT NULL,
    ActualStartDate         TIMESTAMP(6),
    ActualEndDate           TIMESTAMP(6)     NOT NULL,
    ActualResourceHrs       NUMBER(9, 4),
    PlannedCost             NUMBER(19, 2)    NOT NULL,
    ActualCost              NUMBER(19, 2),
    WorkOrderID             NUMBER(38, 0),
    ProductID_SK            NUMBER(38, 0),
    LocationID_SK           NUMBER(38, 0),
    WorkRoutingID_SK        NUMBER(38, 0),
    RejectCode_SK           NUMBER(38, 0),
    SOR_ID                  NUMBER(38, 0),
    DI_Job_ID               NUMBER(38, 0)    NOT NULL,
    DI_Create_Date          DATE             NOT NULL,
    DI_Modified_Date        DATE             NOT NULL,
    CONSTRAINT PK16_1 PRIMARY KEY (WorkRoutRejectID_SK)
)
;



-- 
-- TABLE: ScrapReason 
--

CREATE TABLE ScrapReason(
    ScrapReasonID_SK    SMALLINT         NOT NULL,
    ScrapReasonID_NK    SMALLINT         NOT NULL,
    ScrapReasonName     NVARCHAR2(50)    NOT NULL,
    SOR_ID              NUMBER(38, 0),
    DI_Job_ID           NUMBER(38, 0)    NOT NULL,
    DI_Create_Date      DATE             NOT NULL,
    DI_Modified_Date    DATE             NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (ScrapReasonID_SK)
)
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


