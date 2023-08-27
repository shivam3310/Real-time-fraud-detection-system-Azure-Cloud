-- Detect transactions outside of the normal cluster using k-means clustering
WITH Clusters AS (
    SELECT
        TransactionID,
        Timestamp,
        CustomerID,
        TransactionType,
        Amount,
        Merchant,
        CLUSTERINGKEY() OVER (ORDER BY Amount) AS ClusterID
    FROM
        InputEventHub
)

SELECT
    TransactionID,
    Timestamp,
    CustomerID,
    TransactionType,
    Amount,
    Merchant,
    CASE
        WHEN ClusterID != (SELECT ClusterID FROM Clusters WHERE TransactionID = '123456789') THEN 'Anomaly'
        ELSE 'Normal'
    END AS AnomalyResult
INTO
    OutputEventHub
FROM
    Clusters;
