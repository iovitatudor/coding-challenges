function lengthOfLastWord(s: string): number {
    const trimmedText: string = s.trim();
    const inputArray: string[] = trimmedText.split(' ');
    const lastWord: string = inputArray[inputArray.length - 1];

    return lastWord.length;
}

const solution = lengthOfLastWord('   fly me   to   the moon  ');
console.log(solution);
