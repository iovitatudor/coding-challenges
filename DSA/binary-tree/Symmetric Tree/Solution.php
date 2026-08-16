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
     * @return Boolean
     */
    function isSymmetric(TreeNode $root): bool
    {
        return $this->isMirror($root->left, $root->right);
    }

    /**
     * @param TreeNode $left
     * @param TreeNode $right
     * @return Boolean
     */
    function isMirror(TreeNode $left, TreeNode $right): bool
    {
        if($left === null && $right === null) {
            return true;
        }

        if($left === null || $right === null) {
            return false;
        }

        if($left->val !== $right->val) {
            return false;
        }

        return $this->isMirror($left->left, $right->right) && $this->isMirror($left->right, $right->left);
    }
}
