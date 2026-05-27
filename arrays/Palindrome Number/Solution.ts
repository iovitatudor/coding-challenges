function isPalindrome(x: number): boolean  {
    if(x < 0) return false;

    const numbersArray: number[] = x.toString().split('').map(Number);
    const arrayLength = numbersArray.length - 1;

    for(let i = 0; i <= arrayLength / 2; i++) {
        if(numbersArray[i] !== numbersArray[arrayLength - i]) {
            return false;
        }
    }

    return true;
}
