<?php

class Solution {

    /**
     * @param String $haystack
     * @param String $needle
     * @return Integer
     */
    function strStr(string $haystack, string $needle): int
    {
        $needleLength = strlen($needle);

        for ($i = 0; $i <= strlen($haystack) - $needleLength; $i++) {

            if (substr($haystack, $i, $needleLength) === $needle) {
                return $i;
            }
        }

        return -1;
    }
}
