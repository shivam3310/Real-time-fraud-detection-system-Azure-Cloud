-- Detect transactions with amounts deviating significantly from the mean (z-score)
WITH TransactionStats AS (
    SELECT
        AVG(Amount) AS MeanAmount,
        STDEV(Amount) AS StdDevAmount
    FROM
        InputEventHub
    WHERE
        DATEDIFF(minute, TIMESTAMP, GETUTCDATE()) <= 10 -- Calculate statistics for the last 10 minutes
)

SELECT
    t.TransactionID,
    t.Timestamp,
    t.CustomerID,
    t.TransactionType,
    t.Amount,
    t.Merchant,
    CASE
        WHEN (t.Amount - ts.MeanAmount) / ts.StdDevAmount > 3 THEN 'Fraud'
        ELSE 'Normal'
    END AS DetectionResult
INTO
    OutputEventHub
FROM
    InputEventHub t
CROSS JOIN
    TransactionStats ts;
