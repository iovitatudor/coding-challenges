<?php

declare(strict_types=1);

class TransactionFailedException extends Exception
{
    public function __construct(
        string        $message,
        private array $completedContext,
        ?\Throwable   $previous = null
    )
    {
        parent::__construct($message, 0, $previous);
    }

    public function getCompletedContext(): array
    {
        return $this->completedContext;
    }
}

/**
 * @throws TransactionFailedException
 */
function safeTransaction(array $steps): array
{
    $context = [];
    $executedSteps = [];

    foreach ($steps as $step) {
        try {
            $result = $step['run']($context);
            if (is_array($result)) {
                $context = array_merge($context, $result);
            }
            $executedSteps[] = $step;
        } catch (\Throwable $e) {
            foreach (array_reverse($executedSteps) as $executedStep) {
                if (array_key_exists('rollback', $executedStep)) {
                    $executedStep['rollback']($context);
                }
            }
            throw new TransactionFailedException(
                "Transaction failed at step '{$step['name']}': {$e->getMessage()}",
                $context,
                $e
            );
        }
    }

    return $context;
}

$steps = [
    [
        'name' => 'create_user',
        'run' => fn($ctx) => ['user_id' => 101],
        'rollback' => fn($ctx) => print("Deleted user {$ctx['user_id']}\n")
    ],
    [
        'name' => 'charge_card',
        'run' => fn($ctx) => throw new RuntimeException("Card declined"),
        'rollback' => fn($ctx) => print("Refunded card\n")
    ]
];

try {
    $results = safeTransaction($steps);
} catch (TransactionFailedException $e) {
    echo $e->getMessage() . PHP_EOL;
    print_r($e->getCompletedContext());
}
