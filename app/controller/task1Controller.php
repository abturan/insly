<?php

class task1Controller
{
    
  public function home()
  { 
    $name = 'Ahmet Burak Turan';
    $nameArr = str_split($name);

    $View = new TaskView();
    $View->renderView($nameArr);
  }
}