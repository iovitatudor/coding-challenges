<?php
$total = intval(trim(fgets(STDIN)));

// Calculate hours, minutes, seconds
$hours = (int)floor($total / 60 / 60);
$minutes = (int)($total / 60) % 60;
$seconds = $total % 60;

// Print the result
echo $hours . 'h ' . $minutes . 'm ' . $seconds . 's' . PHP_EOL;
