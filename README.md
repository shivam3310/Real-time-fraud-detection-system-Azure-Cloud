# Real-time fraud detection system using Azure Event Hub and Stream Analytics

## Project Objective
Implement a real-time fraud detection system for banking transactions using Azure Event Hub and Stream Analytics. Detect fraudulent transactions based on various business rules.

## Data Format
Sample Transaction Data:
- Transaction ID: 123456789
- Timestamp: 2023-06-15 09:30:12
- Customer ID: 987654321
- Transaction Type: Purchase
- Amount: $500.00
- Merchant: XYZ Electronics

## Workflow


![azureStream](https://github.com/shivam3310/Real-time-fraud-detection-system-Azure-Cloud/assets/54907699/f6535515-b202-4c2f-93e0-a473b4cfe853)



### 1. Setting up Azure Event Hub
- Add an Event Hub resource in the Azure portal.
- Create a new Event Hub and configure settings like the number of partitions and partition key.

### 2. Getting Real-Time Data from Logic Apps into Event Hub
- Add a Logic Apps resource in the Azure portal.
- Configure a Logic App with a trigger to generate transactions.
- Use a Loop action to generate multiple transactions.
- Use the Compose action within the loop to create transactions in the desired format.
- Send the generated transaction data to Azure Event Hub using the Event Hubs connector.

### 3. Setting up Azure Stream Analytics and SQL DB
- Add a Stream Analytics resource in the Azure portal.
- Configure Stream Analytics to perform SQL-like operations on the data.
- Define output bindings for Azure SQL Database to store results.
- Create output bindings for both "NormalSQLTable" and "FraudSQLTable".

### 4. Computations
- Detect fraudulent transactions using various methods.
- Calculate z-scores to find transactions with amounts significantly deviating from the mean.
- Perform k-means clustering to identify anomalies in the transaction data.
- Detect transactions with an unusually high transaction rate from a customer.

## Note
- The amount of data generated depends on the number of throughput units defined in Event Hub.
- Azure Stream Analytics doesn't support internal orchestration, but you can output data to Power BI in real-time to set alerts for detected fraud.

## Conclusion
This project showcases how to implement a real-time fraud detection system for banking transactions using Azure Event Hub and Stream Analytics. By leveraging these Azure services, you can detect and prevent fraudulent activities in real-time.
