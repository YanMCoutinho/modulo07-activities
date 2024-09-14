/**
Teacher, I made this code to work in Transact SQL (SQL Server). I tested in https://onecompiler.com/sqlserver/42s6b5hqk
Furthermore, I created some extra tables to fulfill the ENUM types that were in the columns in google sheets's notes
**/

CREATE TABLE ItemsType (
    Id INT PRIMARY KEY IDENTITY(1,1),
    TypeName VARCHAR(100) NOT NULL
);

CREATE TABLE Prchselltem (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PrchselltemName VARCHAR(100) NOT NULL
);

CREATE TABLE SellItem (
    Id INT PRIMARY KEY IDENTITY(1,1),
    SellItemName VARCHAR(100) NOT NULL
);

CREATE TABLE FirmCode (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirmName VARCHAR(100) NOT NULL
);

CREATE TABLE PN (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CardCode VARCHAR(15) NOT NULL,
    CardName VARCHAR(100),
    CardType VARCHAR(20),
    GroupCode INT,
    Phone1 VARCHAR(20),
    Phone2 VARCHAR(20),
    Cellular VARCHAR(50),
    SlipCode INT,
    E_mail VARCHAR(100),
    ShipType INT,
    IntrntSite VARCHAR(100),
    CmpPrivate VARCHAR(20)
);

CREATE TABLE Address (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CardCode VARCHAR(15) NOT NULL,
    AddrType VARCHAR(20),
    Address VARCHAR(50),
    AddType VARCHAR(100),
    Street VARCHAR(100),
    StreetNo VARCHAR(100),
    Block VARCHAR(100),
    City VARCHAR(100),
    County VARCHAR(100),
    State VARCHAR(3),
    ZipCode VARCHAR(20),
    Country VARCHAR(3),
    Building VARCHAR(8000),
    U_SKILL_IndIE INT,
    PNId INT FOREIGN KEY REFERENCES PN(Id)
);

CREATE TABLE AddressCharge (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CardCode VARCHAR(15) NOT NULL,
    LineNum INT,
    Address VARCHAR(50) NOT NULL,
    TaxId0 VARCHAR(100),
    TaxId1 VARCHAR(100),
    TaxId2 VARCHAR(100),
    TaxId3 VARCHAR(100),
    TaxId4 VARCHAR(100),
    AddressId INT FOREIGN KEY REFERENCES Address(Id)
);

CREATE TABLE BankAccount (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CardCode VARCHAR(15) NOT NULL,
    County VARCHAR(100),
    BankCode VARCHAR(30),
    Branch VARCHAR(50),
    UsrNumber VARCHAR(25),
    Account VARCHAR(25),
    UsrNumber2 VARCHAR(25),
    AcctName VARCHAR(100),
    PNId INT FOREIGN KEY REFERENCES PN(Id)
);

CREATE TABLE Items (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ItemCode VARCHAR(20) NOT NULL,
    ItemName VARCHAR(100),
    FrgnName VARCHAR(100),
    ItmsGrpCod INT,
    ItemTypeId INT FOREIGN KEY REFERENCES ItemsType(Id),
    PrchselltemId INT FOREIGN KEY REFERENCES Prchselltem(Id),
    SellItemId INT FOREIGN KEY REFERENCES SellItem(Id),
    InvnItem VARCHAR(20),
    FirmCodeId INT FOREIGN KEY REFERENCES FirmCode(Id),
    ManSerNum VARCHAR(20),
    ManBtchNum VARCHAR(20),
    Phantom VARCHAR(20),
    ItemClass VARCHAR(20),
    MatType VARCHAR(20),
    NCMCode INT,
    ProductSrc VARCHAR(20),
    BuyUnitMsr VARCHAR(20),
    PurchaseItemsPerUnit FLOAT,
    SalUnitMsr VARCHAR(20),
    NumInSale FLOAT,
    InvntryUom VARCHAR(20),
    MinLevel FLOAT,
    MaxLevel FLOAT,
    PlanningSys VARCHAR(20),
    PrcrmntMtd VARCHAR(20),
    OrdrMulti FLOAT,
    MinOrdrQty FLOAT,
    LeadTime INT,
    UserText VARCHAR(8000),
    U_SKILL_CEST FLOAT,
    U_SKILL_LisSer FLOAT,
    U_SKILL_SerMun FLOAT,
    PNId INT FOREIGN KEY REFERENCES PN(Id)
);
