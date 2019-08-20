USE LocalLibraries
GO

CREATE PROCEDURE One
AS
BEGIN
SELECT a1.BranchName, a2.Title, a3.Number_Of_Copies
	FROM Book_Copies a3
	INNER JOIN Books a2 ON a2.BookID = a3.Book
	INNER JOIN Library_Branch a1 ON a1.BranchID = a3.BranchID
	WHERE a1.BranchName = 'Sharpstown' AND a2.Title = 'The Lost Tribe'
END

GO
CREATE PROCEDURE Two
AS
BEGIN
SELECT a1.BranchName, a2.Title, a3.Number_Of_Copies
	FROM Book_Copies a3
	INNER JOIN Books a2 ON a2.BookID = a3.Book
	INNER JOIN Library_Branch a1 ON a1.BranchID = a3.BranchID
	WHERE a2.Title = 'The Lost Tribe'
END

GO
CREATE PROCEDURE Three
AS
BEGIN
SELECT a1.NameB
	FROM Borrower a1
	LEFT JOIN Book_Loans a2 ON a2.CardNo = a1.CardNo
	WHERE a1.CardNo IS NOT NULL AND a2.CardNo IS NULL
END

GO
CREATE PROCEDURE Four
(
@TodaysDate VARCHAR(20)
)
AS
BEGIN
SELECT a1.DateDue, a2.Title, a3.NameB, a3.AddressB, a4.BranchName
	FROM Book_Loans a1
	INNER JOIN Books a2 ON a2.BookID = a1.BookID
	INNER JOIN Borrower a3 ON a3.CardNo = a1.CardNo
	INNER JOIN Library_Branch a4 ON a4.BranchID = a1.BranchID
	WHERE DateDue = @TodaysDate AND BranchName = 'Sharpstown'
END

GO
CREATE PROCEDURE Five
AS
BEGIN
	SELECT a1.BranchName, COUNT(a2.BranchID) AS 'Number of Books'
	FROM Library_Branch a1
	INNER JOIN Book_Loans a2 ON a2.BranchID = a1.BranchID
	GROUP BY a1.BranchName
END

GO
CREATE PROCEDURE Six
AS
BEGIN
	SELECT a2.NameB, a2.AddressB, COUNT(a1.CardNo) AS 'Number of Books'
	FROM Book_Loans a1
	INNER JOIN Borrower a2 ON a2.CardNo = a1.CardNo
	GROUP BY a2.NameB, a2.AddressB
	HAVING COUNT(a1.CardNo) > 5;
END

GO
CREATE PROCEDURE Seven
AS
BEGIN
SELECT a1.Title, a2.Number_Of_Copies, a3.AuthorName, a4.BranchName
	FROM Book_Copies a2
	INNER JOIN Books a1 ON a1.BookID = a2.Book
	INNER JOIN Book_Authors a3 ON a3.BookID = a2.Book
	INNER JOIN Library_Branch a4 ON a4.BranchID = a2.BranchID
	WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'
END
