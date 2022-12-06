package request

import (
	"bufio"
	"log"
	"fmt"
	"time"
	"net/http"

	// "github.com/mxk/go-flowrate/flowrate"
)

func Request(byte_per_seconds int64, url string) {
	resp, err := http.Get(url)
	if err != nil {
			log.Fatalf("Get failed: %v", err)
	}

	defer resp.Body.Close()

	// wrappedIn := flowrate.NewReader(resp.Body, byte_per_seconds)

	scanner := bufio.NewScanner(resp.Body)
	for i := 0; scanner.Scan() && i < 5; i++ {
			time.Sleep(time.Millisecond * 2000)
			fmt.Println(scanner.Text())
	}
	if err := scanner.Err(); err != nil {
			panic(err)
	}

	
}