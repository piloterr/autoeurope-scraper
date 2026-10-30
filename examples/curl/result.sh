#!/usr/bin/env bash
# Auto Europe Result API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./result.sh
set -euo pipefail

curl -sS -G "https://api.piloterr.com/v2/autoeurope/result" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode offer_id=3CD30DE2D9BE4CE8FC28E20D2702FCC7 \
  --data-urlencode pickup=CDG \
  --data-urlencode pickup_date=2026-11-06 \
  --data-urlencode dropoff_date=2026-11-09
