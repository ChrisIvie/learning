//https://gobyexample.com/pointers
// Go supports pointers, allowing you to pass references to values and records within your program. 

package main 

import "fmt"

// We'll show how pointers work in contract to values with 2 functions: zeroval and zeroptr.
// zeroval has an int parameter, so arguemnts will be passed to it by value. 
// zeroval will get a copy of ival distict from the one in the calling function. 
func zeroval(ival int) {
	ival = 0
}

// zeroptr in contract has *int parameter, meaning thta it takes an int pointer.
// The *iptr code in the function body then dereferences the pointer from its memory address to the current value at that address. 
// Assigning a value to a dereferenced pointer changes the value at the referenced address
func zeroptr(iptr *int) {
	*iptr = 0
}

func main() {
	i := 1
	fmt.Println("initial:", i)

	zeroval(i)
	fmt.Println("zeroval:", i)

	// The &i syntax gives the memory address of i, i.e. a pointer to i.
	zeroptr(&i)
	fmt.Println("zeroptr:", i)

	// Pointers can be printed too. 
	fmt.Println("pointer:", &i)
}

// zeroval doesn't change the i in main, but zeroptr does because it has a reference to memory address for that variable. 
