import UIKit


class BinaryNode<Element> {
    var value: Element
    var leftNode: BinaryNode?
    var rightNode: BinaryNode?

    
    init(value: Element) {
        self.value = value
    }
  
}

//In Order Traversal- the first thing is to go to all left nodes first. Then back to the root then to the right and the childs first then back to the parent


extension BinaryNode {
    
    func traverseInOrder(visit: (Element) -> Void) {
        
        
        //Recursive this will put our root on the stack then work down the left side of the tree.Then when you get to the leaf it moves on
        leftNode?.traverseInOrder(visit: visit)
        
        //I belive, recursively, this will one through checks on conditions and return a value that has not been yet gone over
        visit(value)
        
        rightNode?.traverseInOrder(visit: visit)
        
    }
    
    //Posrt Order Traversal- the root is only visited after the childs have
    
    func traversePostOrder(visit: (Element) -> Void) {
        
        
        //Remember here its almsot that with how the stack works, the return is the first thing visited last
        //The order here is the most important thing. Left child will be called on stack until it options out when there is no value to the left
        leftNode?.traversePostOrder(visit: visit)
        rightNode?.traversePostOrder(visit: visit)
        
        //This is where the actual "return" occurs as things are pulled off the stack. I belive
        visit(value)
        
    }
    
    //So this is traversing the child and children of the child first
    func preOrderTraversal(visit: (Element) -> Void) {
        //first visit ourself as the root node
        visit(value)
        
        leftNode?.preOrderTraversal(visit: visit)
        rightNode?.preOrderTraversal(visit: visit)
    }
    
}


let ten = BinaryNode(value: 10)

let nine = BinaryNode(value: 9)

let two = BinaryNode(value: 2)

let five = BinaryNode(value: 5)

let oneFifty = BinaryNode(value: 150)

let fifteen = BinaryNode(value: 15)

let seven = BinaryNode(value: 7)


ten.leftNode = nine
ten.rightNode = two

nine.leftNode = five
nine.rightNode = oneFifty

two.leftNode = fifteen
two.rightNode = seven


ten.preOrderTraversal {
    print($0)
}
