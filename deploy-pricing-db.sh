#!/bin/bash

set -e

DB_HOST="${DB_HOST:-10.128.0.3}"
DB_USER="${DB_USER:-root}"
DB_NAME="pricing_db"

echo "Deploying pricing_db to ${DB_HOST}..."
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
mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} < pricing_schema.sql

# Load seed data
echo "Loading seed data..."
mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} < pricing_seed.sql

echo "✓ pricing_db deployed successfully!"
echo "Verify: mysql -h ${DB_HOST} -u pricing_user -p -e 'USE ${DB_NAME}; SELECT COUNT(*) FROM lodging_classes;'"
