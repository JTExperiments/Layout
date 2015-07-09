//
//  SizableTests.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import XCTest
import QuartzCore
import LayoutFramework

class SizableTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAspectFill() {
        let object = FixedObject(size: CGSizeMake(40, 50))
        let aspectFill : AspectFill<FixedObject> = AspectFill(content: object, maxSize: CGSizeMake(100, 100))
        XCTAssertEqual(aspectFill.size, CGSizeMake(100, 125), "")
    }

    func testAspectFit() {
        let object = FixedObject(size: CGSizeMake(40, 50))
        let aspectFit : AspectFit<FixedObject> = AspectFit(content: object, maxSize: CGSizeMake(100, 100))
        XCTAssertEqual(aspectFit.size, CGSizeMake(80, 100), "")
    }

}
