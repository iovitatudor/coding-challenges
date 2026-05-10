<?php

class Solution {

    /**
     * @param Integer $x
     * @return Boolean
     */
    function isPalindrome($x) {
        if($x < 0) {
            return false;
        }

        $numbersArray = str_split($x);
        $arrayLength = count($numbersArray) - 1;

        for($i = 0; $i <= $arrayLength; $i++) {
            if($numbersArray[$i] !== $numbersArray[$arrayLength - $i]) {
                return false;
            }
        }
        return true;
    }
}
