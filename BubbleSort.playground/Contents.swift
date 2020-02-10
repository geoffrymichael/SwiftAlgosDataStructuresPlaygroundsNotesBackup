import UIKit

var str = "Hello, playground"

//When we have an unsorted array, we want to sort it
//First we take a first number and then compare it to the next number using a pointer.
//From lowest to greatest we would compare and switch sports if the number to me is less than the next one or else do nothing. In the first pass you will get the largest element sorted to the end

//Bubble Sort Best time is O(n) which would be the case if array was already sorted
// Worst and average time is O(n^2)

var numbers = [6,7,19,11,45,23,56,78,9]

print("Array before sort")
print(numbers)



//This necessitates a double loop, thus O(n^2)

//The less than here is basically count - 1
for i in 0..<numbers.count {
    
       
    for j in 0..<numbers.count {
        
        //Of course the comparison operator here will sort by ascending or descending
        if numbers[i] < numbers[j] {
            //we have to swap if this is the case
            
            //this is our temp storage
//            let temp = numbers[i]
//            numbers[i] = numbers[j]
//            numbers[j] = temp
            
            //This below is swift built in swap
            numbers.swapAt(i, j)
            
        }
        
    }
}

print(numbers)
