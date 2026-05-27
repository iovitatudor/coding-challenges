<?php

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     public $val = null;
 *     public $left = null;
 *     public $right = null;
 *     function __construct($val = 0, $left = null, $right = null) {
 *         $this->val = $val;
 *         $this->left = $left;
 *         $this->right = $right;
 *     }
 * }
 */
class Solution {

    /**
     * @param Integer[] $nums
     * @return TreeNode|null
     */
    function sortedArrayToBST(array $nums): ?TreeNode
    {
        return $this->buildTree($nums, 0, count($nums) - 1);
    }

    /**
     * @param Integer[] $nums
     * @param Integer $left
     * @param Integer $right
     * @return TreeNode|null
     */
    function buildTree(array $nums, int $left, int $right): ?TreeNode
    {
        if($left > $right) {
            return null;
        }

        $middle = floor(($right + $left) / 2);

        $root = new TreeNode($nums[$middle]);

        $root->left = $this->buildTree($nums, $left, $middle - 1);

        $root->right = $this->buildTree($nums, $middle + 1, $right);

        return $root;
    }
}
