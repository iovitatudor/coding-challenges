<?php
$n = intval(trim(fgets(STDIN)));
$numbers = array();

for ($i = 0; $i < $n; $i++) {
    $numbers[] = intval(trim(fgets(STDIN)));
}

$numbers = array_values(array_unique($numbers));
sort($numbers);

if (count($numbers) < 2) {
    $second = $numbers[0];
} else {
    $second = $numbers[count($numbers) - 2];
}

echo 'Second largest: ' . $second . PHP_EOL;
