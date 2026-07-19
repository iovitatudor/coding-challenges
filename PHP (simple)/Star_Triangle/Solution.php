<?php
$n = intval(trim(fgets(STDIN)));

// Print the star triangle
for ($i = 1; $i <= $n; $i++) {
    echo str_repeat('*', $i) . PHP_EOL;
}
