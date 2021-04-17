# CPlan

To use CPlan, you will need to log in with your Columbia Gmail account.
Heroku Link: https://cplan.herokuapp.com

Things you may want to cover:

* Ruby version 
2.6, you know it.

* Environment
Ubuntu 16+

## Getting the right local setup

1. Ensure you have postgres installed, then start the server by using 
    ```
    sudo service postgresql start
    ```

2. Ensure you have all gems installed 
    ```
    bundle
    ```

3. Ensure you have local db created and make sure to grant permission for db create
    ```
	sudo -u postgres createuser cplan
	sudo -u postgres psql -c "ALTER USER cplan CREATEDB"
    
    rails db:create
	```
4. Load schemas
    ```
    rails db:schema:load
    ```
5. Add seeds data
    ```
    rails db:seed
    ```
6. Visit the site locally at localhost:3000

Now you are off the hook and **go do your business**!