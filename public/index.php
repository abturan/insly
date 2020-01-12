<?php 

$appConfig = require __DIR__ . '/../config/app.config.php';

if (isset ($_REQUEST['lang']))
    $langugeFile = require __DIR__ . '/../config/lang/'.$_REQUEST['lang'].'/locale.php';
else 
    $langugeFile = require __DIR__ . '/../config/lang/en/locale.php';
/**
 * Router
 */
if (isset($_GET['action']))
{
    switch ($_GET['action'])
    {
        case 'task1':
            $controller_name = 'task1Controller';
            $action = 'home';
            break;
        case 'task2':
            $controller_name = 'task2Controller';
            $action = 'home';
            break;    
        case 'task3':
            $controller_name = 'task3Controller';
            $action = 'home';
            break;  
        case 'task3add':
            $controller_name = 'task3Controller';
            $action = 'add';
            break;          
        case 'task3store':
            $controller_name = 'task3Controller';
            $action = 'store';
            break;          
        case 'employee':
            $controller_name = 'task3Controller';
            $action = 'show';
            break;          
        case 'task2calculate':
            $controller_name = 'task2Controller';
            $action = 'calculate';
            break;            
    }
} else
{
    $controller_name = 'task1Controller';
    $action = 'home';
}


/**
 * Call the controller
 */
require '../app/controller/' . $controller_name . '.php';


/**
 * Call the modal
 */
require '../app/model/taskManager.php';


/**
 * Call the view engine
 */
require '../app/view/init.php';



/**
 * Set the modal
 */
$taskManager = new taskManager($appConfig);


/**
 * Set the controller
 */
if ($controller_name=='task3Controller') $controller = new $controller_name($taskManager,$langugeFile);
else $controller = new $controller_name($_REQUEST);


/**
 * Set the action and requests
 */
$controller->{$action}($_REQUEST);

