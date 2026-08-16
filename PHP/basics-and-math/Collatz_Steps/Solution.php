<?php
$n = intval(trim(fgets(STDIN)));

function countSteps(int $n):int {
    $steps = 0;

    while($n > 1) {
        if($n % 2 === 0) {
            $n = $n / 2;
        } else {
            $n = ($n * 3) + 1;
        }
        $steps++;
    }

    return $steps;
}

echo 'Steps: ' . countSteps($n) . PHP_EOL;
