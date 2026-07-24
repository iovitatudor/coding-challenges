<?php
$n = intval(trim(fgets(STDIN)));

function checkPrime(int $n): string {
    if($n < 2) {
        return 'Not prime';
    }

    $squareRoot = sqrt($n);

    for($i = 2; $i <= $squareRoot; $i++) {
        if($n % $i === 0) {
            return 'Not prime';
        }
    }

    return 'Prime';
}

echo checkPrime($n);
