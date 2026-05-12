function longestCommonPrefix(strs: string[]): string {
    if(strs.length === 0) return "";

    let result = strs[0];

    for(let i = 1; i < strs.length; i++) {
        while(strs[i].indexOf(result) !== 0) {
            result = result.slice(0, -1);
        }
    }

    return result;
}
