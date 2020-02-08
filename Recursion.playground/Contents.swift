import UIKit

//Recursion is the process of when a function calls itself, either indirectly or directly
//Remember when you do this on its basis a recursion would essentially be an infinite loop
//So, of course, you need the base case.


//Simple example of recursion with a factorial function

//Remember, all functions are added to the stack until the base case is reached. After the base case is reached, then the stack starts being called.
func factorial(number: Int) -> Int {
    
//    if number == 0 {
//        return 1
//    }
//
//    return number * factorial(number: number - 1)
    
    //I think this would also work as a ternary operation
    return number == 0 ? 1 : number * factorial(number: number - 1)
    
}


//Anything recursive can be done with a while loop, but it will be more lines of code. Teacher says that performance (Big O implications?) is actually minimal

factorial(number: 6)


//Power function

func power(number: Int, n: Int) -> Int {
    
//    if n == 0 {
//        return 1
//    } else {
//        return number * power(number: number, n: n - 1)
//    }
    
    return n == 0 ? 1 : number * power(number: number, n: n - 1)
    
}


print(power(number: 2, n: 4))
