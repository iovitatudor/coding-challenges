function longestCommonPrefix(strs) {
    if (strs.length === 0)
        return "";
    var result = strs[0];
    for (var i = 1; i < strs.length; i++) {
        while (strs[i].indexOf(result) !== 0) {
            result = result.slice(0, -1);
        }
    }
    return result;
}
var output = longestCommonPrefix(["flower", "flow", "flight"]);
console.log(output);
