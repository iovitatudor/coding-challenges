<?php

declare(strict_types=1);

$time = "2026-08-30 18:30:00";
$tz1 = "Europe/Chisinau"; // UTC+3 during DST
$tz2 = "America/New_York"; // UTC-4 during DST


function normalizeToUtc(string $localTimeStr, string $sourceTimeZone): string
{
    $allZones = DateTimeZone::listIdentifiers();

    if (!in_array($sourceTimeZone, $allZones, true)) {
        throw new \InvalidArgumentException;
    }

    $date = new \DateTimeImmutable($localTimeStr, new \DateTimeZone($sourceTimeZone));

    $dateUTC = $date->setTimeZone(new \DateTimeZone('UTC'));

    return $dateUTC->format('Y-m-d\TH:i:s\Z');
}


echo normalizeToUtc($time, $tz1); // "2026-08-30T15:30:00Z"
echo normalizeToUtc($time, $tz2); // "2026-08-30T22:30:00Z"
