#!/bin/bash

set -e
psql -U ${POSTGRES_USER} -d kakeibo_db -v POSTGRES_APP_USER=${POSTGRES_APP_USER} -v POSTGRES_APP_PASSWORD=\'${POSTGRES_APP_PASSWORD}\'<< EOS
CREATE ROLE :POSTGRES_APP_USER WITH LOGIN PASSWORD :POSTGRES_APP_PASSWORD;
CREATE TABLE Income_table(
    income_id                   SERIAL PRIMARY KEY,
    register_input_date         DATE,
    basic_salary                INTEGER,
    special_subsidy             INTEGER,
    overtime_payment            INTEGER,
    housing_subsidy             INTEGER,
    transportation_expenses     INTEGER,
    bonus                       INTEGER,
    esop_suport_fee             INTEGER,
    refund                      INTEGER
);
GRANT SELECT, INSERT, UPDATE, DELETE ON Income_table To :POSTGRES_APP_USER;
EOS