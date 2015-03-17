package main

import (
	"fmt"
	"math"
	"math/rand"
)

//func add(x int, y int) int{
func add(x, y int) int {
	return x + y
}

func swap(x, y string) (string, string) {
	return y, x

}

func myprint(args ...int) {
	for _, arg := range args {
		fmt.Println(arg)
	}
}

func main() {

	a, b := swap("hello", "world")
	//fmt.Println()
	fmt.Printf("----------is", rand.Intn(100))
	fmt.Printf("\n")
	fmt.Printf("now you have %g problem.", math.Nextafter(2, 3))
	fmt.Printf("\n")

	fmt.Printf("pi is : ", math.Pi)
	fmt.Printf("\n")

	fmt.Printf("call fun add is : ", add(12, 12))
	fmt.Printf("\n")

	fmt.Printf(a, b)

	fmt.Printf("\n")
	myprint(1, 2, 3)

	//	fmt.Printf("hello,world\n")
	//	fmt.Printf("hello,world\n")
	//	fmt.Printf("hello,world\n")
	//	fmt.Printf("hello,world\n")
}
