// Auto Europe Result API – Go example
// Usage: PILOTERR_API_KEY=your-key go run result.go
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"time"
)

func main() {
	params := url.Values{}
	params.Set("offer_id", "3CD30DE2D9BE4CE8FC28E20D2702FCC7")
	params.Set("pickup", "CDG")
	params.Set("pickup_date", "2026-11-06")
	params.Set("dropoff_date", "2026-11-09")

	req, _ := http.NewRequest("GET", "https://api.piloterr.com/v2/autoeurope/result?"+params.Encode(), nil)
	req.Header.Set("x-api-key", os.Getenv("PILOTERR_API_KEY"))

	client := &http.Client{Timeout: 60 * time.Second}
	resp, err := client.Do(req)
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()

	body, _ := io.ReadAll(resp.Body)
	if resp.StatusCode != http.StatusOK {
		fmt.Fprintf(os.Stderr, "Piloterr error %d: %s\n", resp.StatusCode, body)
		os.Exit(1)
	}

	var pretty bytes.Buffer
	json.Indent(&pretty, body, "", "  ")
	fmt.Println(pretty.String())
}
