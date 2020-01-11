<?php
class Calc {

    public $estimated;
    public $tax;
    public $instalments;
    public $timeZone;

    private $basePrice = 11;
    private $basePriceCustom = 13;
    private $basePriceCustomTimeStart = 150000;
    private $basePriceCustomTimeEnd = 200000;
    private $basePriceCustomDay = 'Friday';
    private $commission = 17;

    public function __construct($estimated, $tax, $instalments, $timeZone) 
    {
        $this->estimated = $estimated;
        $this->tax = $tax;
        $this->instalments = $instalments;
        $this->timeZone = $timeZone;
    }

    public function calculate() : array
    {
        $basePrice = $this->basePrice();
        $tax = $this->tax;
        $instalments = $this->instalments;
        $timeZone = $this->timeZone;

        $value = number_format($this->estimated, 2, '.', '');
        $basePrice = number_format(($value/100)*$basePrice, 2, '.', '');
        $commision = number_format(($basePrice/100)*$this->commission, 2, '.', '');
        $tax = number_format(($basePrice/100)*$tax, 2, '.', '');
        $totalCost = number_format($basePrice + $commision + $tax, 2, '.', '');

        $policyResult = [
            'value' =>  $value,
            'basePrice' => $basePrice,
            'commision' => $commision,
            'tax' => $tax,
            'totalCost' => $totalCost,
            'instalments' => $instalments,

            'basePriceInstallments' => $this->installments($basePrice,$instalments),
            'commisionInstallments' => $this->installments($commision,$instalments),
            'taxInstallments' => $this->installments($tax,$instalments),
            'totalCostInstallments' => $this->installments($totalCost,$instalments),
        ];
        return $policyResult;
    }



    public function basePrice() : int
    {
        $basePriceCustomTimeStart = $this->basePriceCustomTimeStart;
        $basePriceCustomTimeEnd = $this->basePriceCustomTimeEnd;
        $basePriceCustom = $this->basePriceCustom;
        $basePrice = $this->basePrice;

        return ($this->isWithinTimeRange($basePriceCustomTimeStart, $basePriceCustomTimeEnd))?$basePriceCustom:$basePrice;
    }


    /**
     * Base price of policy is 11% from entered car value, except every Friday 15-20 o’clock (user time) when it is 13%
     */
    public function isWithinTimeRange($start, $end) : bool
    {
        date_default_timezone_set($this->timeZone);
        $now = date ("His");
        $day = date('l');

        if ($day == $this->basePriceCustomDay)
        {
            if($now >= $start && $now < $end){
                return true;
            }
        }
        return false;
    }


    /**
     * Installment sums must match total policy sum- pay attention to cases where sum does not divide equally
     * 
     */
    public function installments ($paymentType, $installments){
        
        $returnArr = [];

        $div = number_format(round($paymentType/$installments), 2, ',', '') ;
        $sumOfDivisions = $div * $installments;
  
        for ($i=1; $i<=$installments; $i++)
        {
            if ($sumOfDivisions != $paymentType)
            {
                if ($sumOfDivisions > $paymentType){
                    $diff = $sumOfDivisions - $paymentType;
                    if ($i == $installments){
                        $div = number_format($div - $diff, 2, ',', '');
                        $returnArr[] = $div;
                    } else {
                        $returnArr[] = $div;
                    }
                } else {
                    $diff = $paymentType - $sumOfDivisions;
                    if ($i == $installments){
                        $div = number_format($div + $diff, 2, ',', '');
                        $returnArr[] = $div;
                    } else {
                        $returnArr[] = $div;
                    }
                }
            } else {
                $returnArr[] = $div;
            }
        }
        return $returnArr;
      }
}
?>