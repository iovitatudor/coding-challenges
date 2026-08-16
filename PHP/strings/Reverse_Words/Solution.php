<?php
$sentence = trim(fgets(STDIN));

// Reverse the words and print
$sentenceArray = explode(' ', $sentence);
$reversedArray = array_reverse($sentenceArray);
echo implode(' ', $reversedArray);

//for($i = count($sentenceArray) - 1; $i >= 0; $i--){
//	echo $sentenceArray[$i] . ' ';
//};

