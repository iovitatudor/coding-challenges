<?php
$n = intval(trim(fgets(STDIN)));

$sum = 0;
for ($i = 0; $i < $n; $i++) {
    $sum += intval(trim(fgets(STDIN)));
}

echo "Sum: " . $sum . "\n";
