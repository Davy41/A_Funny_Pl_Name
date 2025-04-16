DROP TABLE student_scores CASCADE CONSTRAINTS;

CREATE TABLE student_scores (
  id NUMBER PRIMARY KEY,
  student_name VARCHAR2(50),
  class VARCHAR2(10),
  score NUMBER,
  test_date DATE
);

INSERT INTO student_scores VALUES (1, 'Alice', 'A', 85, TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO student_scores VALUES (2, 'Bob', 'A', 90, TO_DATE('2024-01-12', 'YYYY-MM-DD'));
INSERT INTO student_scores VALUES (3, 'Charlie', 'A', 80, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO student_scores VALUES (4, 'David', 'B', 88, TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO student_scores VALUES (5, 'Eva', 'B', 92, TO_DATE('2024-01-13', 'YYYY-MM-DD'));
INSERT INTO student_scores VALUES (6, 'Frank', 'B', 85, TO_DATE('2024-01-17', 'YYYY-MM-DD'));
INSERT INTO student_scores VALUES (7, 'Grace', 'C', 90, TO_DATE('2024-01-11', 'YYYY-MM-DD'));
INSERT INTO student_scores VALUES (8, 'Henry', 'C', 95, TO_DATE('2024-01-13', 'YYYY-MM-DD'));

COMMIT;

SELECT 
  student_name,
  class,
  score,
  test_date,
  LAG(score) OVER (ORDER BY test_date) AS previous_score,
  LEAD(score) OVER (ORDER BY test_date) AS next_score,
  CASE 
    WHEN score > LAG(score) OVER (ORDER BY test_date) THEN 'HIGHER'
    WHEN score < LAG(score) OVER (ORDER BY test_date) THEN 'LOWER'
    WHEN score = LAG(score) OVER (ORDER BY test_date) THEN 'EQUAL'
    ELSE 'N/A' 
  END AS compare_with_prev
FROM student_scores
ORDER BY test_date;
SELECT 
  student_name,
  class,
  score,
  RANK() OVER (PARTITION BY class ORDER BY score DESC) AS rank_in_class,
  DENSE_RANK() OVER (PARTITION BY class ORDER BY score DESC) AS dense_rank_in_class
FROM student_scores
ORDER BY class, score DESC;
SELECT 
  student_name,
  class,
  score,
  rank_in_class
FROM (
  SELECT 
    student_name,
    class,
    score,
    RANK() OVER (PARTITION BY class ORDER BY score DESC) AS rank_in_class
  FROM student_scores
)
WHERE rank_in_class <= 3
ORDER BY class, rank_in_class;

SELECT 
  student_name,
  class,
  score,
  test_date,
  row_num
FROM (
  SELECT 
    student_name,
    class,
    score,
    test_date,
    ROW_NUMBER() OVER (PARTITION BY class ORDER BY test_date) AS row_num
  FROM student_scores
)
WHERE row_num <= 2
ORDER BY class, row_num;

SELECT 
  student_name,
  class,
  score,
  MAX(score) OVER (PARTITION BY class) AS max_score_in_class,
  MAX(score) OVER () AS overall_max_score
FROM student_scores
ORDER BY class, score;




