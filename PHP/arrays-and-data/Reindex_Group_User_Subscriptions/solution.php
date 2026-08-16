<?php
declare(strict_types=1);

$subscriptions = [
    ['id' => 1, 'user_id' => 101, 'plan_name' => 'Basic', 'amount' => 10, 'status' => 'active'],
    ['id' => 2, 'user_id' => 102, 'plan_name' => 'Pro', 'amount' => 30, 'status' => 'canceled'],
    ['id' => 3, 'user_id' => 101, 'plan_name' => 'Pro', 'amount' => 85, 'status' => 'active'],
    ['id' => 4, 'user_id' => 103, 'plan_name' => 'Basic', 'amount' => 10, 'status' => 'active'],
    ['id' => 5, 'user_id' => 101, 'plan_name' => 'VIP', 'amount' => 50, 'status' => 'active'],
    ['id' => 6, 'user_id' => 102, 'plan_name' => 'Basic', 'amount' => 12, 'status' => 'active'],
];

function groupSubscriptionsByUser(array $subscriptions): array
{
    $groupedSubscriptions = [];

    foreach ($subscriptions as $subscription) {
        if ($subscription['status'] === 'active') {
            $groupedSubscriptions[$subscription['user_id']][] = [
                'plan_name' => $subscription['plan_name'],
                'amount' => $subscription['amount'],
                'status' => $subscription['status']
            ];
        }
    }

    foreach ($groupedSubscriptions as &$userSubscriptions) {
        uasort($userSubscriptions, fn($a, $b) => $a['amount'] <=> $b['amount']);
    }

    return $groupedSubscriptions;
}

$subscriptions = groupSubscriptionsByUser($subscriptions);

print_r($subscriptions);
