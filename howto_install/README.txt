# Currency Bot

# Curerncy Bot is a PHP App. It's functionality it is to work as a chat bot for mock back account transaction
# Including: 
# Deposit Money, on ANY standar currency.
# Withdraw Money, on ANY standar currency.
# Check Balance.
# As well as chat bot user account, Must be logged in to make transactions on your account.

## Installation

# Install PHP Composer From: 

https://getcomposer.org/

# Install Laravel with the command, for PHP artisan to work.

composer global require laravel/installer

# Clone, in the directory need for your server, ex. in Windows can be /xampp/htdocs/ , 
# master branch of: 
https://github.com/ignaciopinto/jobsity

# Edit the file .env in the following sections to the ones you need for.
# The system was tested with MariaDB/MySql.

# DB_CONNECTION=mysql
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_DATABASE=jobsity
# DB_USERNAME=root
# DB_PASSWORD=

# After setting the database, and if is not created, create it BEFORE the following steps.

# To Generate the Generate the Tables
# This command will generate the tables in the database setted in the ENV file, on DB_DATABASE
# In a Terminal or Console, in the app directory, where was cloned, Ex. /xampp/htdocs/jobsity.
# You can run the following two php artisan commands. or you can execute the following composer script in the command line.

composer currencybot

# Will create the DB tables needed for the app.
php artisan migrate

# The app need a few pre-load data in the database, for that use the following command.
php artisan db:seed


# The Initial data is:
# User: Ignacio Pinto
# Email: ignacio.pinto.e@gmail.com
# password: password
# initial balance: 150.000
# default currency: CLP
# and all the standar currency codes.
# And the api_key for the Currency Converter APIs.
# If you need to change them. go to your database, table "currency_api_keys", and change the "api_key" value in them.

#In case you can't use the migration/seeder commands. run the import the "jobsity.sql" file into your database, it's a MYSQL file.
