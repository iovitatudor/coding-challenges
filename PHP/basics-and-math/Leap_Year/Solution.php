<?php
$year = intval(trim(fgets(STDIN)));

// Check and print
if (($year % 4 === 0) && ($year % 100 != 0 || $year % 400 === 0)) {
    echo 'Leap year';
} else {
    echo 'Not a leap year';
}
