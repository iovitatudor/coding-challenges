<?php

class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $val
     * @return Integer
     */
    function removeElement(array &$nums, int $val): int
    {
        if(!count($nums)) return 0;

        $k = 0;

        for($i = 0; $i < count($nums); $i++) {
            if($nums[$i] !== $val) {
                $nums[$k] = $nums[$i];
                $k++;
            }
        }

        return $k;
    }
}
