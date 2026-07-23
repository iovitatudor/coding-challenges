<?php
$n = intval(trim(fgets(STDIN)));

function calculateDigits(int $n): int {
    $digitsArray = str_split((string)$n);

    return array_reduce($digitsArray, fn($carry, $digit) => $carry + (int)$digit, 0);
}

echo 'Digit sum: ' . calculateDigits($n) . PHP_EOL;
