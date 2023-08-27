-- Detect transactions with an unusually high transaction rate from a customer
WITH TransactionCounts AS (
    SELECT
        CustomerID,
        COUNT(*) AS TransactionCount
    FROM
        InputEventHub
    GROUP BY
        CustomerID,
        TumblingWindow(second, 10) -- Calculate transaction count every 10 seconds
)

SELECT
    t.TransactionID,
    t.Timestamp,
    t.CustomerID,
    t.TransactionType,
    t.Amount,
    t.Merchant,
    CASE
        WHEN tc.TransactionCount > 100 THEN 'Fraud'
        ELSE 'Normal'
    END AS DetectionResult
INTO
    OutputEventHub
FROM
    InputEventHub t
JOIN
    TransactionCounts tc
ON
    t.CustomerID = tc.CustomerID;

