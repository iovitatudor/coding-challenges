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
     * @return Integer
     */
    function minDepth(TreeNode $root): int
    {
        if($root === null) {
            return 0;
        }

        $left = $this->minDepth($root->left);
        $right = $this->minDepth($root->right);

        if($root->left === null) {
            return 1 + $right;
        }

        if($root->right === null) {
            return 1 + $left;
        }

        return 1 + min($left, $right);
    }
}
