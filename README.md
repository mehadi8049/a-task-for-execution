

## A task for execution

The application has built with backend laravel API and frontend reactJs.

## Need for Laravel (Backend)

To begin with, You need to clone project and entry into backend and run:

```sh
cd backend
```

```sh
composer install
```

```sh
cp .env.example .env
```
```php
php artisan key:generate
```

```sh
php artisan migrate
```

```sh
php artisan db:seed
```

```sh
php artisan passport:install
```

```sh
php artisan serve --port=8000
```

## Need for ReactJS (Frontend)

To begin with, You need to entry into fronend and must be create .env file and set:
```sh
APP_REACT_API_BASE_URL= base_url/api
```
Example: APP_REACT_API_BASE_URL=http://127.0.0.1:8000/api

Run this command:
```sh
cd frontend
```

```sh
cp .env.example .env
```

```sh
npm install
```

```sh
npm run dev
```


Login first with the Credential:

User:

```sh
mehadi8049@gmail.com
```
password: 

```sh
password
```
