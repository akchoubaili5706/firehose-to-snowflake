use DATABASE MY_DEV_DB;
use role ACCOUNTADMIN;

-- create singe column table when `Data loading options` is set to `Use VARIANT columns`.
-- set Content column name: Event
CREATE OR REPLACE TABLE TELEMETRY_RAW (
    event VARIANT
);

-- Or use multiple columns table when `Data loading options` is set to `Use JSON keys as table column names`.
-- below table depicts the AWS sample test data
CREATE OR REPLACE TABLE TELEMETRY_RAW_COLUMNS (
    TICKER_SYMBOL VARCHAR,
    SECTOR VARCHAR,
    CHANGE NUMBER,
    PRICE NUMBER
);

-- below table depicts data coming in from AWS Gateway API -> AWS kinesis streams.
CREATE OR REPLACE TABLE TELEMETRY_RAW_KINESIS (
    aws_ga_api_requestId VARCHAR(50) ,
    aws_ga_api_requestTimeEpoch NUMBER,
    aws_ga_api_validated_flag VARCHAR(10) ,
    event_timestamp NUMBER,
    event_version NUMBER,
    event_type VARCHAR(20),
    event_id VARCHAR(50),
    event_data VARIANT
);