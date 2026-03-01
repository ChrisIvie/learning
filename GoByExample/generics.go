// https://gobyexample.com/generics
// Starting with version 1.18, Go has added support for Generics, also known type parameters. 
package main 

import "fmt"

// As an example of a generic function, SlicesIndex takes a slice of any comparable type and an element of that type and returns the index of the first occurence of v in s, or -1 if not present.
// The comparable constraint means that we can compare values of this type with the == and != operators.
// Note that this function exists in the standard library as slices.Index.
func SlicesIndex[S ~[]E, E comparable](s S, v E) int {
    for i := range s {
        if v == s[i] {
            return i
        }
    }
    return -1
}

// As an example of a generic type, List is a singly-linked list with values of any type. 
type List[T any] struct {
    head, tail *element[T]
}

type element[T any] struct {
    next *element[T]
    val T
}

// We can define methods on generic types just like we do on regular types, but we have to keep the type parameters in place. 
// The type is List[T], not List. 
func (lst *List[T]) Push(v T) {
    if lst.tail == nil {
        lst.head = &element[T]{val: v}
        lst.tail = lst.head
    } else {
        lst.tail.next = &element[T]{val: v}
        lst.tail = lst.tail.next
    }
}

// AllElements returns all of the List elements as a slice.
func (lst *List[T]) AllElements() []T {
    var elems []T
    for e := lst.head; e != nil; e = e.next {
        elems = append(elems, e.val)
    }
    return elems
}

func main() {
    var s = []string{"foo", "bar", "zoo"}

    fmt.Println("Index of zoo:", SlicesIndex(s, "zoo"))

    // When invoking generic functions, we can often rely on type inference. 
    // Note that we don't have to specify the types for S and E when calling SlicesIndex - the compiler infers them automatically.. though we could also specify them explicitly. 

    _ = SlicesIndex[[]string, string](s, "zoo")

    lst := List[int]{}
    lst.Push(10)
    lst.Push(13)
    lst.Push(23)
    fmt.Println("list:", lst.AllElements())
}