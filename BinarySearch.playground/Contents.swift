import UIKit

//Bascially finding the center and then creating new centers with greater or less than comparisons. Of course, the list has to be sorted

//Make sure you know that first check has to be whether the middle number is the value

let numbers = [1,5,15,17,19,22,24,31,105,150]

//let searchvalue = 99
//
//var lowerBound = 0
//var upperBound = numbers.count - 1
//
//var middle = 0
//var found = false
//
//while(lowerBound <= upperBound) {
//
//    //first, we have to find the middle of the array
//
//    middle = (lowerBound + upperBound) / 2
//
//    //next we check if middle is the number or not
//
//    if numbers[middle] == searchvalue{
//        found = true
//        break
//    } else if numbers[middle] < searchvalue {
//        lowerBound = middle + 1
//    } else {
//        upperBound = middle - 1
//    }
//
//
//
//}
//
//print(found)

//Next we will create an extension on an array so that we can use it on any array



extension Array where Iterator.Element == Int {
    
    func findUsingBinary(_ value: Int) -> Bool {

        var lowerBound = 0
        //Whatever array we are search is our self
        var upperBound = self.count - 1

        var middle = 0
        var found = false

        while(lowerBound <= upperBound) {
            
            //first, we have to find the middle of the array
            
            middle = (lowerBound + upperBound) / 2
            
            //next we check if middle is the number or not
            
            if numbers[middle] == value{
                found = true
                return found
            } else if numbers[middle] < value {
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }

        }
        
        return found
    }
    
    
}

print(numbers.findUsingBinary(15))
