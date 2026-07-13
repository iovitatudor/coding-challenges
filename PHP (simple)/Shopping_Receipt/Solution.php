<?php
$item = trim(fgets(STDIN));
$price = floatval(trim(fgets(STDIN)));
$quantity = intval(trim(fgets(STDIN)));

$total = $price * $quantity;

echo "Item: ". $item . "\n";
echo "Price: $". number_format($price, 2) . "\n";
echo "Quantity: ". $quantity . "\n";
echo "Total: $". number_format($total, 2) . "\n";
