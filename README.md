# Working On

This application is for current Omaha Code School students to submit what they are currently working on. Each student will submit their current task (e.g. "correcting bugs caused by browser's lack of Flexbox support") and stress level between 3-6 times per day. This application stores those updates and provides an always updating display of the most recent ones for review by other students.

Administration access includes the ability to search posts by student and date. Only administrators are able to see a student's stress level.

<table>
  <tr>
    <td>
      <img src="/screenshots/not_logged_in.png">
    </td>
    <td>
      <img src="/screenshots/logged_in.png">
    </td>
  </tr>
  <tr>
    <td>
      <img src="/screenshots/new_post.png">
    </td>
    <td>
      <img src="/screenshots/modal_window.png">
    </td>
  </tr>
</table>

## Setup

Clone into this repo and run `setup_database.rb`. This will create everything needed to get the program up and running. Simply run `ruby main.rb` from your command line to start the application. Users will be able to register and begin posting.

## Setting up Administrator

Setting up an administrator will require adding a new user to the admin table in the database. Anyone added to this table will be able to sign in through the administration sign in window.

<table>
  <tr>
    <td>
      <img src="/screenshots/admin_logged_in.png">
    </td>
    <td>
      <img src="/screenshots/admin_stuff.png">
    </td>
  </tr>
</table>

## Deploying

Follow he same setup steps above to build the initial database. You will need to have access to your database in order to setup administrators.