CREATE DATABASE LocalLibraries;
USE LocalLibraries
GO

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	AddressL VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Copies (
	Book INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE Publisher (
	PublisherNameID INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	AddressP VARCHAR(50) NOT NULL,
	PhoneP VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (10000, 1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
);

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (100000, 1),
	NameB VARCHAR(50) NOT NULL,
	AddressB VARCHAR(50) NOT NULL,
	PhoneB VARCHAR (50) NOT NULL
);

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO Library_Branch
	(BranchName, AddressL)
	VALUES
	('Sharpstown', '1234 Lively Blvd'),
	('Central', '101 Main St'),
	('Commonwealth', '5678 Washington St'),
	('Plainstown', '8087 George St')
;

INSERT INTO Book_Copies
	(Book, BranchID, Number_Of_Copies)
	VALUES
	(10000, 1, 2),
	(10002, 1, 2),
	(10003, 1, 2),
	(10004, 1, 2),
	(10005, 1, 2),
	(10006, 1, 2),
	(10007, 1, 2),
	(10008, 1, 2),
	(10009, 1, 3),
	(10010, 1, 2),
	(10012, 1, 2),
	(10003, 2, 2),
	(10004, 2, 2),
	(10005, 2, 2),
	(10006, 2, 3),
	(10007, 2, 2),
	(10008, 2, 2),
	(10009, 2, 2),
	(10010, 2, 3),
	(10011, 2, 2),
	(10012, 2, 2),
	(10013, 2, 2),
	(10014, 2, 2),
	(10015, 2, 2),
	(10024, 2, 2),
	(10023, 2, 2),
	(10001, 3, 2),
	(10002, 3, 2),
	(10004, 3, 2),
	(10005, 3, 2),
	(10008, 3, 2),
	(10009, 3, 2),
	(10010, 3, 2),
	(10013, 3, 2),
	(10014, 3, 3),
	(10016, 3, 2),
	(10019, 3, 2),
	(10013, 4, 2),
	(10014, 4, 2),
	(10015, 4, 2),
	(10016, 4, 3),
	(10017, 4, 2),
	(10018, 4, 2),
	(10019, 4, 2),
	(10020, 4, 3),
	(10021, 4, 2),
	(10022, 4, 2),
	(10023, 4, 2),
	(10024, 4, 2),
	(10000, 4, 2)
;

INSERT INTO Publisher
	(AddressP, PhoneP)
	VALUES
	('8548 Donatello Dr', 'ABC Publishers'),
	('3021 Pearl St', 'Newbery'),
	('10655 Leonardo Cir', 'Harper'),
	('6054 Paradisio Dr', 'Katherine'),
	('8078 Cicero Ct', 'Ember'),
	('1234 Sherman St', 'Ace Books'),
	('2345 Cherry St', 'Source Books'),
	('3456 Spruce St', 'Broadway Books'),
	('5678 Pine St', 'MTV Books'),
	('1456 Logan St', 'Orchard Books'),
	('6543 Martin Ln', 'St. Martin''s Paperbacks'),
	('4321 Nassau St', 'Speak')
;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(10000, 1, 100000, '2019-08-06', '2019-08-13'),
	(10002, 1, 100000, '2019-08-06', '2019-08-13'),
	(10007, 1, 100000, '2019-08-06', '2019-08-13'),
	(10000, 1, 100001, '2019-08-07', '2019-08-14'),
	(10003, 2, 100002, '2019-08-07', '2019-08-14'),
	(10008, 2, 100002, '2019-08-07', '2019-08-14'),
	(10005, 3, 100003, '2019-08-07', '2019-08-14'),
	(10010, 3, 100003, '2019-08-07', '2019-08-14'),
	(10013, 4, 100004, '2019-08-07', '2019-08-14'),
	(10014, 4, 100004, '2019-08-07', '2019-08-14'),
	(10015, 4, 100004, '2019-08-07', '2019-08-14'),
	(10012, 1, 100000, '2019-08-08', '2019-08-15'),
	(10011, 1, 100000, '2019-08-08', '2019-08-15'),
	(10021, 4, 100004, '2019-08-08', '2019-08-15'),
	(10022, 4, 100004, '2019-08-08', '2019-08-15'),
	(10023, 4, 100004, '2019-08-08', '2019-08-15'),
	(10010, 2, 100005, '2019-08-09', '2019-08-16'),
	(10011, 2, 100005, '2019-08-09', '2019-08-16'),
	(10012, 2, 100005, '2019-08-09', '2019-08-16'),
	(10013, 2, 100005, '2019-08-09', '2019-08-16'),
	(10002, 3, 100006, '2019-08-09', '2019-08-16'),
	(10012, 1, 100007, '2019-08-10', '2019-08-17'),
	(10010, 1, 100007, '2019-08-10', '2019-08-17'),
	(10009, 1, 100007, '2019-08-10', '2019-08-17'),
	(10008, 1, 100007, '2019-08-10', '2019-08-17'),
	(10007, 1, 100007, '2019-08-10', '2019-08-17'),
	(10015, 2, 100002, '2019-08-10', '2019-08-17'),
	(10014, 2, 100002, '2019-08-10', '2019-08-17'),
	(10013, 2, 100002, '2019-08-10', '2019-08-17'),
	(10012, 2, 100002, '2019-08-10', '2019-08-17'),
	(10011, 2, 100002, '2019-08-10', '2019-08-17'),
	(10019, 3, 100001, '2019-08-11', '2019-08-18'),
	(10016, 3, 100001, '2019-08-11', '2019-08-18'),
	(10014, 3, 100001, '2019-08-11', '2019-08-18'),
	(10010, 3, 100003, '2019-08-11', '2019-08-18'),
	(10001, 3, 100003, '2019-08-11', '2019-08-18'),
	(10024, 4, 100007, '2019-08-11', '2019-08-18'),
	(10023, 4, 100007, '2019-08-11', '2019-08-18'),
	(10022, 4, 100007, '2019-08-11', '2019-08-18'),
	(10013, 3, 100006, '2019-08-12', '2019-08-19'),
	(10014, 3, 100006, '2019-08-12', '2019-08-19'),
	(10016, 3, 100006, '2019-08-12', '2019-08-19'),
	(10002, 1, 100001, '2019-08-12', '2019-08-19'),
	(10003, 1, 100001, '2019-08-12', '2019-08-19'),
	(10004, 1, 100001, '2019-08-12', '2019-08-19'),
	(10003, 2, 100002, '2019-08-13', '2019-08-20'),
	(10004, 2, 100002, '2019-08-13', '2019-08-20'),
	(10005, 2, 100002, '2019-08-13', '2019-08-20'),
	(10006, 2, 100003, '2019-08-13', '2019-08-20'),
	(10007, 2, 100003, '2019-08-13', '2019-08-20'),
	(10008, 2, 100003, '2019-08-13', '2019-08-20')
;

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'ABC Publishers'),
	('The Giver', 'Newbery'),
	('Panic', 'Harper'),
	('Fear', 'Harper'),
	('Pulse', 'Katherine'),
	('Everything, Everything', 'Ember'),
	('Let it Snow', 'Ember'),
	('H2O', 'Source Books'),
	('Dune', 'Ace Books'),
	('The Left Hand of Darkness', 'Ace Books'),
	('The Martian', 'Broadway Books'),
	('The Perks of Being a Wallflower', 'MTV Books'),
	('Beyond the Valley of Thorns', 'Orchard Books'),
	('The Tenth City', 'Orchard Books'),
	('Stargazer', 'Orchard Books'),
	('The Dark Hills Divide', 'Orchard Books'),
	('The Hades Factor', 'St. Martin''s Paperbacks'),
	('State of Fear', 'Harper'),
	('Congo', 'Harper'),
	('The Andromeda Strain', 'Harper'),
	('Ark Angel', 'Speak'),
	('Scorpia', 'Speak'),
	('Point Blank', 'Speak'),
	('It', 'Source Books'),
	('The Shining', 'Source Books')
;

INSERT INTO Borrower
	(NameB, AddressB, PhoneB)
	VALUES
	('Josh', '4321 Lively Blvd', '303-303-3333'),
	('Lawrence', '203 2nd St', '720-303-3773'),
	('Taylor', '8414 Sherman Peak St', '970-720-9871'),
	('Maddie', '8428 Sherman Peak St', '970-720-9874'),
	('Tucker', '1077 Country Club Estates Dr', '303-789-9192'),
	('CJ', '908 Equinox Dr', '504-902-0863'),
	('Bob', '5414 Washington St', '720-343-9075'),
	('Sue', '7842 Preservation Trail Rd', '303-902-0863'),
	('Mark', '7234 Arapahoe Rd', '303-123-4556')
;

INSERT INTO Book_Authors
	(BookID, AuthorName)
	VALUES
	(10000, 'Matthew Caldwell'),
	(10001, 'Lois Lowry'),
	(10002, 'Lauren Oliver'),
	(10003, 'Micheal Grant'),
	(10004, 'Patrick Carman'),
	(10005, 'Nicola Yoon'),
	(10006, 'John Green'),
	(10007, 'Virginia Bergin'),
	(10008, 'Frank Herbert'),
	(10009, 'Ursula K. Le Guin'),
	(10010, 'Andy Weir'),
	(10011, 'Stephen Chbosky'),
	(10012, 'Patrick Carman'),
	(10013, 'Patrick Carman'),
	(10014, 'Patrick Carman'),
	(10015, 'Patrick Carman'),
	(10016, 'Robert Ludlum'),
	(10017, 'Michael Crichton'),
	(10018, 'Michael Crichton'),
	(10019, 'Michael Crichton'),
	(10020, 'Anthony Horowitz'),
	(10021, 'Anthony Horowitz'),
	(10022, 'Anthony Horowitz'),
	(10023, 'Stephen King'),
	(10024, 'Stephen King')
;
