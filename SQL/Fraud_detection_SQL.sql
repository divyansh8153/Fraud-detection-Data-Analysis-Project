SELECT * FROM Fraud_detection_data

-- 1. Count of fraud data and normal data

SELECT A.Fraud_Label, COUNT(*) FROM Fraud_detection_data AS A
GROUP BY A.Fraud_Label

--2. Risky transaction in each transaction type

SELECT A.Transaction_Type, COUNT(*) AS Num_Fraud FROM Fraud_detection_data AS A
WHERE A.Fraud_Label = 'Fraud'
GROUP BY A.Transaction_Type


--3. How much Transaction from international (Yes : 1, No : 0)

SELECT A.Is_International_Transaction, COUNT(*) Num_transaction FROM Fraud_detection_data AS A
WHERE A.Fraud_Label = 'Fraud'
GROUP BY A.Is_International_Transaction

--4. Count of fraud by distance category

SELECT Distance_Category, COUNT(*) AS Fraud_count
FROM (
SELECT
      CASE
          WHEN A.Distance_From_Home > 50 THEN 'Far'
          ELSE 'Near'
      END AS Distance_Category
FROM Fraud_detection_data AS A
WHERE A.Fraud_Label = 'Fraud'
) AS sub
GROUP BY Distance_Category;
