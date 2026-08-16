<?php
$s = trim(fgets(STDIN));

function checkBrackets(string $s): string
{
    $brackets = [')' => '(', ']' => '['];
    $sArray = str_split($s);
    $stackArray = [];

    for ($i = 0; $i < count($sArray); $i++) {
        $char = $sArray[$i];

        if ($char === '(' || $char === '[') {
            $stackArray[] = $char;
        } else {
            if (empty($sArray)) {
                return 'No';
            }

            $lastBracket = array_pop($stackArray);

            if ($lastBracket !== $brackets[$char]) {
                return 'No';
            }
        }
    }

    return count($stackArray) === 0 ? 'Yes' : 'No';
}

echo checkBrackets($s);
