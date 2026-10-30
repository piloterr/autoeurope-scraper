// Auto Europe Result API – Node.js example (Node 18+, native fetch, ES module)
// Usage: PILOTERR_API_KEY=your-key node result.mjs

const params = new URLSearchParams({
  "offer_id": "3CD30DE2D9BE4CE8FC28E20D2702FCC7",
  "pickup": "CDG",
  "pickup_date": "2026-11-06",
  "dropoff_date": "2026-11-09",
});

const response = await fetch(`https://api.piloterr.com/v2/autoeurope/result?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY },
  signal: AbortSignal.timeout(60_000),
});

if (!response.ok) {
  console.error(`Piloterr error ${response.status}: ${await response.text()}`);
  process.exit(1);
}

console.log(JSON.stringify(await response.json(), null, 2));
