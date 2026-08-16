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
    function isBalanced(TreeNode $root): bool
    {
        return $this->checkHeight($root) !== -1;
    }

    /**
     * @param TreeNode $node
     * @return bool|int
     */
    function checkHeight(TreeNode $node): bool|int
    {
        if($node === null) {
            return 0;
        }

        $left = $this->checkHeight($node->left);

        if($left === -1) {
            return -1;
        }

        $right = $this->checkHeight($node->right);

        if($right === -1) {
            return -1;
        }

        if(abs($left - $right) > 1) {
            return -1;
        }

        return 1 + max($left, $right);
    }
}
