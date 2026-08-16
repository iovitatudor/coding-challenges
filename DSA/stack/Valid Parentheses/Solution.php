<?php

class Solution {

    /**
     * @param String $s
     * @return Boolean
     */
    function isValid($s): bool
    {
        $brackets = [
            ')' => '(',
            '}' => '{',
            ']'=> '['
        ];

        $sArray = str_split($s);
        $stackArray = [];

        for($i = 0; $i < count($sArray); $i++) {
            if($sArray[$i] === '(' || $sArray[$i] === '{' || $sArray[$i] === '[') {
                $stackArray[] = $sArray[$i];
            } else {
                $top = array_pop($stackArray);

                if($top !== $brackets[$sArray[$i]]) {
                    return false;
                }
            }
        }
        var_dump($stackArray);
        return count($stackArray) === 0;
    }
}

$solution = new Solution();
$output = $solution->isValid("()[]{}");

var_dump($output);
