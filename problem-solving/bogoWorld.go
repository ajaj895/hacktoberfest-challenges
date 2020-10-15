package main

import (
	"fmt"
	"math/rand"
	"os"
	"strconv"
	"time"
)

const aToZCharSet = "abcdefghijklmnopqrstuvwxyz "
const desiredString = "hello world"

/**
 *	Randomly generates the string "hello world" using -t threads. Default threads is 4.
 *  Possibility of generating the string is 1/27^11 or 1.798865092451430e-16
 */
func main() {
	start := time.Now()
	// remove program name from args
	args := os.Args[1:]

	// scan args for valid arguments
	threads := 4
	var err error
	for i := 0; i < len(args); i++ {
		arg := args[i]
		switch {
		case arg == "-t":
			if len(args) > 0 {
				i += 1
				threads, err = strconv.Atoi(args[i])
				if err != nil {
					panic("-t argument requires an integer")
				}
			} else {
				panic("-t argument requires an integer")
			}
		default:
			// ignore bad arguments
			continue
		}
	}

	// start threads number of goroutines to try randomly generating hello world
	helloWorldChan := make(chan string)
	for i := 0; i < threads; i++ {
		go func() {
			var seededRand = rand.New(rand.NewSource(time.Now().UnixNano()))
			for {
				select {
				case <- helloWorldChan:
					return
				default:
					tryHelloWorld := randomString(len(desiredString), seededRand)
					if tryHelloWorld == desiredString {
						helloWorldChan <- tryHelloWorld
					}
				}
			}
		}()
	}
	// block until the string is generated
	fmt.Printf("%s\n", <-helloWorldChan)
	fmt.Printf("Finished in %d seconds\n", time.Now().Second() - start.Second())
}

// generate a random string with the given length and random number generator
func randomString(length int, rand *rand.Rand) string {
	randStr := make([]byte, length)

	for i := range randStr {
		randStr[i] = aToZCharSet[rand.Intn(len(aToZCharSet))]
	}

	return string(randStr)
}
