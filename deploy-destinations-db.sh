#!/bin/bash

set -e

DB_HOST="${DB_HOST:-34.55.101.72}"
DB_USER="${DB_USER:-root}"
DB_NAME="destinations_db"

echo "Deploying destinations_db to ${DB_HOST}..."
echo "WARNING: This will DROP and RECREATE the database!"
echo ""

# Drop and create database
echo "Creating database..."
mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} <<EOF
DROP DATABASE IF EXISTS ${DB_NAME};
CREATE DATABASE ${DB_NAME};
EOF

# Load schema
echo "Loading schema..."
mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} < destinations_schema.sql

# Load seed data
echo "Loading seed data..."
mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} < destinations_seed.sql

echo "✓ destinations_db deployed successfully!"
echo "Verify: mysql -h ${DB_HOST} -u destinations_user -p -e 'USE ${DB_NAME}; SELECT COUNT(*) FROM cities;'"
