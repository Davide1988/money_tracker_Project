DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;
DROP TABLE budgets;

CREATE TABLE merchants(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 primary key,
  type VARCHAR(255)
);

CREATE TABLE budgets(
  id SERIAL8 primary key,
  budget_amount FLOAT
);

CREATE TABLE transactions(
  id SERIAL8 primary key,
  transaction_date DATE,
  amount FLOAT,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE
);
