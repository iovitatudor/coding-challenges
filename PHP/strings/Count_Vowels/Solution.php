<?php
$text = strtolower(trim(fgets(STDIN)));

$count = 0;
$vowels = ['a', 'e', 'i', 'o', 'u'];

for ($i = 0; $i < strlen($text); $i++) {
    if(in_array($text[$i], $vowels)) {
        $count++;
    }
}

echo 'Vowels: '. $count;
