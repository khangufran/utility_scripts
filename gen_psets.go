package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Println("Usage: gen_psets <num_questions>")
		os.Exit(1)
	}

	num_questions, err := strconv.Atoi(os.Args[1])
	if err != nil {
		fmt.Println("Please provide valid number of questions")
		os.Exit(1)
	}

	ps1, ps2, ps3 := []int{}, []int{}, []int{}

	for num := range num_questions {
		if num%3 == 0 {
			ps1 = append(ps1, num+1)
		} else if num%3 == 1 {
			ps2 = append(ps2, num+1)
		} else {
			ps3 = append(ps3, num+1)
		}
	}

	fmt.Println("PS1 Set: ", ps1)
	fmt.Println("PS2 Set: ", ps2)
	fmt.Println("PS3 Set: ", ps3)
}
