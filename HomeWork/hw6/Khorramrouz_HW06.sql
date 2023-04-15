-- Khorramrouz, Adel
-- ISTE 608
-- HW06
-- 29/03/2023
-- professor: Dr. Habermas, James

USE book;

-- Q1
SELECT Title, CatDescription FROM book
    JOIN Category ON book.Category = Category.CatID
    ORDER BY CatDescription DESC, Title ASC;

-- Q2 Retrieve book titles and ratings from reviewers not employed by a news organization.
SELECT Title, Rating FROM book
    JOIN BookReview USING (ISBN)
        JOIN Reviewer USING(ReviewerID)
            WHERE EmployedBy IS Null;


-- Q3 Retrieve book titles and ratings from reviewers employed by a news organization.
SELECT Title, Author.Lastname, Author.FirstName From book
    JOIN BookAuthor USING (ISBN)
        JOIN Author USING (AuthorID)
        ORDER BY book.Title ASC, Author.LastName ASC;

-- Q4
-- Retrieve the title, author's name, and price of pre-owned books that are priced $50.00 or below,
-- sorted by price in descending order and title in ascending order.
SELECT Title, Author.LastName, Author.FirstName, Price FROM book
    JOIN OwnersBook USING (ISBN)
        JOIN BookAuthor USING (ISBN)
            JOIN Author USING (AuthorID)
                WHERE Price <= 50
                    ORDER BY Price DESC, Title ASC;


-- Q5 Show the titles of ALL books and name of reviewer if the book had a reviewer(s).
SELECT Title, Reviewer.name FROM book
    LEFT JOIN BookReview USING (ISBN)
        LEFT JOIN Reviewer USING (ReviewerID);
            

-- Q6 display the ISBN and title of book that have a category that starts with the letter s.
SELECT ISBN, Title FROM book
    Join Category ON book.Category = Category.CatID
        WHERE CatDescription LIKE 'S%';