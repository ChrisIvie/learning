// https://gobyexample.com/channels
// Channels are the pips that connect concurrent goroutines.

package main 

import "fmt"

func main() {

    // Create a new channel with make(chan val-type).
    // Channels are typed by the values they convey.
    messages := make(chan string)

    // Send a value into a channel using the channel <- syntax. 
    // Here we send "ping" to the messages channel we made above, from a new goroutine. 
    go func() {messages <- "ping" } ()



    // The <- channel syntax receives a value from the channel. 
    // Here we'll receive the "ping" message we sent above and print it out. 
    msg := <-messages
    fmt.Println(msg)
}

// When we run the program the "ping" message is successfully passed from one goroute to another via our channel. 
// By default send and receives block until bloth the sender and receiver are ready. 
// This property allowed us to wait at the end of our program for the "ping" message without having to use any other synchronization. 