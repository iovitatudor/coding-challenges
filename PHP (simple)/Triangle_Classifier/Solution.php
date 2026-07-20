<?php
$a = intval(trim(fgets(STDIN)));
$b = intval(trim(fgets(STDIN)));
$c = intval(trim(fgets(STDIN)));

// Classify and print
if(($a + $b <= $c) || ($a + $c <= $b) || ($b + $c <= $a)) {
    echo 'Not a triangle';
} else {
    if($a === $b && $b === $c) {
        echo 'Equilateral';
    } elseif($a === $b || $c === $b || $a === $c) {
        echo 'Isosceles';
    } elseif($a !== $b && $b !== $c) {
        echo 'Scalene';
    }
}

