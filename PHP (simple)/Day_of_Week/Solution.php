<?php
$day = intval(trim(fgets(STDIN)));

// Print the day name
$result = match($day) {
    1 => 'Monday',
    2 => 'Tuesday',
    3 => 'Wednesday',
    4 => 'Thursday',
    5 => 'Friday',
    6 => 'Saturday',
    7 => 'Sunday',
    default => 'Invalid',
};

echo $result;
