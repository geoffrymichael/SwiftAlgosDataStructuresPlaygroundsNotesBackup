import UIKit

//The first index we start with the second and compare it to the one before and swap them if they are lower, or else do nothing and then move up the array. Each succesive index is compared down the line to previous in index



var numbers = [5,6,2,99,11,55,2,10]

for i in 0..<numbers.count {
    let key = numbers[i]
    var j = i - 1
    
    //first we make sure that the index of ois greater than 0, and then if it is larger than the number
    while(j <= 0 && numbers[j] > key) {
        numbers[j+1] = numbers[j]
        //This moves thecomprison down the line to previous numbers in index
        j = j - 1
    }
    
    numbers[j+1] = key
}
