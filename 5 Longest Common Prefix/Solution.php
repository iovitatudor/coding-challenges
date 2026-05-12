<?php

class Solution {

    /**
     * @param String[] $strs
     * @return String
     */
    function longestCommonPrefix(array $strs): string
    {
        if(empty($strs)) return "";

        $result = $strs[0];

        for($i = 1; $i < count($strs); $i++) {
            while (!str_starts_with($strs[$i], $result)) {
                $result = substr($result, 0, -1);
            }
        }

        return $result;
    }
}


$solution = new Solution();
$output = $solution->longestCommonPrefix(["flower", "flow", "flight"]);

var_dump($output);
