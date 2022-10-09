-- Create Sales database --
USE master;  
GO  
CREATE DATABASE Sales  
ON   
( NAME = Sales_dat,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\saledata.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\salelog.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB );  
GO 

=========================================================================================================
-- Create Customers table -- 
create table Customers( 
					CustomerID int primary key,
					CustomerName varchar(255) not null,
					ContactName varchar(255) not null,
					Address varchar(255),
					City varchar(50),
					PostalCode varchar(50),
					Country varchar(50)
					);

--
-- Dumping data for table `customers`
--

INSERT INTO Customers (CustomerID, CustomerName,ContactName, Address, City, PostalCode, Country) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden'),
(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
(7, 'Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France'),
(8, 'Bólido Comidas preparadas', 'Martín Sommer', 'C/ Araquil, 67', 'Madrid', '28023', 'Spain')

==============================================================================================================

-- Create Categories table --
create table Categories(
						CategoryID int primary key,
						CategoryName varchar(255),
						Description varchar(255)
						);
--
-- Dumping data for table `categories`
--

INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
(6, 'Meat/Poultry', 'Prepared meats'),
(7, 'Produce', 'Dried fruit and bean curd'),
(8, 'Seafood', 'Seaweed and fish');

=========================================================================================

-- create Employees table --
create table Employees(
						EmployeeID int primary key,
						LastName varchar(50),
						FirstName varchar(50),
						BirthDate date,
						Photo varchar(100) default NULL,
						Notes text
						);

--
-- Dumping data for table `employees`
--

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, Photo, Notes) VALUES
(1, 'Davolio', 'Nancy', '1968-12-08', 'EmpID1.pic', 'Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call).'),
(2, 'Fuller', 'Andrew', '1952-02-19', 'EmpID2.pic', 'Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.'),
(3, 'Leverling', 'Janet', '1963-08-30', 'EmpID3.pic', 'Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.'),
(4, 'Peacock', 'Margaret', '1958-09-19', 'EmpID4.pic', 'Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.'),
(5, 'Buchanan', 'Steven', '1955-03-04', 'EmpID5.pic', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. He is fluent in French.'),
(6, 'Suyama', 'Michael', '1963-07-02', 'EmpID6.pic', 'Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He is fluent in Japanese and can read and write French, Portuguese, and Spanish.'),
(7, 'King', 'Robert', '1960-05-29', 'EmpID7.pic', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. he was transferred to the London office.'),
(8, 'Callahan', 'Laura', '1958-01-09', 'EmpID8.pic', 'Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.'),
(9, 'Dodsworth', 'Anne', '1969-07-02', 'EmpID9.pic', 'Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.'),
(10, 'West', 'Adam', '1928-09-19', 'EmpID10.pic', 'An old chum.');

=====================================================================================================================
-- create Orders table --
create table Orders(
					OrderID int primary key,
					CustomerID int,
					EmployeeID int,
					OrderDate date,
					ShipperID int,		
					);

--
-- Dumping data for table `orders`
--

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID) VALUES
(10248, 90, 5, '1996-07-04', 3),
(10249, 81, 6, '1996-07-05', 1),
(10250, 34, 4, '1996-07-08', 2),
(10251, 84, 3, '1996-07-08', 1),
(10252, 76, 4, '1996-07-09', 2),
(10253, 34, 3, '1996-07-10', 2),
(10254, 14, 5, '1996-07-11', 2),
(10255, 68, 9, '1996-07-12', 3),
(10256, 88, 3, '1996-07-15', 2),
(10257, 35, 4, '1996-07-16', 3),
(10258, 20, 1, '1996-07-17', 1),
(10259, 13, 4, '1996-07-18', 3),
(10260, 55, 4, '1996-07-19', 1),
(10261, 61, 4, '1996-07-19', 2),
(10262, 65, 8, '1996-07-22', 3),
(10263, 20, 9, '1996-07-23', 3),
(10264, 24, 6, '1996-07-24', 3),
(10265, 7, 2, '1996-07-25', 1),
(10266, 87, 3, '1996-07-26', 3),
(10267, 25, 4, '1996-07-29', 1),
(10268, 33, 8, '1996-07-30', 3),
(10269, 89, 5, '1996-07-31', 1),
(10270, 87, 1, '1996-08-01', 1),
(10271, 75, 6, '1996-08-01', 2),
(10272, 65, 6, '1996-08-02', 2),
(10273, 63, 3, '1996-08-05', 3),
(10274, 85, 6, '1996-08-06', 1),
(10275, 49, 1, '1996-08-07', 1),
(10276, 80, 8, '1996-08-08', 3),
(10277, 52, 2, '1996-08-09', 3),
(10278, 5, 8, '1996-08-12', 2),
(10279, 44, 8, '1996-08-13', 2),
(10280, 5, 2, '1996-08-14', 1),
(10281, 69, 4, '1996-08-14', 1),
(10282, 69, 4, '1996-08-15', 1),
(10283, 46, 3, '1996-08-16', 3),
(10284, 44, 4, '1996-08-19', 1),
(10285, 63, 1, '1996-08-20', 2),
(10286, 63, 8, '1996-08-21', 3),
(10287, 67, 8, '1996-08-22', 3),
(10288, 66, 4, '1996-08-23', 1),
(10289, 11, 7, '1996-08-26', 3),
(10290, 15, 8, '1996-08-27', 1),
(10291, 61, 6, '1996-08-27', 2),
(10292, 81, 1, '1996-08-28', 2),
(10293, 80, 1, '1996-08-29', 3),
(10294, 65, 4, '1996-08-30', 2),
(10295, 85, 2, '1996-09-02', 2),
(10296, 46, 6, '1996-09-03', 1),
(10297, 7, 5, '1996-09-04', 2),
(10298, 37, 6, '1996-09-05', 2),
(10299, 67, 4, '1996-09-06', 2),
(10300, 49, 2, '1996-09-09', 2),
(10301, 86, 8, '1996-09-09', 2),
(10302, 76, 4, '1996-09-10', 2),
(10303, 30, 7, '1996-09-11', 2),
(10304, 80, 1, '1996-09-12', 2),
(10305, 55, 8, '1996-09-13', 3),
(10306, 69, 1, '1996-09-16', 3),
(10307, 48, 2, '1996-09-17', 2),
(10308, 2, 7, '1996-09-18', 3),
(10309, 37, 3, '1996-09-19', 1),
(10310, 77, 8, '1996-09-20', 2),
(10311, 18, 1, '1996-09-20', 3),
(10312, 86, 2, '1996-09-23', 2),
(10313, 63, 2, '1996-09-24', 2),
(10314, 65, 1, '1996-09-25', 2),
(10315, 38, 4, '1996-09-26', 2),
(10316, 65, 1, '1996-09-27', 3),
(10317, 48, 6, '1996-09-30', 1),
(10318, 38, 8, '1996-10-01', 2),
(10319, 80, 7, '1996-10-02', 3),
(10320, 87, 5, '1996-10-03', 3),
(10321, 38, 3, '1996-10-03', 2),
(10322, 58, 7, '1996-10-04', 3),
(10323, 39, 4, '1996-10-07', 1),
(10324, 71, 9, '1996-10-08', 1),
(10325, 39, 1, '1996-10-09', 3),
(10326, 8, 4, '1996-10-10', 2),
(10327, 24, 2, '1996-10-11', 1),
(10328, 28, 4, '1996-10-14', 3),
(10329, 75, 4, '1996-10-15', 2),
(10330, 46, 3, '1996-10-16', 1),
(10331, 9, 9, '1996-10-16', 1),
(10332, 51, 3, '1996-10-17', 2),
(10333, 87, 5, '1996-10-18', 3),
(10334, 84, 8, '1996-10-21', 2),
(10335, 37, 7, '1996-10-22', 2),
(10336, 60, 7, '1996-10-23', 2),
(10337, 25, 4, '1996-10-24', 3),
(10338, 55, 4, '1996-10-25', 3),
(10339, 51, 2, '1996-10-28', 2),
(10340, 9, 1, '1996-10-29', 3),
(10341, 73, 7, '1996-10-29', 3),
(10342, 25, 4, '1996-10-30', 2),
(10343, 44, 4, '1996-10-31', 1),
(10344, 89, 4, '1996-11-01', 2),
(10345, 63, 2, '1996-11-04', 2),
(10346, 65, 3, '1996-11-05', 3),
(10347, 21, 4, '1996-11-06', 3),
(10348, 86, 4, '1996-11-07', 2),
(10349, 75, 7, '1996-11-08', 1),
(10350, 41, 6, '1996-11-11', 2),
(10351, 20, 1, '1996-11-11', 1),
(10352, 28, 3, '1996-11-12', 3),
(10353, 59, 7, '1996-11-13', 3),
(10354, 58, 8, '1996-11-14', 3),
(10355, 4, 6, '1996-11-15', 1),
(10356, 86, 6, '1996-11-18', 2),
(10357, 46, 1, '1996-11-19', 3),
(10358, 41, 5, '1996-11-20', 1),
(10359, 72, 5, '1996-11-21', 3),
(10360, 7, 4, '1996-11-22', 3),
(10361, 63, 1, '1996-11-22', 2),
(10362, 9, 3, '1996-11-25', 1),
(10363, 17, 4, '1996-11-26', 3),
(10364, 19, 1, '1996-11-26', 1),
(10365, 3, 3, '1996-11-27', 2),
(10366, 29, 8, '1996-11-28', 2),
(10367, 83, 7, '1996-11-28', 3),
(10368, 20, 2, '1996-11-29', 2),
(10369, 75, 8, '1996-12-02', 2),
(10370, 14, 6, '1996-12-03', 2),
(10371, 41, 1, '1996-12-03', 1),
(10372, 62, 5, '1996-12-04', 2),
(10373, 37, 4, '1996-12-05', 3),
(10374, 91, 1, '1996-12-05', 3),
(10375, 36, 3, '1996-12-06', 2),
(10376, 51, 1, '1996-12-09', 2),
(10377, 72, 1, '1996-12-09', 3),
(10378, 24, 5, '1996-12-10', 3),
(10379, 61, 2, '1996-12-11', 1),
(10380, 37, 8, '1996-12-12', 3),
(10381, 46, 3, '1996-12-12', 3),
(10382, 20, 4, '1996-12-13', 1),
(10383, 4, 8, '1996-12-16', 3),
(10384, 5, 3, '1996-12-16', 3),
(10385, 75, 1, '1996-12-17', 2),
(10386, 21, 9, '1996-12-18', 3),
(10387, 70, 1, '1996-12-18', 2),
(10388, 72, 2, '1996-12-19', 1),
(10389, 10, 4, '1996-12-20', 2),
(10390, 20, 6, '1996-12-23', 1),
(10391, 17, 3, '1996-12-23', 3),
(10392, 59, 2, '1996-12-24', 3),
(10393, 71, 1, '1996-12-25', 3),
(10394, 36, 1, '1996-12-25', 3),
(10395, 35, 6, '1996-12-26', 1),
(10396, 25, 1, '1996-12-27', 3),
(10397, 60, 5, '1996-12-27', 1),
(10398, 71, 2, '1996-12-30', 3),
(10399, 83, 8, '1996-12-31', 3),
(10400, 19, 1, '1997-01-01', 3),
(10401, 65, 1, '1997-01-01', 1),
(10402, 20, 8, '1997-01-02', 2),
(10403, 20, 4, '1997-01-03', 3),
(10404, 49, 2, '1997-01-03', 1),
(10405, 47, 1, '1997-01-06', 1),
(10406, 62, 7, '1997-01-07', 1),
(10407, 56, 2, '1997-01-07', 2),
(10408, 23, 8, '1997-01-08', 1),
(10409, 54, 3, '1997-01-09', 1),
(10410, 10, 3, '1997-01-10', 3),
(10411, 10, 9, '1997-01-10', 3),
(10412, 87, 8, '1997-01-13', 2),
(10413, 41, 3, '1997-01-14', 2),
(10414, 21, 2, '1997-01-14', 3),
(10415, 36, 3, '1997-01-15', 1),
(10416, 87, 8, '1997-01-16', 3),
(10417, 73, 4, '1997-01-16', 3),
(10418, 63, 4, '1997-01-17', 1),
(10419, 68, 4, '1997-01-20', 2),
(10420, 88, 3, '1997-01-21', 1),
(10421, 61, 8, '1997-01-21', 1),
(10422, 27, 2, '1997-01-22', 1),
(10423, 31, 6, '1997-01-23', 3),
(10424, 51, 7, '1997-01-23', 2),
(10425, 41, 6, '1997-01-24', 2),
(10426, 29, 4, '1997-01-27', 1),
(10427, 59, 4, '1997-01-27', 2),
(10428, 66, 7, '1997-01-28', 1),
(10429, 37, 3, '1997-01-29', 2),
(10430, 20, 4, '1997-01-30', 1),
(10431, 10, 4, '1997-01-30', 2),
(10432, 75, 3, '1997-01-31', 2),
(10433, 60, 3, '1997-02-03', 3),
(10434, 24, 3, '1997-02-03', 2),
(10435, 16, 8, '1997-02-04', 2),
(10436, 7, 3, '1997-02-05', 2),
(10437, 87, 8, '1997-02-05', 1),
(10438, 79, 3, '1997-02-06', 2),
(10439, 51, 6, '1997-02-07', 3),
(10440, 71, 4, '1997-02-10', 2),
(10441, 55, 3, '1997-02-10', 2),
(10442, 20, 3, '1997-02-11', 2),
(10443, 66, 8, '1997-02-12', 1);

=======================================================================================================================

-- create Products table --
create table Products(
						ProductID int primary key,
						ProductName varchar(255),
						SupplierID int,
						CategoryID int ,
						Unit varchar(255),
						Price float 
						);

--
-- Dumping data for table `products`
--

INSERT INTO Products (ProductID, ProductName, SupplierID,CategoryID, Unit, Price) VALUES
(1, 'Chais', 1, 1, '10 boxes x 20 bags', 18),
(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10),
(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40),
(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97),
(10, 'Ikura', 4, 8, '12 - 200 ml jars', 31),
(11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21),
(12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38),
(13, 'Konbu', 6, 8, '2 kg box', 6),
(14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25)

============================================================================================================
-- create OrderDetails table --
create table OrderDetails(
							OrderDetailID int primary key,
							OrderID int ,
							ProductID int,
							Quantity int,
							);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 10248, 11, 12),
(2, 10248, 42, 10),
(3, 10248, 72, 5),
(4, 10249, 14, 9),
(5, 10249, 51, 40),
(6, 10250, 41, 10),
(7, 10250, 51, 35),
(8, 10250, 65, 15),
(9, 10251, 22, 6),
(10, 10251, 57, 15),
(11, 10251, 65, 20),
(12, 10252, 20, 40),
(13, 10252, 33, 25),
(14, 10252, 60, 40),
(15, 10253, 31, 20),
(16, 10253, 39, 42),
(17, 10253, 49, 40),
(18, 10254, 24, 15),
(19, 10254, 55, 21),
(20, 10254, 74, 21),
(21, 10255, 2, 20),
(22, 10255, 16, 35),
(23, 10255, 36, 25),
(24, 10255, 59, 30),
(25, 10256, 53, 15),
(26, 10256, 77, 12),
(27, 10257, 27, 25),
(28, 10257, 39, 6),
(29, 10257, 77, 15),
(30, 10258, 2, 50)
===============================================================================================================
-- Create table Shippers ---

create table Shippers(
						ShipperID int primary key ,
						ShipperName varchar(50),
						Phone varchar(20)
						);

INSERT INTO Shippers (ShipperID, ShipperName, Phone) VALUES
(1, 'Speedy Express', '(503) 555-9831'),
(2, 'United Package', '(503) 555-3199'),
(3, 'Federal Shipping', '(503) 555-9931');

=======================================================================================================================
-- Create table Suppliers ---
create table Suppliers(
						SupplierID int primary key ,
						SupplierName varchar(100),
						ContactName varchar(100),
						Address varchar(100),
						City varchar(100),
						PostalCode varchar(100),
						Country varchar(50),
						Phone varchar(100)
						);

INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country, Phone) VALUES
(1, 'Exotic Liquid', 'Charlotte Cooper', '49 Gilbert St.', 'Londona', 'EC1 4SD', 'UK', '(171) 555-2222'),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'P.O. Box 78934', 'New Orleans', '70117', 'USA', '(100) 555-4822'),
(3, 'Grandma Kelly\"s Homestead', 'Regina Murphy', '707 Oxford Rd.', 'Ann Arbor', '48104', 'USA', '(313) 555-5735'),
(4, 'Tokyo Traders', 'Yoshi Nagase', '9-8 Sekimai Musashino-shi', 'Tokyo', '100', 'Japan', '(03) 3555-5011'),
(9, 'PB Knäckebröd AB', 'Lars Peterson', 'Kaloadagatan 13', 'Göteborg', 'S-345 67', 'Sweden', '031-987 65 43'),
(10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Av. das Americanas 12.890', 'São Paulo', '5442', 'Brazil', '(11) 555 4640'),
(11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Tiergartenstraße 5', 'Berlin', '10785', 'Germany', '(010) 9984510'),
(12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'Bogenallee 51', 'Frankfurt', '60439', 'Germany', '(069) 992755'),
(13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Frahmredder 112a', 'Cuxhaven', '27478', 'Germany', '(04721) 8713'),
(14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Viale Dante, 75', 'Ravenna', '48100', 'Italy', '(0544) 60323'),
(15, 'Norske Meierier', 'Beate Vileid', 'Hatlevegen 5', 'Sandvika', '1320', 'Norway', '(0)2-953010'),
(16, 'Bigfoot Breweries', 'Cheryl Saylor', '3400 - 8th Avenue Suite 210', 'Bend', '97101', 'USA', '(503) 555-9931'),
(17, 'Svensk Sjöföda AB', 'Michael Björn', 'Brovallavägen 231', 'Stockholm', 'S-123 45', 'Sweden', '08-123 45 67'),
(18, 'Aux joyeux ecclésiastiques', 'Guylène Nodier', '203, Rue des Francs-Bourgeois', 'Paris', '75004', 'France', '(1) 03.83.00.68'),
(19, 'New England Seafood Cannery', 'Robb Merchant', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', '02134', 'USA', '(617) 555-3267'),
(20, 'Leka Trading', 'Chandra Leka', '471 Serangoon Loop, Suite #402', 'Singapore', '0512', 'Singapore', '555-8787'),
(21, 'Lyngbysild', 'Niels Petersen', 'Lyngbysild Fiskebakken 10', 'Lyngby', '2800', 'Denmark', '43844108'),
(22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Verkoop Rijnweg 22', 'Zaandam', '9999 ZZ', 'Netherlands', '(12345) 1212'),
(23, 'Karkki Oy', 'Anne Heikkonen', 'Valtakatu 12', 'Lappeenranta', '53120', 'Finland', '(953) 10956')

====================================================================================================================
--
-- Constraints for table `orders`
--
ALTER TABLE Orders
	ADD CONSTRAINT orders_customers_1 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
ALTER TABLE Orders
	ADD CONSTRAINT orders_Employees_2 FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
ALTER TABLE Orders
	ADD CONSTRAINT orders_Shippers_3 FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)


--
-- Constraints for table `order_details`
--
ALTER TABLE OrderDetails
  ADD CONSTRAINT order_details_ibfk_1 FOREIGN KEY (OrderID) REFERENCES orders (OrderID)
ALTER TABLE OrderDetails
  ADD CONSTRAINT order_details_ibfk_2 FOREIGN KEY (ProductID) REFERENCES products (ProductID);

--
-- Constraints for table `products`
--
ALTER TABLE Products
  ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (CategoryID) REFERENCES categories (CategoryID)
ALTER TABLE Products
  ADD CONSTRAINT products_ibfk_2 FOREIGN KEY (SupplierID) REFERENCES suppliers (SupplierID)
	
