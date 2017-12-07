//
//  Node.swift
//  Swift Conceptual Library
//
//  Created by Michael Fulton Jr. on 11/16/17.
//

import Foundation
import Swift

//enum NodeType {
//    case Unidirectional, Bidirectional, Multidirectional
//}
internal protocol Node {
    associatedtype item
    associatedtype node
    var value: item {get}
}

internal protocol NodeID{
    associatedtype keyType
    var key: keyType {set get}
}

internal protocol UnidirectionalNode: Node {
    var next: node? {set get}
}

internal protocol BidirectionalNode: UnidirectionalNode {
    var previous: node? {set get}
}
// TODO: Create generic multidirectional node structure for things like graphs and b-trees
internal protocol MultidirectionalNode: Node {
}

public protocol NodeAbstract {
    
}
