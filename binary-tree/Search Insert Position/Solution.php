<?php

class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer
     */
    function searchInsert(array $nums, int $target): int
    {
        $left = 0;
        $right = count($nums) - 1;

        while($left <= $right) {
            $middle = floor(($left + $right) / 2);

            if($nums[$middle] === $target) {
                return $middle;
            }

            if($nums[$middle] < $target) {
                $left = $middle + 1;
            }
            if($nums[$middle] > $target) {
                $right = $middle - 1;
            }
        }
        return $left;
    }
}


$solution = new Solution();
$output = $solution->searchInsert([1,3,5,6], 5);

var_dump($output);

