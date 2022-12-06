package main

import (
    "io"
    "log"
    "net/http"
    "os"

    "github.com/mxk/go-flowrate/flowrate"
)

func main() {
    resp, err := http.Get("http://rails:8080")
    if err != nil {
        log.Fatalf("Get failed: %v", err)
    }
    defer resp.Body.Close()

    // Limit to 10 bytes per second
    wrappedIn := flowrate.NewReader(resp.Body, 500)

    // Copy to stdout
    _, err = io.Copy(os.Stdout, wrappedIn)
    if err != nil {
        log.Fatalf("Copy failed: %v", err)
    }
}