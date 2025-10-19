# Travel Itinerary & Pricing Assistant - Database

This repository contains the MySQL database schema and seed data for the Travel Itinerary & Pricing Assistant system.

## Database Schema

The database includes the following core tables:

### Core Data Tables
- **`cities`** - Destination cities with country codes and currencies
- **`seasons`** - Travel seasons for each city
- **`lodging_classes`** - Accommodation types

### Pricing Tables
- **`rate_table`** - Base nightly rates by city, season, and lodging class
- **`fx_snapshots`** - Historical foreign exchange rates
- **`taxes_fees`** - City-specific taxes and fees
- **`promos`** - Discount codes and promotional offers

### Quote Management Tables
- **`quotes`** - Generated pricing quotes
- **`quote_segments`** - Individual trip segments within quotes
- **`quote_fx_used`** - Exchange rates used in quotes
- **`quote_taxes_applied`** - Taxes and fees applied to quotes

## Quick Start

### Installation

1. **Clone and navigate to the database directory:**
   ```bash
   cd Database
   ```

2. **Set environment variables (optional, uses default values otherwise):**
   ```bash
   export DB_USER=your_username
   export DB_PASSWORD=your_password
   export DB_HOST=localhost
   export DB_PORT=3306
   ```

3. **Run the setup script:**
   ```bash
   ./load.sh
   ```

## Sample Data

The database includes realistic seed data for:

### Cities (6 destinations)
- New York (USD)
- London (GBP)
- Paris (EUR)
- Tokyo (JPY)
- Sydney (AUD)
- Rome (EUR)

### Seasons
Each city has 3-4 seasons defined:
- **Peak**: High-demand periods 
- **Shoulder**: Moderate-demand periods 
- **Off**: Low-demand periods

### Lodging Classes
- **HOSTEL**: Budget accommodation with shared facilities
- **STANDARD**: Mid-range hotels with private rooms
- **PREMIUM**: Luxury hotels with premium amenities

### Rate Table
Comprehensive pricing matrix with realistic rates:
- NYC: $25-$450/night depending on season and class
- London: $20-$400/night
- Paris: $22-$380/night
- Tokyo: $20-$320/night
- Sydney: $30-$500/night
- Rome: $20-$330/night

### Foreign Exchange
Historical USD exchange rates for:
- EUR, GBP, JPY, AUD
- Monthly snapshots for 2024
- Bidirectional rates

### Taxes & Fees
City-specific taxes and fees:
- NYC: 14.75% + $3.50/night
- London: 20% VAT
- Paris: 10% + €2.50/night
- Tokyo: 10% consumption tax
- Sydney: 10% GST
- Rome: 10% + €7/night

### Promotions
Demo discount codes:
- **WELCOME10**: 10% off first booking
- **EARLYBIRD15**: 15% off advance bookings
- **SUMMER20**: 20% off summer travel
- **SAVE25**: $25 off bookings over $200
- **LONGSTAY100**: $100 off long stays

## Database Configuration

### Connection Details
- **Database**: `travel_pricing`
- **Default Host**: `localhost:3306`
- **Default User**: `root`

### Environment Variables
```bash
DB_USER=your_username
DB_PASSWORD=your_password
DB_HOST=your_host
DB_PORT=your_port
```