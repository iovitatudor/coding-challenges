function romanToInt(s: string): number {
    let result = 0;

    const numerals = new Map<string, number>();

    numerals.set("I", 1)
        .set("V", 5)
        .set("X", 10)
        .set("L", 50)
        .set("C", 100)
        .set("D", 500)
        .set("M", 1000);

    for(let i = 0; i < s.length; i++) {
        let current = numerals.get(s[i])!;
        let next = numerals.get(s[i + 1]) ?? 0;

        if(current < next) {
            result -= current;
        } else {
            result += current;
        }
    }

    return result;
};
