package main

import (
    "io"
    "log"
    "net/http"
    "os"

    "github.com/mxk/go-flowrate/flowrate"
)

func main() {
    resp, err := http.Get("http://google.com")
    if err != nil {
        log.Fatalf("Get failed: %v", err)
    }
    defer resp.Body.Close()

    // Limit to 10 bytes per second
    wrappedIn := flowrate.NewReader(resp.Body, 10)

    // Copy to stdout
    _, err = io.Copy(os.Stdout, wrappedIn)
    if err != nil {
        log.Fatalf("Copy failed: %v", err)
    }
}