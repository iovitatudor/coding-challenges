<?php
$width = intval(trim(fgets(STDIN)));
$height = intval(trim(fgets(STDIN)));

$output = null;

for ($i = 0; $i < $height; $i++) {
    for ($j = 0; $j < $width; $j++) {
        if ($i === 0 || $i === $height - 1) {
            $output .= '*';
        } else {
            if ($j === 0 || $j === $width - 1) {
                $output .= '*';
            } else {
                $output .= ' ';
            }
        }
    }
    $output .= " \n";
}

echo $output;
