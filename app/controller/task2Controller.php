<?php
include '../app/calculator.php';
include 'controller.php';
require_once 'calculatable.php';

class task2Controller extends controller implements calculatable
{
    private $resultSet;
    private $estimated;
    private $tax;
    private $instalments;
    private $timeZone;
    
    public function __construct($request)
    {
      $this->estimated = $request['estimated'];
      $this->tax = $request['tax'];
      $this->instalments = $request['instalments'];
      $this->timeZone = $request['timezone'];
    }

    public function home()
    { 
      $View = new TaskView();
      $View->renderView();
    }

    public function calculate() : array
    { 
      $calculator = new Calc($this->estimated, $this->tax, $this->instalments, $this->timeZone);
      $this->resultSet = $calculator->calculate();
      $View = new TaskView();
      $View->renderView($this->resultSet);
    }
    
}