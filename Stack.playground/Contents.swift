import UIKit

var str = "Hello, playground"


//A stack is basically just that when you add things to the data structure it becomes top of stack. And so it is funtionally last in is first out

struct Stack<Element> {
    
    //Our stack will be an array of generic elements that we set initially as empty
    private var storage: [Element] = []
    
    init() { }
    
    //So here we just add something to a stack
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    //The stack can be nil. And we use swift array function of pop last to remove it
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
}

//How we will represent our stack on the console
extension Stack: CustomStringConvertible {
    
    var description: String {
        let topDivider = "--------top--------\n"
        let bottomDivider = "\n--------------"
        
        //So this is some fun stuff here. We are using map, to through our array, reverse it (because that is what a stack is as opposed to array and then join that together split by returns to make it look like a stack. I think
        let stackEleements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        
        return topDivider + stackEleements + bottomDivider
    }
}

var stack = Stack<Int>()


stack.push(5)
stack.push(60)
stack.push(7)

print(stack)

stack.pop()


print(stack)
