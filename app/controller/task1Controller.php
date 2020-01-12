<?php
require 'controller.php';

class task1Controller extends controller
{
    
  public function home()
  { 
    $name = 'Ahmet Burak Turan';
    $nameArr = str_split($name);

    $View = new TaskView();
    $View->renderView($nameArr);
  }
}