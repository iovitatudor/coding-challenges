<?php
$n = intval(trim(fgets(STDIN)));

function createPyramid(int $n): void {
    for($i = 0; $i < $n; $i++) {
        for($j = 0; $j <= $i; $j++) {
            echo $j + 1;
            echo $i != $j ? ' ' : '';
        }
        echo PHP_EOL;
    }
}

createPyramid($n);
