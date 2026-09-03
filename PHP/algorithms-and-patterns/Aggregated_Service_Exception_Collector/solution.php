<?php

declare(strict_types=1);

class AggregateException extends Exception
{
    public function __construct(
        string        $message,
        private array $results,
        private array $errors
    )
    {
        parent::__construct($message);
    }

    public function getResults(): array
    {
        return $this->results;
    }

    public function getErrors(): array
    {
        return $this->errors;
    }
}

function executeParallelTasks(array $tasks): array
{
    $results = [];
    $errors = [];

    foreach ($tasks as $key => $task) {
        try {
            $results[$key] = $task();
        } catch (\Throwable $e) {
            $errors[$key] = $e;
        }
    }

    if (!empty($errors)) {
        $errorsCount = count($errors);
        throw new AggregateException(
            "Batch execution completed with {$errorsCount} error(s)",
            $results,
            $errors
        );
    }

    return $results;
}

$tasks = [
    'fetch_user' => fn() => ['id' => 42, 'name' => 'Alice'],
    'fetch_stats' => function () {
        throw new RuntimeException("Stats service offline");
    },
    'fetch_logs' => function () {
        throw new Exception("Log storage unreachable");
    },
];

try {
    $results = executeParallelTasks($tasks);
} catch (AggregateException $e) {
    echo $e->getMessage() . PHP_EOL;
    print_r(array_keys($e->getResults()));
    print_r(array_keys($e->getErrors()));
}
