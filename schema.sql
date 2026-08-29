-- Drop tables if they already exist (clean slate)
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS users;

-- 1. USERS TABLE: Tracks demographics and acquisition details
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    signup_date TIMESTAMP NOT NULL,
    age_group VARCHAR(20) NOT NULL,          -- e.g., '18-24', '25-34', '35-50', '50+'
    acquisition_channel VARCHAR(50) NOT NULL, -- e.g., 'Organic Web', 'App Store', 'Ecosystem Bundle'
    region VARCHAR(50) NOT NULL               -- e.g., 'North America', 'Europe', 'Asia'
);

-- 2. SUBSCRIPTIONS TABLE: Tracks free vs. paid tier adoption and timing
CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    tier_type VARCHAR(20) NOT NULL,          -- 'Free', 'AI Pro', 'AI Ultra'
    start_date TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL              -- 'Active', 'Cancelled', 'Upgraded'
);

-- 3. TRANSACTIONS TABLE: Tracks monetization and revenue over time
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    amount NUMERIC(10, 2) NOT NULL,          -- Dollar amount of the subscription or add-on
    timestamp TIMESTAMP NOT NULL
);
