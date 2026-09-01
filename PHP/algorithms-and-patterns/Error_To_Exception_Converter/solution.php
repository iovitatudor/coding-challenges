<?php

declare(strict_types=1);

function runWithStrictErrors(callable $callback): mixed
{
    set_error_handler(function (int $errno, string $errStr, string $errFile, int $errLine) {
        if (!error_reporting() && $errno) {
            return;
        }

        throw new \ErrorException($errStr, 0, $errno, $errFile, $errLine);
    });

    try {
        return $callback();
    } finally {
        restore_error_handler();
    }
}

$validCallback = fn() => 10 + 20;
$warningCallback = fn() => $undefinedVar + 5; // Triggers E_WARNING / E_NOTICE

runWithStrictErrors($validCallback); // Returns 30

try {
    runWithStrictErrors($warningCallback);
} catch (ErrorException $e) {
    echo $e->getMessage(); // Trapped as ErrorException!
}
