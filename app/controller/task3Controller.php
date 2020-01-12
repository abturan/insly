<?php

class task3Controller
{
    private $taskManager;
    private $langugeFile;
    
    public function __construct($taskManager,$langugeFile)
    {
        $this->taskManager = $taskManager; 
        $this->langugeFile = $langugeFile; 
    }

    public function home()
    { 
      $employees = $this->taskManager->findAllEmployee();
      $View = new TaskView($this->taskManager);
      $View->renderView($employees);
    }

    public function add()
    { 
      $View = new TaskView($this->taskManager);
      $View->renderView();
    }

    public function store($request)
    { 
      $res = null;
      $res = $this->taskManager->addEmployee(
        $request['name'],
        $request['phone'],
        $request['email'],
        $request['ssn'],
        $request['is_current_employee'],
        $request['address'],
        $request['birthdate'],
      );

      if ($res) {
        $res_info = $this->taskManager->addEmployeeInfo(
          $res,
          $request['introduction-en'],
          $request['introduction-es'],
          $request['introduction-fr'],
          $request['experience-en'],
          $request['experience-es'],
          $request['experience-fr'],
          $request['education-en'],
          $request['education-es'],
          $request['education-fr'],
        );
      }

      if ($res_info) $this->redirectAction();
      else $this->redirectAction("/?action=add&error=error");
    }

    public function show($request)
    {   
        $employee = $this->taskManager->findOneEmployeeById($request['id']);
        $lang = [
          'locale' => $this->langugeFile,
          'current' => (!isset($_REQUEST['lang']))? 'en' : $_REQUEST['lang'], //default language is En
          'langList' => [
            'en', 'es', 'fr'
          ],
        ];

        $data = [
          'employee' => $employee,
          'lang' => $lang,
        ];

        $View = new taskView($this->taskManager);
        $View->renderView($data);
    }

    protected function redirectAction($route="?action=task3")
    {
        header("location: $route");
    }
}