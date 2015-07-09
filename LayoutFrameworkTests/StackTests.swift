//
//  StackTests.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import XCTest
import QuartzCore
import LayoutFramework

class StackTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHorizontalStack() {
        let object1 = SizableObject(size: CGSizeMake(40, 60))
        let object2 = SizableObject(size: CGSizeMake(30, 70))
        let object3 = SizableObject(size: CGSizeMake(50, 50))
        let stack = HorizontalStack(sizables: [object1, object2, object3], spacing: 0)

        XCTAssertEqual(stack.size, CGSizeMake(120, 70), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(0, 5, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(40, 0, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(70, 10, 50, 50), "")

        stack.spacing = 10
        XCTAssertEqual(stack.size, CGSizeMake(140, 70), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(0, 5, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(50, 0, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(90, 10, 50, 50), "")

        stack.spacing = 0
        stack.inset  = Inset(top: 5, left: 10, bottom: 25, right: 15)
        XCTAssertEqual(stack.size, CGSizeMake(145, 100), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(10, 10, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(50, 5, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(80, 15, 50, 50), "")
    }

    func testVerticalStack() {
        let object1 = SizableObject(size: CGSizeMake(40, 60))
        let object2 = SizableObject(size: CGSizeMake(30, 70))
        let object3 = SizableObject(size: CGSizeMake(50, 50))
        let stack = VerticalStack(sizables: [object1, object2, object3], spacing: 0)
        
        XCTAssertEqual(stack.size, CGSizeMake(50, 180), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(5, 0, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(10, 60, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 130, 50, 50), "")

        stack.spacing = 10
        XCTAssertEqual(stack.size, CGSizeMake(50, 200), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(5, 0, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(10, 70, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 150, 50, 50), "")


        stack.spacing = 0
        stack.inset  = Inset(top: 5, left: 10, bottom: 25, right: 15)
        XCTAssertEqual(stack.size, CGSizeMake(75, 210), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(15, 5, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(20, 65, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(10, 135, 50, 50), "")

    }

}
