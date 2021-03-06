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
        let object1 = FixedObject(size: CGSizeMake(40, 60))
        let object2 = FixedObject(size: CGSizeMake(30, 70))
        let object3 = FixedObject(size: CGSizeMake(50, 50))
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
        let object1 = FixedObject(size: CGSizeMake(40, 60))
        let object2 = FixedObject(size: CGSizeMake(30, 70))
        let object3 = FixedObject(size: CGSizeMake(50, 50))
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

    func testVerticalJustifiedStack() {
        let object1 = FixedObject(size: CGSizeMake(40, 60))
        let object2 = FixedObject(size: CGSizeMake(30, 70))
        let object3 = FixedObject(size: CGSizeMake(50, 50))
        let stack = VerticalJustifiedStack(sizables: [object1, object2, object3], spacing: 0)

        XCTAssertEqual(stack.size, CGSizeMake(50, 180), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(0, 0, 50, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(0, 60, 50, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 130, 50, 50), "")

        stack.spacing = 10
        XCTAssertEqual(stack.size, CGSizeMake(50, 200), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(0, 0, 50, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(0, 70, 50, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 150, 50, 50), "")

        stack.spacing = 0
        stack.inset  = Inset(top: 5, left: 10, bottom: 25, right: 15)
        XCTAssertEqual(stack.size, CGSizeMake(75, 210), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(10, 5, 50, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(10, 65, 50, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(10, 135, 50, 50), "")
    }

    func testVerticalLeftAlignedStack() {
        let object1 = FixedObject(size: CGSizeMake(40, 60))
        let object2 = FixedObject(size: CGSizeMake(30, 70))
        let object3 = FixedObject(size: CGSizeMake(50, 50))
        let stack = VerticalLeftAlignedStack(sizables: [object1, object2, object3], spacing: 0)

        XCTAssertEqual(stack.size, CGSizeMake(50, 180), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(0, 0, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(0, 60, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 130, 50, 50), "")

        stack.spacing = 10
        XCTAssertEqual(stack.size, CGSizeMake(50, 200), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(0, 0, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(0, 70, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 150, 50, 50), "")

        stack.spacing = 0
        stack.inset  = Inset(top: 5, left: 10, bottom: 25, right: 15)
        XCTAssertEqual(stack.size, CGSizeMake(75, 210), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(10, 5, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(10, 65, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(10, 135, 50, 50), "")
    }

    func testVerticalRightAlignedStack() {
        let object1 = FixedObject(size: CGSizeMake(40, 60))
        let object2 = FixedObject(size: CGSizeMake(30, 70))
        let object3 = FixedObject(size: CGSizeMake(50, 50))
        let stack = VerticalRightAlignedStack(sizables: [object1, object2, object3], spacing: 0)

        XCTAssertEqual(stack.size, CGSizeMake(50, 180), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(10, 0, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(20, 60, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 130, 50, 50), "")

        stack.spacing = 10
        XCTAssertEqual(stack.size, CGSizeMake(50, 200), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(10, 0, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(20, 70, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(0, 150, 50, 50), "")

        stack.spacing = 0
        stack.inset  = Inset(top: 5, left: 10, bottom: 25, right: 15)
        XCTAssertEqual(stack.size, CGSizeMake(75, 210), "")
        XCTAssertEqual(stack.frames[0], CGRectMake(20, 5, 40, 60), "")
        XCTAssertEqual(stack.frames[1], CGRectMake(30, 65, 30, 70), "")
        XCTAssertEqual(stack.frames[2], CGRectMake(10, 135, 50, 50), "")
    }

    func testSizableInRect() {
        let object1 = FixedObject(size: CGSizeMake(10, 10))
        let object2 = FixedObject(size: CGSizeMake(10, 10))
        let object3 = FixedObject(size: CGSizeMake(10, 10))
        let stack = HorizontalStack(sizables: [object1, object2, object3], spacing: 0)

        let rect1 = CGRectMake(0, 0, 1, 1)
        let rect12 = CGRectMake(9, 4, 2, 1)
        let rect3 = CGRectMake(29, 9, 1, 1)

        let sizable1 : [Sizable] = [object1]
        let sizable12 : [Sizable] = [object1, object2]
        let sizable3 : [Sizable] = [object3]

        if let frame = stack.framesInRect(rect1).first {
            XCTAssertEqual(frame.size, sizable1.first!.size, "")
        } else {
            XCTAssert(false, "frame1 should not be nil")
        }
        if let frame = stack.framesInRect(rect3).first {
            XCTAssertEqual(frame.size, sizable3.first!.size, "")
        } else {
            XCTAssert(false, "frame3 should not be nil")
        }
        let frames12 = stack.framesInRect(rect12)
        if frames12.count == 2 {
            let frame1 = frames12[0]
            let frame2 = frames12[1]
            XCTAssertEqual(frame1.size, object1.size, "")
            XCTAssertEqual(frame2.size, object2.size, "")
        } else {
            XCTAssert(false, "should have two items")
        }

        // Making Spacing so that object2 will be out of frame12
        stack.spacing = 2
        var spacing12 = stack.framesInRect(rect12)
        if spacing12.count == 1 {
            let frame1 = spacing12[0]
            XCTAssertEqual(frame1.size, object1.size, "")
        } else {
            XCTAssert(false, "should have one item")
        }

        stack.inset = Inset(top: 0, left: 2, bottom: 0, right: 0)
        if stack.framesInRect(rect1).count == 0 {

        } else {
            XCTAssert(false, "frame1 should be nil")
        }
    }

    func testPerfectNestedStack() {

        let horizontal1 = HorizontalStack(sizables:
            [
                FlexibleObject(volume: CGSizeMake(3, 3), maxSize: CGSizeMake(8, 2)),   // 5, 2
                FlexibleObject(volume: CGSizeMake(2, 4), maxSize: CGSizeMake(8, 2)),   // 4, 2
            ]
        ) // | 5, 2 | 4, 2 |
        XCTAssertEqual(horizontal1.size, CGSizeMake(9, 2), "")


        let verticalInfo = VerticalJustifiedStack(sizables:
            [
                FlexibleObject(volume: CGSizeMake(100, 1), maxSize: CGSizeMake(4, 2)),
                FlexibleObject(volume: CGSizeMake(100, 1), maxSize: CGSizeMake(4, 2)),
            ]
            , spacing: 1)   // 4, 5

        let horizontalTop = HorizontalStack(sizables:
            [
                FixedObject(size: CGSizeMake(4, 4)),   // 4, 4
                verticalInfo  // 4, 5
            ]
            , spacing: 1  // 8 + 1, 5
            , inset: Inset(top: 1, left: 1, bottom: 1, right: 1))  // 11, 7

        XCTAssertEqual(verticalInfo.size, CGSizeMake(4, 5), "")
        XCTAssertEqual(horizontalTop.size, CGSizeMake(11, 7), "")
    }

    func testCollapsingStack() {
        let horizontal1 = HorizontalStack(sizables:
            [
                FlexibleObject(volume: CGSizeMake(3, 3), maxSize: CGSizeMake(8, 2)),   // 5, 2
                FlexibleObject(volume: CGSizeMake(2, 4), maxSize: CGSizeMake(8, 2)),   // 4, 2
            ]
        ) // | 5, 2 | 4, 2 |
        horizontal1.maxSize = CGSizeMake(CGFloat.max, 1)
        XCTAssertEqual(horizontal1.size, CGSizeMake(16, 1), "")

        horizontal1.maxSize = CGSizeMake(2, 16)
        XCTAssertEqual(horizontal1.size, CGSizeMake(2, 4), "")
    }

    func testExpandingStack() {
        let vertical = VerticalStack(sizables:
            [
                FlexibleObject(volume: CGSizeMake(3, 3), maxSize: CGSizeMax),   // 3, 3
                FlexibleObject(volume: CGSizeMake(2, 4), maxSize: CGSizeMake(4, 2)),   // 4, 2
            ]
        ) // | 3, 3 | 4, 2 |
        XCTAssertEqual(vertical.size, CGSizeMake(4, 5), "")

        vertical.maxSize = CGSizeMake(CGFloat.max, 1)
        XCTAssertEqual(vertical.size, CGSizeMake(17, 1), "")

        vertical.spacing = 1
        XCTAssertEqual(vertical.size, CGSizeMake(18, 1), "")

        vertical.inset = Inset(top: 1, left: 1, bottom: 1, right: 1)
        XCTAssertEqual(vertical.size, CGSizeMake(20, 1), "")
    }
}
