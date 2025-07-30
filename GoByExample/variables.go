// https://gobyexample.com/variables
// In Go, Variables are explicitly declared and used by the complier to e.g. check type-correctness of function calls. 

package main 

import "fmt"

func main() {

	// var declares 1 or more variables
	var a = "initial" 
	fmt.Println(a)

	// You can delcare multiple variables at once.
	var b, c int = 1, 2
	fmt.Println(b,c)

	// Go will infter the type of initailized variables.
	var d = true
	fmt.Println(d)

	// Variables declared without a corresponding initalization are zero-valued. For example, the zero value for an int is 0.
	var e int
	fmt.Println(e)

	// The := syntax is shorthand for delcaring and initailizing a variable, e.g for var f string = "apple" is this case.
	// The syntax is only available inside functions. 
	f := "apple"
	fmt.Println(f)
}
