<?php
include '../app/calculator.php';

class task2Controller
{
    
    public function home()
    { 
      $View = new TaskView();
      $View->renderView();
    }

    public function calculate($request)
    { 
      $estimated = $request['estimated'];
      $tax = $request['tax'];
      $instalments = $request['instalments'];
      $timeZone = $request['timezone'];

      $calculator = new Calc($estimated, $tax, $instalments, $timeZone);
      $resultSet = $calculator->calculate();

      $View = new TaskView();
      $View->renderView($resultSet);
    }

    

}