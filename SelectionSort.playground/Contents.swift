import UIKit

//Again, this is for an unsorted array
//First we have a pointer and then we want to find the minimum number in an array
//Then if your number in the range to the end is the lowest you swap or else nothing. Then move your index up one

// Best and Worst or average are both O(n^2)

var numbers = [5, 4, 10, 6, 12, 70, 60, 55, 1]


//This will be used to store the lowest number in the array
var minIndex = 0

for i in 0..<numbers.count {
    minIndex = i
    
    //we start at i+1 because above we already "assume i is the lowest number"
    for j in (i+1)..<numbers.count {
        if(numbers[j]) < numbers[minIndex] {
            //If the number next to me is lower, swap the numbers
            minIndex = j
        }
        let temp = numbers[i]
        //I believe this just means that number is = to the same number if it is not higher because minIndex would not have been changed. 
        numbers[i] = numbers[minIndex]
        numbers[minIndex] = temp
        
//        numbers.swapAt(i, minIndex)
        
    }
    
}

print(numbers)
