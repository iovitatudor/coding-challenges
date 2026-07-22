<?php
$text = trim(fgets(STDIN));

function removeDuplicates(string $text): string
{
    $result = '';
    $characters = [];

    for ($i = 0; $i < strlen($text); $i++) {
        if (!in_array($text[$i], $characters)) {
            $result .= $text[$i];
            $characters[] = $text[$i];
        }
    }

    return $result;
}

echo removeDuplicates($text);
