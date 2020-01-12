# Insly
Insly developer test including binary code solving, insurance calculator and CRUD operations in OOP-MVC PHP.

## Installation
1. Download as .zip or clone this repo using https://github.com/abturan/insly.git
```console
git clone https://github.com/abturan/insly.git
```
2. Import the ```database/insly.sql``` file to phpMyAdmin
3. Configure ```config/app.config.php``` file for MySQL connection   
```php
return array(
    'connection' => array(
        'database_type' => 'mysqli',
        'params' => array(
            'host' => 'localhost',
            'port' => '8889',
            'user' => 'root',
            'password' => 'root',
            'dbname' => 'insly',
        )
    )
);
```

## Project structure
As most MVC project, this project flows through `public/index.php` and loads the correspondant page base on the URL
```
insly/                              
    app/                            
        controller/                 
            calculatable.php        # Interface for calculator task
            controller.php          # Abstract controller class
            task1Controller.php     # Controller unit for Task 1
            task2Controller.php     # Controller unit for Task 2
            task3Controller.php     # Controller unit for Task 3
        model/                      
            taskManager.php         # Model unit for Task 3
        view/                       
            layout/                 
                 layout.phtml       # Layout for views
            task1/                  
                 home.phtml         # Task 1 home page 
            task2/                  
                 calculate.phtml    # Task 2 result of calculation table
                 home.phtml         # Task 2 home page and calculator form
            task3/                  
                 add.phtml          # Task 3 adding employee form
                 home.phtml         # Task 3 home page and list of employees
                 show.phtml         # Task 3 show employee details
            init.php                # View engine
    config/                         # Database credentials
         app.config.php             # Configuration file for MySQL
    database/                       
         insly.sql                  # SQL database file
    public/                         
         css/                       
            style.css               # Custom css file
         js/                        
            task2.js                # Custom js file for task 2
         .htaccess                  
         index.php                  # Starting point for the entire app
    .htaccess                       # Redirect everything to public/ folder
     
```
