import UIKit

//Graphs consist of vertices and edges. For shortest paths and times, best ticket prices/.

//Weighted graphs: Where an edge of a verticy will have some kind of weight, like a price perhaps

//Directed graphs. Someplaces can go from one verticy to another, but some you cannot

//Undirected graphs go both way.


enum EdgeType {
    case directed
    case undirected
    
}

//The vertex is basically what holds the data
struct Vertex<T> {
    let data: T
    let index: Int
    
}



extension Vertex: Hashable where T: Hashable {
    
    
}

//t must be equatable for it be hashabe
extension Vertex: Equatable where T: Equatable {
    
}

extension Vertex: CustomStringConvertible {
    var description: String {
        
        return "\(index): \(data)"
    }
}


//Edges are the connections between vertices. They can eitehr be the source or the desitnation therefore
//Lets use an example that might contain a plane ticket from dallas to houston
struct Edge<T> {
    let vertex: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}

/*Adjacency List
    With this we would have to list each vertext and where it can go.
 
*/

protocol Graph {
    
    //Graph works with any type of element
    associatedtype Element
    
    //Then create functions that everyone who uses Graph must conform to
    func createAVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    
    
}

extension Graph {
    
    // addUndirectedGraph
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        
        //Creating both directions. I think
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
        
    }
    
    // add
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch edge {
        case .directed :
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected :
            addDirectedEdge(from: source, to: destination, weight: weight)
            addDirectedEdge(from: destination, to: source, weight: weight)
            
        }
        
    }
    
    
}

//Here our list must be hashable and conform to type Graph
class AdjacencyList<T: Hashable> : Graph {
    
    private var adjacencies: [Vertex<T>:[Edge<T>]] = [:]
    
    init() { }
    
    func createAVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, index: adjacencies.count)
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(vertex: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
            return adjacencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).first { $0.destination == destination }?.weight
    }
    
}


//Holy cow, well lets make a graph now

//To help visualize or graph

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgesString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgesString.append("\(edge.destination), ")
                } else {
                    edgesString.append("\(edge.destination)")
                }
                result.append("\(vertex) ----> [ \(edgesString) ]\n")
            }
        }
        return result
    }
}

let graph = AdjacencyList<String>()


let singapore = graph.createAVertex(data: "Singapore")
let tokypo = graph.createAVertex(data: "Tokyo")
let hongkong = graph.createAVertex(data: "Hong Kong")
let detroit = graph.createAVertex(data: "Detroit")
let sanFrancisco = graph.createAVertex(data: "San Francisco")
let washingtonDC = graph.createAVertex(data: "Washington DC")
let honolulu = graph.createAVertex(data: "Honololu")
