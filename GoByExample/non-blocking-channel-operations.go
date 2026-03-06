// https://gobyexample.com/non-blocking-channel-operations
// Basic send and receives on channels are blocking. 
// However, we an use select with a default clause to implement non-blocking sends, receives, and even non-blocking multi-way selects. 

package main 

import "fmt"

func main() {
	messages := make(chan string)
	signals := make(chan bool)

	// Here's a non-blocking receive. 
	// If value is available on messages then select will take the <-messages case with that value. 
	select {
	case msg := <-messages: 
		fmt.Println("received message", msg)
	// If not it will immediately take the default case. 
	default: fmt.Println("no messages received")
	}

	msg := "hi"
	select {
	case messages <- msg: 
		fmt.Println("sent message", msg)
	default:
		fmt.Println("no message sent")
	}

	// We can use multiple cases above the default clause to implement a multi-way non-blocking select. 
	// Here we attempt non-blocking receives on both messages and signals. 
	select {
	case msg := <-messages:
		fmt.Println("recieved message", msg)
	case sig := <-signals:
		fmt.Println("received signal", sig)
	default:
		fmt.Println("no activity")
	}
}