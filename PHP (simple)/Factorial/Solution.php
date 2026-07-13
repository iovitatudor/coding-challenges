<?php
function factorial($n): int|string
{
    $result = 1;
    for($i = 2; $i <= $n; $i++) {
        if (function_exists('bcmul')) {
            $result = bcmul($result, (string)$i);
        } else {
            $result *= $i;
        }
    }
    return $result;
}

$num = intval(trim(fgets(STDIN)));
echo $num . "! = " . factorial($num) . "\n";
