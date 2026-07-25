<?php
declare(strict_types=1);

$n = intval(trim(fgets(STDIN)));
$arr = array_map('intval', explode(' ', trim(fgets(STDIN))));

function findDuplicates(int $n, array $arr): ?int
{
    $numbersArr = [];

    for ($i = 0; $i < count($arr); $i++) {
        if (in_array($arr[$i], $numbersArr)) {
            return (int)$arr[$i];
        }
        $numbersArr[] = $arr[$i];
    }
}

echo findDuplicates($n, $arr);

