<?php
$sentence = trim(fgets(STDIN));

function getLongestWord(string $sentence): string {
    $wordsArray = explode(' ', $sentence);
    $result = $wordsArray[0];

    foreach($wordsArray as $word){
        if(strlen($result) < strlen($word)){
            $result = $word;
        }
    }

    return $result;
}

echo getLongestWord($sentence);
