<?php

class Solution {

    /**
     * @param String $s
     * @return Integer
     */
    function lengthOfLastWord(string $s): int
    {
        $inputArray = explode(' ', trim($s));

        $output = $inputArray[count($inputArray) - 1];

        return strlen($output);
    }
}

$solution = new Solution();
$output = $solution->lengthOfLastWord('   fly me   to   the moon  ');

var_dump($output);
