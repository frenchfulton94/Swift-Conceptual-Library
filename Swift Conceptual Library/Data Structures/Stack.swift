//
//  Stack.swift
//  Swift Conceptual Library
//
//  Created by Michael Fulton Jr. on 3/18/18.
//  Copyright © 2018 Michael Fulton Jr. All rights reserved.
//

import Foundation

public struct Stack<value>: CollectionType {
    internal typealias NodeType = StackNode<value>
    private var count: Int = 0
    private var head: NodeType?
    private var tail: NodeType?
    
    var size: Int { return count }
    var beginning: value? { return head?.value }
    var end: value? { return tail?.value }
    
    mutating func push(_ value: value, with completion: void = nil){
        let node = StackNode(value)
        guard head != nil else {
            head = node
            tail = head
            return
        }
        node.previous = tail
        tail!.next = node
        tail = tail!.next
        count += 1
        completion?()

    }
    mutating func pop(with completion: ((value?) ->())? = nil) {
        guard head != nil else {
            return
        }
        let value = tail!.value
        let previous = tail!.previous
        previous!.next = nil
        tail = previous
        count -= 1
        completion?(value)
    }
    mutating func empty(with completion: void = nil) {
        guard head != nil else {
            return
        }
        head = nil
        tail = nil
        count = 0
        completion?()
    }
    mutating func emptyWithPop(with finish: void, completion: (([value]) -> ())?) {
        var items: [value] = []
        while head != nil {
            pop {
                item in
                items.append(item!)
            }
        }
    }
    
    class StackNode<T>: BidirectionalNode {

        typealias item = T
        typealias node = StackNode
        var value: item
        weak var previous: node?
        weak var next: node?
        required  init(_ value: item){
            self.value = value
        }
        
        
    }
    
}

