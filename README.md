# Kabarak Timetabling

### Requirements
1. Composer
2. MySQL
3. Laravel Websockets ([Custom version](https://github.com/kiptooshem/kevs-websocket.git))
4. Redis
### Installation
#### 1. Clone the repository
```bash
git clone https://github.com/kiptooshem/timetabling.git
```
#### 2. Install the dependencies
Ensure you have `composer` installed on your computer before proceeding.
Navigate to the root of the project. i.e If you are on linux terminal: `$cd timetabling`

The run:
```bash
composer install
```

#### 3. Setup environment variables
Create a database for the project in MySQL then configure the parameters `DB_DATABASE`, `DB_USERNAME` and `DB_PASSWORD` in the `.env` file at the project root directory.

#### 4. Run database migration
Make sure configuration is not cached:
```bash
php artisan config:clear
```

Then run migration. This will run database scripts to create database tables:
```bash
php artisan migrate
```
#### 5. Seed the database
If the migration is successfull, seed the database with roles and permissions and add default users. This will create two users; `admin@mail.com` and `timetabler@mail.com`, with `TtableAdmin##@@` and `timetabler` as their passwords respectively.
```bash
php artisan db:seed
```

#### 6. Run the application
Run
```bash
php artisan serve
```

A development server will be started running in port `8000`

You can now go to your browser and navigate to `http://localhost:8000` and perform basic CRUD operations on what has been implemented.

*Note that you still won't be able to generate timetable at this stage*

### Queue Setup (Redis)
Install Redis on your machine and update `.env` to point to your redis instance and provide the credentials.
To run the queue worker open a terminal in the project root directory and run `php artisan horizon`. As long as this terminal is open and the command is running, items in the queue will be processed.

### Broadcasting using websockets.
You can setup your own websockets server from [this](https://github.com/kiptooshem/kevs-websocket.git) project. An alternative would be to use an already running instance of the voting system.

To set it up;
1. Clone the repository.
2. Run `composer install`.
3. Rename `.env.example` to `.env`.
4. Create a database for the service and set the parameters in the `.env`.
5. Set redis parameters in the `.env` file.
6. Run `php artisan migrate`.
7. The service should be ready to run now. Open the terminal in the project root and run `php artisan websockets:serve` to start the websocket server. It runs on port `6001` by default.
8. On the project root open another terminal and run `php artisan serve`. This will serve the project as it normally would in order to provide an interface to setup keys and secrets.
9. Go to `http://localhost:8000/` and click on register. Create an account and you will be logged in immediately you signup. 
10. On the `Create App` section of the main page, enter a name and click `Create`.
11. Click on the created app to view the `APP ID`, `APP KEY` and `APP SECRET`. To test these parameters go to `http://localhost:8000/laravel-websockets`. Select the application name and click connect. You should see a list of connections. 
12. Copy and paste the parameters to the `.env` of the timetabling project. The parameters are `PUSHER_APP_ID`, `PUSHER_APP_KEY` and `PUSHER_APP_SECRET` respectively. At this point you no longer need the web interface of the websockets server running, so you can stop it. Let the websockets command continue running as it is the one serving the actual websockets.
13. Go to line `166` of `public/js/app.js` in the timetabling project and update `key`, `wsHost` and `wsPort` to match the parameters of your websocket server. `key` refers to the key generated in point 11.
14. Go to `config/broadcasting.php` and update host IP. (Suggestion: Add `PUSHER_APP_HOST` to .env and use `env('PUSHER_APP_HOST')` in the host field of `config/broadcasting.php` so you can edit all parameters from one place)

### Setup PDF Generator
1. Download [wkhtmltopdf](https://wkhtmltopdf.org/) and install on your machine. Make sure the command can execute successfully.
2. Set the path to the command in `config/snappy.php`


The timetabling project should be able to connect to the websocket server now. If everything is setup correctly, the timetable generator should be triggered when `Generate Timetable` is clicked.
