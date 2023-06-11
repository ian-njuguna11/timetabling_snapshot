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
"# timetabling_snapshot" 
