<?php
declare(strict_types=1);

function isRateLimited(array $requests, string $clientIp, int $limit, int $windowSeconds, int $now): bool
{
    $requestsCount = 0;

    foreach ($requests as $request) {
        if ($request['ip'] === $clientIp) {
            if ($request['timestamp'] > $now - $windowSeconds && $request['timestamp'] <= $now) {
                $requestsCount++;
            }
        }
    }

    return $requestsCount >= $limit;
}

$requests = [
    ['ip' => '192.168.1.1', 'timestamp' => 1700000000],
    ['ip' => '192.168.1.1', 'timestamp' => 1700000020],
    ['ip' => '192.168.1.1', 'timestamp' => 1700000050],
    ['ip' => '10.0.0.1', 'timestamp' => 1700000055],
];

$limit = 3;
$windowSeconds = 60;
$now = 1700000058;

var_dump(isRateLimited($requests, '192.168.1.1', $limit, $windowSeconds, $now)); // true
var_dump(isRateLimited($requests, '10.0.0.1', $limit, $windowSeconds, $now)); // false
