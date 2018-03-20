//
//  Tests.swift
//  Tests
//
//  Created by Michael Fulton Jr. on 11/29/17.
//  Copyright © 2017 Michael Fulton Jr. All rights reserved.
//

import XCTest
@testable import Swift_Conceptual_Library

class Tests: XCTestCase {
    var queue: Queue<String>!
    var size: Int = 0
    var beginning: String?
    var end: String?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        queue = Queue<String>()
    }
    func testInitialProperty() {
        size = queue.size
        beginning = queue.beginning
        end = queue.end
        
        XCTAssertEqual(size, 0)
        XCTAssertNil(beginning)
        XCTAssertNil(end)
        
    }
    
    func testPush(){
        queue.push("Dog")
        queue.push("Cat")

        size = queue.size
        beginning = queue.beginning
        end = queue.end
        XCTAssertEqual(size, 2)
        XCTAssertEqual(beginning, "Dog")
        XCTAssertEqual(end, "Cat")
        
        queue.push("Wolf")
        size = queue.size
        end = queue.end
        XCTAssertEqual(size, 3)
        XCTAssertEqual(end, "Wolf")

        
    }
    
    func testPop(){
        queue.push("Dog")
        queue.push("Cat")
        queue.push("Wolf")
        var result: String?
        queue.pop(){
            item in
            result = item
        }

        size = queue.size
        beginning = queue.beginning
        end = queue.end
   
        XCTAssertEqual(size, 2)
        XCTAssertEqual(result, "Dog")
        XCTAssertEqual(beginning, "Cat")
        XCTAssertEqual(end, "Wolf")
        
        queue.pop(){
            item in
            result = item
        }
        size = queue.size
        beginning = queue.beginning
        XCTAssertEqual(size, 1)
        XCTAssertEqual(result, "Cat")
        XCTAssertEqual(beginning, "Wolf")
        XCTAssertEqual(end, "Wolf")
        
        queue.pop(){
            item in
            result = item
        }
        size = queue.size
        beginning = queue.beginning
        end = queue.end
        XCTAssertEqual(size, 0)
        XCTAssertEqual(result, "Wolf")
        XCTAssertNil(beginning)
        XCTAssertNil(end)
    }
    
    func testEmpty(){
        queue.push("Dog")
        queue.push("Cat")
        queue.push("Wolf")
        size = queue.size
        XCTAssertTrue(size == 3)
        queue.empty()
        size = queue.size
        beginning = queue.beginning
        end = queue.end
        XCTAssertEqual(size, 0)
        XCTAssertNil(beginning)
        XCTAssertNil(end)
    }
    
    func testEmptyWithPop() {
        queue.push("Dog")
        queue.push("Cat")
        queue.push("Wolf")
        size = queue.size
        XCTAssertEqual(size, 3)
        var results: [String] = []
        
        queue.emptyWithPop() {
            items in
            results = items
        }
         size = queue.size
        XCTAssertEqual(size, 0)
        XCTAssertEqual(results.count, 3)
        XCTAssertEqual(results[1], "Cat")
        
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        size = 0
        beginning = nil
        end = nil
        
    }
    

    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
