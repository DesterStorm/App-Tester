Ruby on Rails Portfolio Project
App-Tester

Introduction

This is an employer tool for testing their employees prior to deployment to the front lines of work. It uses the Rails framework andstretches nested forms/models/routes in the MVC structure to the limit of my finite ability. The application uses sqlite3 for the database to store a companies information and a list of people who are applying for open positions listed in the application. App-Tester comes equiped with a standard test building template for employers to make their own tests based on each individual comanies needs. It also provides employee accounts to accept invitations (via email) to take tests, as well as willingly take them. The tests that each employee take are stored into a database and kept track of to use as further evidence of training. This system also provides employers a method of testing new employees quickly, efficiently and not on the companies time, rather than having a manager spend precious hours testing their knowledge prior to working independantly.

Overview The application is designed to let the company:

Create a new account and sign-in
Edit their profile page by updating their name & email
Invite a new applicant/employee 
Show a list of jobs available for testing 
Update and delete job postings as well as tests from the list.


Overview The application is designed to let the employee/applicant:

Accept an invitation to take a test for the position they are currently/are applying for
Create a new account individually to potentially impress employers with extra knowledge of promotable positions
Create or sign in using their Google account
Track their list of tests taken to show their employer

Running the app

fork and clone this repo.
cd to the directory from the terminal
in the terminal, run bundle install to install all required gems
run thin start --ssl to open the app
open https://localhost:3000/ in your web browser
navigate past the alert message as the server is run dirrectly on localhost:3000
start by hitting sign-up button on the main screen for companies, and the nav menu located in the top right corner for employees
*Note You have to enter a proper email to be allowed to signup to the application *When signing into an existing account, if the wrong password is used, there will be a notice on the page saying so. *if you forgot your password, please click the forgot password link to retrieve it.

The License for my app can be found at https://github.com/DesterStorm/App-Tester/blob/master/MIT-LICENSE
