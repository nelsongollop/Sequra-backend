# Instalation
Create a .env file in the repository folder with the db user/password
```
DATABASE_USERNAME= ""
DATABASE_PASSWORD= ""
```
Run the following commands in the repository folder
```
bundle install
rake db:create
rake db:migrate
```

If you want contact examples
download the following files:

https://www.dropbox.com/s/wms8dlqzs6bqkul/backend%20challenge%20dataset.zip?dl=0

and put the *.json files in the `storage` folder.
Then:
```
rake db:seed
```

## Usage
Run `rails s` to launch the server

## PENDING
- Request tests
- Job that runs every monday
