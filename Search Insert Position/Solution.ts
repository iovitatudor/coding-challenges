function searchInsert(nums: number[], target: number): number {
    let left = 0;
    let right = nums.length - 1;

    while(left <= right) {
        let middle = Math.floor((right + left) / 2);

        if(nums[middle] === target) {
            return middle;
        }

        if(nums[middle] < target) {
            left = middle + 1;
        }

        if(nums[middle] > target) {
            right = middle - 1;
        }
    }
    return left;
};

const output = searchInsert([1,2,3,4], 5);
console.log(output);
