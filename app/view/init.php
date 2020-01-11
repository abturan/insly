<?php

class TaskView
{

    private $converter;
    private $content; 

    public function __construct(taskManager $converter = null)
    {
        $this->converter = $converter;

        $tmp = debug_backtrace();
        $this->controller = str_replace("controller", "", strtolower($tmp[1]['class']));
        $this->action = str_replace("action", "", strtolower($tmp[1]['function']));
    }

    public function __destruct()
    {
        include '../app/view/layout/layout.phtml';
    }

    public function renderView($data = null)
    {
        
        ob_start();
        require "../app/view/$this->controller/$this->action.phtml";
        $this->content = ob_get_clean();
    }


}
