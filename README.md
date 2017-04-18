# Working On

This application is for current students to submit what they are currently working on. Each student will submit their current task (e.g. "correcting bugs caused by browser's lack of Flexbox support") and stress level between 3-6 times per day. This application stores those updates and provides an always updating display of the most recent ones for review by other students.

Administration access includes the ability to search posts by student and date.

### Setup

Clone into this repo and run `setup_database.rb`. This will create everything needed to get the program up and running. Simply run `ruby main.rb` from your command line to start the application. Users will be able to register and begin posting.

### Setting up Administrator

Setting up an administrator will require adding a new user to the admin table in the database. Anyone added to this table will be able to sign in through the administration sign in window.