//
//  CollectionType.swift
//  Swift Conceptual Library
//
//  Created by Michael Fulton Jr. on 11/16/17.
//

import Foundation

internal protocol CollectionType {
    associatedtype item
    associatedtype NodeType: Node
    var size: Int { get }
    var beginning: NodeType? { get }
    var end: NodeType? { get }
    mutating func push(_ value: item, with completion: (() -> ())?)
    mutating func pop(with completion: ((item) -> item)?) -> item?
    mutating func empty(with completion: ((item) -> ())?)
}

internal extension CollectionType {
    func peek() -> item? { return nil }
    func printAllValues() {}
    func printValue(at index: Int) {}
    func value(at index: Int) -> item? { return nil }
    // TODO: Figure out the best way to handle search and sort
    // func search(_ handeler: (NodeType) -> Node) -> NodeAbstract? { return nil }
    mutating func push(_ values: item..., with task: ((item) -> ())? = nil,  with finish:(() -> ())? = nil, completion: (() -> ())? = nil) {}
    mutating func push(_ values: inout [item], safely: Bool = true, with task: ((item) -> item)? = nil, with finish:(() -> ())? = nil, completion: (() -> ())? = nil) {}
    mutating func push<collection: CollectionType>(_ values: inout collection, safely: Bool = true, with task: ((item)->())? = nil, with finish:(() -> ())? = nil,  completion: (() -> ())? = nil) {}
    mutating func insertNode(with value: item, at index:Int) {}
    mutating func insertNode(with value: item, before index: Int) {}
    mutating func inssertNode(with value: item, after index: Int) {}
    mutating func replaceValueOfNode(at index: Int, with value:item) -> item? { return nil }
    mutating func removeNode(at index:Int) -> item? { return nil }
    mutating func swapNode(at indexA:Int, with indexB:Int) {}
}

internal extension CollectionType where NodeType: NodeID {
    func printKeys(){}
    func printValue(with key:NodeType.keyType){}
    func value(from Key:NodeType.keyType) -> item? { return nil }
    mutating func insertNode(with value: item, at key: NodeType.keyType) {}
    mutating func insertNode(with value: item, before key: NodeType.keyType) {}
    mutating func insertNode(with value: item, after key: NodeType.keyType) {}
    mutating func replaceKeyOfNode(with keyA: NodeType.keyType, to keyB: NodeType.keyType) {}
    mutating func replaceValueOfNode(with key: NodeType.keyType, with value: item) -> item? { return nil }
    mutating func removeNode(with key: NodeType.keyType) -> item? { return nil }
    mutating func swapNode(at keyA: NodeType.keyType, with keyB: NodeType.keyType) {}
}

