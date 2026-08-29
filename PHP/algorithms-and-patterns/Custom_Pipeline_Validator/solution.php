<?php
declare(strict_types=1);

$data = [
    ['name' => 'Alice', 'age' => 25, 'role' => 'admin'],
    ['name' => 'Bob', 'age' => 17, 'role' => 'user'],
    ['name' => 'Charlie', 'age' => 30, 'role' => 'user'],
    ['name' => '', 'age' => 22, 'role' => 'admin'],
];

$rules = [
    fn(array $item): bool => !empty($item['name']),
    fn(array $item): bool => $item['age'] >= 18,
];

function validateData(array $data, array $rules): array
{
    return array_filter($data, function ($item) use ($rules) {
        foreach ($rules as $rule) {
            if (!$rule($item)) {
                return false;
            }
        }
        return true;
    });
}


$result = validateData($data, $rules);

print_r($result);
