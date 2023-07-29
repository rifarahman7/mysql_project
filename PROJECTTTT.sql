CREATE DATABASE Library;
USE Library;
CREATE TABLE Branch (Branch_no INT PRIMARY KEY,Manager_Id INT,Branch_address VARCHAR(255),Contact_no VARCHAR(15),
FOREIGN KEY (Manager_Id) REFERENCES Employee(Emp_Id));
CREATE TABLE Employee (Emp_Id INT PRIMARY KEY,Emp_name VARCHAR(255),Position VARCHAR(100),Salary INT);
CREATE TABLE Customer (Customer_Id INT PRIMARY KEY,Customer_name VARCHAR(255),
Customer_address VARCHAR(255),Reg_date DATE);
CREATE TABLE IssueStatus (Issue_Id INT PRIMARY KEY,Issued_cust INT,Issued_book_name VARCHAR(255),Issue_date DATE,
Isbn_book VARCHAR(20),FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));
CREATE TABLE ReturnStatus (Return_Id INT PRIMARY KEY,Return_cust INT,Return_book_name VARCHAR(255),Return_date DATE,
Isbn_book2 VARCHAR(20),FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
CREATE TABLE Books (ISBN VARCHAR(20) PRIMARY KEY,Book_title VARCHAR(255),Category VARCHAR(100),Rental_Price INT,
Status ENUM('yes', 'no'),Author VARCHAR(255),Publisher VARCHAR(255));
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES(1, 101, 'keralassery', '232999'),(2, 102, 'kongad', '232078'),
(3, 103, 'mannur', '232256'),(4, 104, 'pathiripala', '9991547'),(5, 105, 'parali', '888926'),
(6, 106, 'palakkad', '7559980');
INSERT INTO Employee (Emp_Id, Emp_name,Position, Salary)
VALUES (101,'micheal_scott','Manager',50000),(102,'schrute','assistant_manager',30000),(103,'rifa','salesman',40000),
(104,'rafi','salesman',40000),(105,'rashid','accountant',20000),(106,'oscar','accountant',20000);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES(1, 'creed', 'scranton', '2021-07-01'),(2, 'shumaker', 'newyork', '2021-06-12'),
(3, 'leaa', 'london', '2023-07-01'),(4, 'yanet', 'manchester', '2023-06-12');
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES ('Issue1', 'wings_of_fire', 'motivation', 30,'yes','paulo','dc_books'),('Issue2', 'playing_it', 'motivation', 30,'yes','sachin','dc_books'),
('Issue3', 'SQL', 'tech', 60,'no','rifa','cc_books'),('Issue4', 'alchemist', 'kalam', 30,'no','apj','ac_books');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES(1, 1, 'wings_of_fire', '2021-01-02', 'issue1'),(2, 2, 'playing_it', '2022-07-12', 'Issue2'),
(3, 3, 'SQL', '2023-05-10', 'Issue3'),(4, 4, 'alchemist', '2020-01-06', 'Issue4');
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES (1, 1, 'wings_of_fire', '2022-01-02', 'issue1');
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES ( 2,2, 'wings_of_fire', '2022-07-12', 'Issue2'),
(3, 3, 'SQL', '2023-07-10', 'Issue3'),(4, 4, 'alchemist', '2022-01-06', 'Issue4');
SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Books;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;
##question1 available books
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';
##q2employeesalary
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;
#q3 Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name FROM Books AS B
JOIN IssueStatus AS I ON B.ISBN = I.Isbn_book
JOIN Customer AS C ON I.Issued_cust = C.Customer_Id;
#q4 Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;
#q4 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
UPDATE Employee SET Salary=80000 WHERE Emp_Id=101;
UPDATE Employee SET Salary=100000 WHERE Emp_Id=102;
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;









