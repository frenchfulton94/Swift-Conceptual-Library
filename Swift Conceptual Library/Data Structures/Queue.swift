//
//  Queue.swift
//  Swift Conceptual Library
//
//  Created by Michael Fulton Jr. on 11/28/17.
//  Copyright © 2017 Michael Fulton Jr. All rights reserved.
//

import Foundation

public struct Queue<value>: CollectionType {
    
    internal typealias NodeType = QueueNode<value>
    private var count: Int = 0
    private var head: NodeType?
    private var tail: NodeType?
    
    var size: Int { return count }
    var beginning: value? { return head?.value }
    var end: value? { return tail?.value }
    
    mutating func push(_ value: value, with completion: void = nil) {
        let node: NodeType = NodeType(value)
        defer {
            count += 1
            completion?()
        }
        guard head != nil else {
            head = node
            tail = node
            return
        }
        tail!.next = node
        tail = node
    }
    
    mutating func push(_ values: value..., with task: ((value) -> value)? = nil, with finish: void = nil,  completion: (() -> ())? = nil) {
        
        for value in values {
            let val = task?(value) ?? value
            self.push(val, with: finish)
        }
        
        completion?()
    }
    
    mutating func pop(with completion: ((value?) -> ())? = nil) {
        guard head != nil else {
            return
        }
        let value = head!.value
        head = head!.next
        
        if head == nil {
            tail = nil
        }
        count -= 1
        completion?(value)
    }
    
    mutating func empty(with completion: void = nil) {
        head = nil
        tail = nil
        count = 0
    }
    
    mutating func emptyWithPop(with finish: void = nil, completion: (([value]) -> ())? = nil) {
        var items: [value] = []

        while head != nil {
            self.pop {
                item in
                items.append(item!)
            }
        }
        
        completion?(items)
    }
    
    class QueueNode<T>: UnidirectionalNode {
        typealias item = T
        typealias node = QueueNode
        var value: item
        var next: node?
        required init(_ value: item){
            self.value = value
        }
        
    }
    
}



