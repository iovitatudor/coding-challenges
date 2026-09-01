<?php

declare(strict_types=1);

function withRetry(callable $operation, int $maxRetries): mixed
{
    $attempts = 0;
    $lastException = null;

    while ($attempts < $maxRetries) {
        try {
            return $operation();
        } catch (\Throwable $e) {
            $attempts++;
            $lastException = $e;
        }
    }

    throw new RuntimeException(
        "Operation failed after {$maxRetries} retries",
        0,
        $lastException
    );
}

$attempts = 0;
/**
 * @throws Exception
 */
$flakyService = function () use (&$attempts) {
    $attempts++;
    if ($attempts < 3) {
        throw new Exception("Connection timeout");
    }
    return "SUCCESS";
};

/**
 * @throws Exception
 */
$failingService = function () {
    throw new Exception("Database offline");
};

withRetry($flakyService, 3);
// Returns "SUCCESS" on 3rd attempt

try {
    withRetry($failingService, 2);
} catch (RuntimeException $e) {
    echo $e->getMessage();
    // "Operation failed after 2 retries"
    echo $e->getPrevious()->getMessage();
    // "Database offline"
}
