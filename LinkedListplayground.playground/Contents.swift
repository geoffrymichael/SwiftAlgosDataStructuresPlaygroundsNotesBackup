import UIKit

var str = "Hello, playground"


struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    //Can return a nil if we do not have any nodes
    func node(at index: Int) -> Node<Value>? {
        
        //We must iterate through every value
        var currentIndex = 0
        var currentNode = head
        
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    mutating func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
    
    //removing the head
    mutating func pop() -> Value? {
        
        //defer block returns a value and after it returns the value, the defer block then runs
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        //It returns the value of the one we remove but also removes it
        return head?.value
    }
    
    //Removing the tail
    mutating func removeLast() -> Value? {
        
        //Checking if we have anything in the list at all
        guard let head = head else { return nil }
        
        //Checking to see if there is even a tail at all. If there is we just pop it off
        guard head.next != nil else { return pop() }
        
        //A couple vars to track as we search through list from the head
        var prev = head
        var current = head
        
        //While current.next is not nil we move up the list
        while let next = current.next {
            prev = current
            current = next
        }
        
        //When next is nil, we step back and return that value and remove it
        prev.next = nil
        tail = prev
        return current.value
        
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            
            //If the node after is the tail, we remove the one before it by making the tail we remove the tail because it is the one after by making ourselves the tail node
            if node.next === tail {
                tail = node
            }
            
            //This is basically skipping a node
            node.next = node.next?.next
        }
        
        //return the value of the removed item
        return node.next?.value
    }
    
    init() { }
}

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}



extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(value)" }
        
        return "\(value) -> " + String(describing: next) + ""
    }
    
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else { return "empty list"}
        
        return String(describing: head)
    }
    
}

var list = LinkedList<Int>()

list.push(7)
list.push(1002)
list.push(5)
list.push(555)
print(list)
//To insert we first have to pick a node at a certain index
if let randomNode = list.node(at: 2) {
    list.insert(666, after: randomNode)
}

list.pop()

print(list)
