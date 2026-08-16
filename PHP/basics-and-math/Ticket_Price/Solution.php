<?php
$age = intval(trim(fgets(STDIN)));

$type = '';
$price = 0;

switch(true) {
    case ($age < 12):
        $type = 'Child';
        $price = '$5';
        break;
    case ($age >= 12 && $age < 64):
        $type = 'Adult';
        $price = '$15';
        break;
    case ($age >= 64):
        $type = 'Senior';
        $price = '$8';
        break;
}

echo $type . PHP_EOL;
echo $price . PHP_EOL;
