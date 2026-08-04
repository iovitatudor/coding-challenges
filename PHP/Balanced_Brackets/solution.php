<?php
declare(strict_types=1);

function isValidBrackets(string $input): bool
{
    $stack = [];
    $allBrackets = [']' => '[', '}' => '{', ')' => '('];

    for ($i = 0; $i < strlen($input); $i++) {
        $bracket = $input[$i];

        if (isset($allBrackets[$bracket])) {
            if (array_pop($stack) !== $allBrackets[$bracket]) {
                return false;
            }
        } else {
            $stack[] = $bracket;
        }
    }

    return empty($stack);
}

$result[] = isValidBrackets("()"); // true
$result[] = isValidBrackets("()[]{}"); // true
$result[] = isValidBrackets("(]"); // false
$result[] = isValidBrackets("([)]"); // false
$result[] = isValidBrackets("{[]}"); // true

print_r($result);
