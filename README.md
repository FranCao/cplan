# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 
2.6, you know it.

## System dependencies
- Install Postgres
	```
	brew install postgresql
	```

- Create a Postgres user
	By doing the following steps:
	```
		/usr/local/opt/postgres/bin/createuser -s postgres
		createuser cplan -d
	```

## Getting the right local setup

1. Ensure you have postgres installed, then start the server by using 
    ```
        brew services start postgresql
    ```

2. Ensure you have all gems installed by using 
    ```
        bundle
    ```

3. Ensure you have local db created by running 
    ```
        rails db:create
    ```

4. Run all the migrations
    ```
        rake db:migrate
    ``` 
Now you are off the hook and **go do your business**!


## How to run the test suite

To run a rspec test:
```
    rspec spec/
```



## Deployment instructions

TBD
