//
//  CollectionType.swift
//  Swift Conceptual Library
//
//  Created by Michael Fulton Jr. on 11/16/17.
//

import Foundation
internal typealias void = (() -> ())?

internal protocol CollectionType {
    associatedtype item
    associatedtype NodeType: Node
    var size: Int { get }
    var beginning: item? { get }
    var end: item? { get }
    mutating func push(_ value: item, with completion: void)
    mutating func pop(with completion: ((item?) -> ())?)
    mutating func empty(with completion: void)
    mutating func emptyWithPop(with finish: void, completion: (([item])  -> ())?)
}

internal extension CollectionType {
    func peek() -> item? { return nil }
    func printAllValues() {}
    func printValue(at index: Int) {}
    func value(at index: Int) -> item? { return nil }
    
    // TODO: Figure out the best way to handle search and sort
    // func search(_ handeler: (NodeType) -> Node) -> NodeAbstract? { return nil }
    mutating func push(_ values: item..., with task: ((item) -> item)? = nil,  with finish: void = nil, completion: void = nil) {}
    mutating func push(_ values: inout [item], safely: Bool = true, with task: ((item) -> item)? = nil, with finish: void = nil, completion: void = nil) {}
    mutating func push<collection: CollectionType>(_ values: inout collection, safely: Bool = true, with task: ((item) -> item)? = nil, with finish: void = nil,  completion: void = nil) {}
    mutating func insertNode(with value: item, at index:Int, completion: void = nil) {}
    mutating func insertNode(with value: item, before index: Int, completion: void = nil) {}
    mutating func inssertNode(with value: item, after index: Int, completion: void = nil) {}
    mutating func replaceValueOfNode(at index: Int, with value:item, completion: void = nil) -> item? { return nil }
    mutating func removeNode(at index:Int, completion: void = nil) -> item? { return nil }
    mutating func swapNode(at indexA:Int, with indexB:Int, completion: void = nil) {}
    mutating func emptyWithPop(with task: ((item) -> item)? = nil, with finish: void = nil, completion: (([item]) -> item)? = nil) {
        
    }
    
    //TODO: Functional methods that takes a conditional statement
}

internal extension CollectionType where NodeType: NodeID {
    func printKeys(){}
    func printValue(with key:NodeType.keyType){}
    func value(from Key:NodeType.keyType) -> item? { return nil }
    mutating func insertNode(with value: item, at key: NodeType.keyType, completion: void = nil) {}
    mutating func insertNode(with value: item, before key: NodeType.keyType, conmpletion: void = nil) {}
    mutating func insertNode(with value: item, after key: NodeType.keyType, completion: void = nil) {}
    mutating func replaceKeyOfNode(with keyA: NodeType.keyType, to keyB: NodeType.keyType, completion: void = nil) {}
    mutating func replaceValueOfNode(with key: NodeType.keyType, with value: item, completion: void = nil) -> item? { return nil }
    mutating func removeNode(with key: NodeType.keyType, completion: void = nil) -> item? { return nil }
    mutating func swapNode(at keyA: NodeType.keyType, with keyB: NodeType.keyType, completion: void = nil) {}
}

