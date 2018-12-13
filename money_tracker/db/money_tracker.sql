DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 primary key,
  type VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 primary key,
  transction_date DATE,
  amount INT8,
  merchant_id INT8 REFERENCES merchants(id),
  tag_id INT8 REFERENCES tags(id)
);
