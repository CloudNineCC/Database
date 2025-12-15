#!/bin/bash

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <database_name> <migration_file>"
  echo "Example: $0 destinations_db migrations/001_add_column.sql"
  exit 1
fi

DB_NAME=$1
MIGRATION_FILE=$2
BACKUP_FILE="${DB_NAME}_backup_$(date +%Y%m%d_%H%M%S).sql"

DB_HOST="${DB_HOST:-localhost}"
DB_USER="${DB_USER:-root}"

echo "Database Migration Tool"
echo "======================="
echo "Database: ${DB_NAME}"
echo "Migration: ${MIGRATION_FILE}"
echo "Host: ${DB_HOST}"
echo ""

# Create backup
echo "Creating backup: ${BACKUP_FILE}..."
mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > ${BACKUP_FILE}
echo "✓ Backup created"

# Run migration
echo "Running migration..."
mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} < ${MIGRATION_FILE}
echo "✓ Migration completed successfully"

echo ""
echo "Backup saved to: ${BACKUP_FILE}"
echo "To rollback: mysql -h ${DB_HOST} -u ${DB_USER} -p ${DB_NAME} < ${BACKUP_FILE}"
