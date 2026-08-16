<?php

class Solution {
    /**
     * @param String $s
     * @return Integer
     */
    function romanToInt($s) {
        $result = 0;

        $numerals = [
            "I" => 1,
            "V" => 5,
            "X" => 10,
            "L" => 50,
            "C" =>  100,
            "D" =>  500,
            "M" => 1000
        ];

        for($i = 0; $i < strlen($s); $i++) {
            $current = $numerals[$s[$i]];
            $next = isset($numerals[$s[$i + 1]]) ? $numerals[$s[$i + 1]] : 0;

            if ($current < $next) {
                $result -= $current;
            } else {
                $result += $current;
            }
        }

        return $result;
    }
}
