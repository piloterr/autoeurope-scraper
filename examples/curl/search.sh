#!/usr/bin/env bash
# Auto Europe Search API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./search.sh
set -euo pipefail

curl -sS -G "https://api.piloterr.com/v2/autoeurope/search" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode pickup=CDG \
  --data-urlencode pickup_date=2026-11-06 \
  --data-urlencode dropoff_date=2026-11-09
