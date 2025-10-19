#!/bin/bash

set -e

DB_NAME="travel_pricing"
DB_USER="${DB_USER:-root}"
DB_PASSWORD="${DB_PASSWORD:-}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-3306}"

echo "Starting Travel Pricing Database Setup"
echo "======================================"

if ! command -v mysql &> /dev/null; then
    echo "MySQL client not found. Please install MySQL client."
    exit 1
fi

MYSQL_CMD="mysql -h${DB_HOST} -P${DB_PORT} -u${DB_USER}"
if [ -n "$DB_PASSWORD" ]; then
    MYSQL_CMD="${MYSQL_CMD} -p${DB_PASSWORD}"
fi

echo "Creating database: ${DB_NAME}"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

echo "Creating schema..."
$MYSQL_CMD ${DB_NAME} < schema.sql

echo "Loading cities data..."
$MYSQL_CMD ${DB_NAME} < seed_cities.sql

echo "Loading seasons data..."
$MYSQL_CMD ${DB_NAME} < seed_seasons.sql

echo "Loading lodging classes..."
$MYSQL_CMD ${DB_NAME} < seed_lodging_classes.sql

echo "Loading rate table..."
$MYSQL_CMD ${DB_NAME} < seed_rates.sql

echo "Loading taxes and fees..."
$MYSQL_CMD ${DB_NAME} < seed_taxes_fees.sql

echo "Loading foreign exchange rates..."
$MYSQL_CMD ${DB_NAME} < seed_fx_snapshots.sql

echo "Loading promotions..."
$MYSQL_CMD ${DB_NAME} < seed_promos.sql

echo "Database setup completed successfully!"
echo "======================================"

echo "Database Summary:"
$MYSQL_CMD ${DB_NAME} -e "
SELECT 'Cities' as table_name, COUNT(*) as record_count FROM cities
UNION ALL
SELECT 'Seasons', COUNT(*) FROM seasons
UNION ALL
SELECT 'Lodging Classes', COUNT(*) FROM lodging_classes
UNION ALL
SELECT 'Rate Table', COUNT(*) FROM rate_table
UNION ALL
SELECT 'Taxes & Fees', COUNT(*) FROM taxes_fees
UNION ALL
SELECT 'FX Snapshots', COUNT(*) FROM fx_snapshots
UNION ALL
SELECT 'Promotions', COUNT(*) FROM promos;
"

echo "Travel Pricing Database is ready for use!"
echo ""
echo "Connection details:"
echo "  Host: ${DB_HOST}:${DB_PORT}"
echo "  Database: ${DB_NAME}"
echo "  User: ${DB_USER}"