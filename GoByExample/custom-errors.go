// https://gobyexample.com/custom-errors
// It's possible to define custom error types by implementing the Error() method on them. 
// Here's a variant on the example above that uses a custom type to explicitly represent an argument error. 

package main 

import (
	"errors"
	"fmt"
)

// A custom error type usually has the suffix "Error".
type argError struct {
	arg int
	message string
}

// Adding this Error method makes argError implement the error interface.
func (e *argError) Error() string {
	return fmt.Sprintf("%d - %s", e.arg, e.message)
}

func f(arg int) (int, error) {
	if arg == 42 {

		// Return our custom error.
		return -1, &argError{arg, "Can't work with it"}
	}
	return arg + 3, nil
}

func main() {

	// errors.AsType is a more advanced version of erros.Is.
	// It checks that a given error (or any error in its chain) matches a specific error type and converts to a value of that type, also returning true. 
	// If there is no match, the second return value is false. 
	_, err := f(42)
	if ae, ok := errors.AsType[*argError](err); ok {
		fmt.Println(ae.arg)
		fmt.Println(ae.message)
	} else {
		fmt.Println("err doesn't match argError")
	}
}

// Note: I couldn't get this to run in my docker instance running Go 1.24.5 linux/amd64
// ./custom-errors.go:38:22: undefined: errors.AsType