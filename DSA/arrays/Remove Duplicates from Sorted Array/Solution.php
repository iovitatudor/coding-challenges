<?php

class Solution {
    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function removeDuplicates(&$nums): int
    {
        if(!count($nums)) {
            return 0;
        }

        $k = 1;

        for($i = 1; $i < count($nums); $i++) {
            if($nums[$i] !== $nums[$i - 1]) {
                $nums[$k] = $nums[$i];
                $k++;
            }
        }

        return $k;
    }
}
