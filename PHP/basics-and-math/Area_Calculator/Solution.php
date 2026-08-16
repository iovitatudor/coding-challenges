<?php
$shape = trim(fgets(STDIN));

$area = null;

if ($shape === 'rectangle') {
    $width = floatval(trim(fgets(STDIN)));
    $height = floatval(trim(fgets(STDIN)));
    $area = $width * $height;
} elseif ($shape === 'triangle') {
    $base = floatval(trim(fgets(STDIN)));
    $height = floatval(trim(fgets(STDIN)));
    $area = $base * $height / 2;
} elseif ($shape === 'circle') {
    $radius = floatval(trim(fgets(STDIN)));
    $area = pi() * $radius * $radius;
}

echo 'Area: ' . number_format($area, 2);
