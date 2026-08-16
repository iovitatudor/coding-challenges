<?php
$a = intval(trim(fgets(STDIN)));
$b = intval(trim(fgets(STDIN)));
$c = intval(trim(fgets(STDIN)));

// Find and print the smallest
$arrayOfNumbers = [$a, $b, $c];
sort($arrayOfNumbers);

echo 'Smallest: ' . $arrayOfNumbers[0] . PHP_EOL;
// echo 'Smallest: ' . min($arrayOfNumbers) . PHP_EOL; // alternative
