#!/bin/bash

set -e

DB_NAME="${DB_NAME:-pricing_db}"
DB_USER="${DB_USER:-root}"
DB_PASSWORD="${DB_PASSWORD:-}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-3306}"

if ! command -v mysql &> /dev/null; then
    echo "ERROR: MySQL client not found. Please install MySQL client."
    exit 1
fi

MYSQL_CMD="mysql -h${DB_HOST} -P${DB_PORT} -u${DB_USER}"
if [ -n "$DB_PASSWORD" ]; then
    MYSQL_CMD="${MYSQL_CMD} -p${DB_PASSWORD}"
fi

echo "Dropping existing database if it exists..."
$MYSQL_CMD -e "DROP DATABASE IF EXISTS ${DB_NAME};"

echo "Creating database: ${DB_NAME}"
$MYSQL_CMD -e "CREATE DATABASE ${DB_NAME};"

echo "Creating schema..."
$MYSQL_CMD ${DB_NAME} < pricing_schema.sql

echo "Loading seed data..."
$MYSQL_CMD ${DB_NAME} < pricing_seed.sql

echo ""
echo "Database Summary:"
$MYSQL_CMD ${DB_NAME} -e "
SELECT 'lodging_classes' as table_name, COUNT(*) as record_count FROM lodging_classes
UNION ALL
SELECT 'rate_table', COUNT(*) FROM rate_table
UNION ALL
SELECT 'fx_snapshots', COUNT(*) FROM fx_snapshots
UNION ALL
SELECT 'taxes_fees', COUNT(*) FROM taxes_fees
UNION ALL
SELECT 'promos', COUNT(*) FROM promos
UNION ALL
SELECT 'quotes', COUNT(*) FROM quotes;
"

echo ""
echo "Connection details:"
echo "  Host: ${DB_HOST}:${DB_PORT}"
echo "  Database: ${DB_NAME}"
echo "  User: ${DB_USER}"
echo ""
echo "Pricing Database is ready for use!"
