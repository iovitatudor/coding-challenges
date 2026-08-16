<?php
declare(strict_types=1);

$n = intval(trim(fgets(STDIN)));

function reverseNumber(int $n): int
{
    $NArray = str_split((string)$n);
    $reversedN = array_reverse($NArray);

    return (int)implode('', $reversedN);
}

echo reverseNumber($n);
