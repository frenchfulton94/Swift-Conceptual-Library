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
    
    var beginning: NodeType? { return head }
    var end: NodeType? { return tail }
    
    mutating func push(_ value: value, with completion: (() -> ())? = nil) {
        let node: NodeType = NodeType(value)
        defer {
            count += 1
            completion?()
        }
        guard let _ = head else {
            head = node
            tail = head
            return
        }
        tail!.next = node
        tail = tail!.next
    }
    mutating func push(_ values: value..., with task: ((value) -> value)? = nil, with finish: (() -> ())? = nil,  completion: (() -> ())? = nil) {

        for value in values {
            let val = task?(value) ?? value
            self.push(val, with: finish)
        }
        
        completion?()
    }
    
    mutating func pop(with completion: ((value) -> value)?) -> value? {
        guard let _ = head else {
            return nil
        }
        let value = head!.value
        head = head!.next
        
        if head == nil {
            tail = nil
        }
        count -= 1
        return value
    }
    
    mutating func empty(with task: ((value) -> ())?) {
        head = nil
        tail = nil
        count = 0
    }
    
    class QueueNode<T>: UnidirectionalNode {
        typealias item = T
        typealias node = QueueNode
        var value: item
        weak var next: node?
        required init(_ value: item){
            self.value = value
        }
        
    }
    
}



