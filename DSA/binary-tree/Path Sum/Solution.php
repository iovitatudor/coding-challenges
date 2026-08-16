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
     * @param TreeNode $root
     * @param Integer $targetSum
     * @return Boolean
     */
    function hasPathSum(TreeNode $root, int $targetSum): bool
    {
        if($root === null) {
            return false;
        }

        if($root->left === null && $root->right === null) {
            return $targetSum === $root->val;
        }

        $remaining = $targetSum - $root->val;

        return (
            $this->hasPathSum($root->left, $remaining) ||
            $this->hasPathSum($root->right, $remaining)
        );
    }
}
