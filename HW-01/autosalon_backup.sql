PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Authors (
    AuthorID INTEGER PRIMARY KEY,
    FullName TEXT NOT NULL,
    Country TEXT
);
INSERT INTO Authors VALUES(1,'Джордж Орвелл','Велика Британія');
INSERT INTO Authors VALUES(2,'Федір Достоєвський','Росія');
INSERT INTO Authors VALUES(3,'Михайло Булгаков','Україна');
INSERT INTO Authors VALUES(4,'Ернест Хемінгуей','США');
INSERT INTO Authors VALUES(5,'Габріель Гарсія Маркес','Колумбія');
CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Year INTEGER,
    AuthorID INTEGER,
    FOREIGN KEY (AuthorID) REFERENCES Authors (AuthorID)
);
INSERT INTO Books VALUES(1,'1984',1949,1);
INSERT INTO Books VALUES(2,'Колгосп тварин',1945,1);
INSERT INTO Books VALUES(3,'Злочин і кара',1866,2);
INSERT INTO Books VALUES(4,'Біси',1872,2);
INSERT INTO Books VALUES(5,'Майстер і Маргарита',1967,3);
INSERT INTO Books VALUES(6,'Собаче серце',1925,3);
INSERT INTO Books VALUES(7,'По кому подзвін',1940,4);
INSERT INTO Books VALUES(8,'Старий і море',1952,4);
INSERT INTO Books VALUES(9,'Сто років самотності',1967,5);
INSERT INTO Books VALUES(10,'Кохання під час холери',1985,5);
CREATE TABLE Cars (
    CarID INTEGER PRIMARY KEY,
    Brand TEXT NOT NULL,
    Model TEXT NOT NULL,
    Year INTEGER CHECK(Year >= 1980),
    Price REAL CHECK(Price > 0)
);
INSERT INTO Cars VALUES(1,'Toyota','Camry',2022,35000.0);
INSERT INTO Cars VALUES(2,'Honda','Civic',2021,28000.0);
INSERT INTO Cars VALUES(3,'BMW','X5',2023,72000.0);
INSERT INTO Cars VALUES(4,'Mercedes-Benz','C-Class',2022,65000.0);
INSERT INTO Cars VALUES(5,'Audi','A4',2021,60000.0);
INSERT INTO Cars VALUES(6,'Ford','Focus',2019,22000.0);
INSERT INTO Cars VALUES(7,'Chevrolet','Malibu',2020,25000.0);
INSERT INTO Cars VALUES(8,'Nissan','Altima',2021,27000.0);
INSERT INTO Cars VALUES(9,'Hyundai','Tucson',2022,30000.0);
INSERT INTO Cars VALUES(10,'Kia','Sportage',2023,31000.0);
INSERT INTO Cars VALUES(11,'Volkswagen','Passat',2020,29000.0);
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    FullName TEXT NOT NULL,
    Phone TEXT UNIQUE,
    CarID INTEGER,
    FOREIGN KEY (CarID) REFERENCES Cars (CarID)
);
INSERT INTO Customers VALUES(1,'Іван Петров','0681112233',1);
INSERT INTO Customers VALUES(2,'Марина Коваленко','0952223344',2);
INSERT INTO Customers VALUES(3,'Олександр Шевченко','0633334455',3);
INSERT INTO Customers VALUES(4,'Катерина Мельник','0974445566',4);
INSERT INTO Customers VALUES(5,'Дмитро Гронь','0686909014',5);
INSERT INTO Customers VALUES(7,'Анастасія Іванова','0736667788',7);
INSERT INTO Customers VALUES(8,'Максим Бондар','0967778899',8);
INSERT INTO Customers VALUES(9,'Владислава Кравець','0998889900',9);
INSERT INTO Customers VALUES(10,'Андрій Ткаченко','0679990011',10);
INSERT INTO Customers VALUES(11,'Юлія Поліщук','0660001122',11);
COMMIT;
