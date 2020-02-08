import UIKit

struct Queue<Element> {
    var elements: [Element] = []
    
    
    //this silences the running about a result not being used
    @discardableResult
    mutating func enqueue(_ value: Element) -> Bool {
        elements.append(value)
        return true
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ?  nil : elements.removeFirst()
    }
    
}

class TreeNode<T> {
    
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
    
}


extension TreeNode where T: Equatable {
    
    //Depth First search starts at the root, then it goes to the left, then to the left again, then back up one if we hit a leaf and then back down. Then back up to the top, and then down the right.
    
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        
        //Here is a function that does this. It will take in our root as an argument for a closure that doesnt return anything because we will just use it to print.
        visit(self)
        //Then for each of roots children, we recursively search through everything
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    //A level order traversal we go by the level in which the nodes are laid out. So the root first then to all children starting from left. Then finally going down to children of children from left
    //we must have a queue to keep track during the search so we have to create that
    
    //Jeeese. I am going to have to over this one
    //I think what is happening here is first we go the root node. Then we go down a level and store all the children of the root at next level. Then we de a while check that checks if there is anything left that can be dequeed and then conitnue until we have exhausted all elvels at which case you cannot dequeue anything
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        //Start at root
        visit(self)
        
        //We create the queue and then fill it with all the nodes
        var queue = Queue<TreeNode>()
        children.forEach {
            queue.enqueue($0)
            
        }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach {
                queue.enqueue($0)
            }
        }
        
        
    }

    func search(_ value: T) -> TreeNode? {
        
        var result: TreeNode?
        
        //Now we leverage are void clsoure searches to search for a value
        
        forEachLevelOrder { node in
            
            if node.value == value {
                result = node
            }
        }
        
        return result
    }
    
}


let beverages = TreeNode<String>("Beverages")

let hot = TreeNode<String>("Hot")

let cold = TreeNode<String>("cold")

beverages.add(hot)
beverages.add(cold)

beverages.forEachLevelOrder {
    print($0.value)
}


