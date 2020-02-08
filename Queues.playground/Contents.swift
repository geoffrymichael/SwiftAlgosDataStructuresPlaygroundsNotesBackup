import UIKit

var str = "Hello, playground"


//Queue is basically first in first out data structure. Essentially standing in line. the item that was inserted first will be removed first.


struct Queue<T> {
    
    var array: [T] = []
    
    init() { }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    //If the array is empty we will return nil, otherwise return and remove the first item
    mutating func dequeue() -> T? {
        return array.isEmpty ? nil : array.removeFirst()
    }
    
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}


var queue = Queue<String>()

queue.enqueue("cat")
queue.enqueue("dog")

print(queue)
