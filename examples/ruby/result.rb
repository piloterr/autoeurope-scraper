# Auto Europe Result API – Ruby example (stdlib only)
# Usage: PILOTERR_API_KEY=your-key ruby result.rb
require "json"
require "net/http"
require "uri"

uri = URI("https://api.piloterr.com/v2/autoeurope/result")
uri.query = URI.encode_www_form('offer_id' => '3CD30DE2D9BE4CE8FC28E20D2702FCC7', 'pickup' => 'CDG', 'pickup_date' => '2026-11-06', 'dropoff_date' => '2026-11-09')

request = Net::HTTP::Get.new(uri)
request["x-api-key"] = ENV.fetch("PILOTERR_API_KEY")

response = Net::HTTP.start(uri.host, uri.port, use_ssl: true, read_timeout: 60) do |http|
  http.request(request)
end

abort "Piloterr error #{response.code}: #{response.body}" unless response.is_a?(Net::HTTPSuccess)

puts JSON.pretty_generate(JSON.parse(response.body))
