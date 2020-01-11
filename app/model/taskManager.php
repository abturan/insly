<?php
/**
 * Modal of employees and employee_info tables
 */
class taskManager
{
    private $connectionParam = [
        'host' => '',
        'port' => '',
        'user' => '',
        'password' => '',
        'dbname' => ''
    ];
    private $db;

    public function __construct($appConfig = null)
    {
        $this->connectionParam = $appConfig['connection']['params'];
        
        $this->db = new mysqli($this->connectionParam['host'], $this->connectionParam['user'], $this->connectionParam['password'], $this->connectionParam['dbname']);
        
        if (mysqli_connect_errno())
        {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }
    }
    
   
    public function findAllEmployee()
    {
        $employees = array();
        $query = "SELECT * FROM `employees`";
        $result = $this->db->query($query);
        if ($result)
        {
            while ($row = $result->fetch_assoc()) {
                $employees[] = array(
                    'id' => $row['id'],
                    'name' => $row['name'],
                    'phone' => $row['phone'],
                );
            }
            $result->close();
        } else
            echo($this->db->error);

        return $employees;
    }

   
    public function findOneEmployeeById($id)
    {
        $employee = array();
        $query = "SELECT * FROM `employees` WHERE id = '%s'";
        $query = sprintf($query, $this->db->real_escape_string($id));
        if ($result = $this->db->query($query))
        {
            $row = $result->fetch_assoc();
            $employee = array(
                'id' => $row['id'],
                'name' => $row['name'],
                'birthdate' => $row['birthdate'],
                'phone' => $row['phone'],
                'ssn' => $row['ssn'],
                'is_current_employee' => $row['is_current_employee'],
                'email' => $row['email'],
                'address' => $row['address'], 
            );

            $result->close();
        } else
            die($this->db->error);


        $employee_info = array();
        $query = "SELECT * FROM `employee_info` WHERE employee_id = '%s'";
        $query = sprintf($query, $this->db->real_escape_string($id));

        $result = $this->db->query($query);
        if ($result)
        {
            while ($row = $result->fetch_assoc()) {
                $employee_info[] = array(
                    'employee_info_id' => $row['employee_info_id'],
                    'info_en' => $row['info_en'],
                    'info_es' => $row['info_es'],
                    'info_fr' => $row['info_fr'],   
                );
            }
            $result->close();
        } else
            echo($this->db->error);

        $employee['info'] = $employee_info;

        return $employee;
    }
    
    
    
    public function addEmployee($name, $phone, $email,$ssn,$is_current_employee,$address,$birthdate)
    {

        $birthdate = date('Y-m-d', strtotime(str_replace('-', '/', $birthdate)));
        $query =  "INSERT INTO employees(`name`, `phone`, `email`,`ssn`,`is_current_employee`,`address`, `birthdate`) "
                . "VALUES ( '%s', '%s', '%s', '%s',  '%s', '%s', '%s')";
        $query = sprintf($query, $this->db->real_escape_string($name),  
                                 $this->db->real_escape_string($phone),  
                                 $this->db->real_escape_string($email),
                                 $this->db->real_escape_string($ssn),
                                 $this->db->real_escape_string($is_current_employee),
                                 $this->db->real_escape_string($address),
                                 $this->db->real_escape_string($birthdate)                              
                                );
                    
        if ($result = $this->db->query($query))
        {
            return $this->db->insert_id;
        } else
            die($this->db->error);
    }


    public function addEmployeeInfo($id, $introductionEn,$introductionEs,$introductionFr,$experienceEn,$experienceEs,$experienceFr,$educationEn,$educationEs,$educationFr)
    {

        if (!$introductionEn=="" || !$introductionEs=="" || !$introductionFr=="" )
        {
            $query =  "INSERT INTO employee_info(`employee_id`, `employee_info_id`, `info_en`,`info_es`,`info_fr`) "
                    . "VALUES ( '%s', 1,  '%s', '%s', '%s')";
            $query = sprintf($query, $this->db->real_escape_string($id),  
                                    $this->db->real_escape_string($introductionEn),  
                                    $this->db->real_escape_string($introductionEs),
                                    $this->db->real_escape_string($introductionFr),                            
                                    );
            if (!$result = $this->db->query($query))
            {
                die($this->db->error);
            } 
                                    
        } 
        if (!$experienceEn=="" || !$experienceEs=="" || !$experienceFr=="" )
        {
            $query =  "INSERT INTO employee_info(`employee_id`, `employee_info_id`, `info_en`,`info_es`,`info_fr`) "
                    . "VALUES ( '%s', 2,  '%s', '%s', '%s')";
            $query = sprintf($query, $this->db->real_escape_string($id),  
                                    $this->db->real_escape_string($experienceEn),  
                                    $this->db->real_escape_string($experienceEs),
                                    $this->db->real_escape_string($experienceFr),                            
                                    );
            if (!$result = $this->db->query($query))
            {
                die($this->db->error);
            } 
                                    
        } 
        if (!$educationEn=="" || !$educationEs=="" || !$educationFr=="" )
        {
            $query =  "INSERT INTO employee_info(`employee_id`, `employee_info_id`, `info_en`,`info_es`,`info_fr`) "
                    . "VALUES ( '%s', 3,  '%s', '%s', '%s')";
            $query = sprintf($query, $this->db->real_escape_string($id),  
                                    $this->db->real_escape_string($educationEn),  
                                    $this->db->real_escape_string($educationEs),
                                    $this->db->real_escape_string($educationFr),                            
                                    );
            if (!$result = $this->db->query($query))
            {
                die($this->db->error);
            }                       
        }                     
        return true;                    
    }
}
