<?php

class Solution {
    /**
     * @param Integer $n
     * @return Integer
     */
    function climbStairs($n): int
    {
        if ($n <= 2) {
            return $n;
        }

        $first = 1;
        $second = 2;

        for ($i = 3; $i <= $n; $i++) {

            $temp = $first + $second;

            $first = $second;
            $second = $temp;
        }

        return $second;
    }
}
