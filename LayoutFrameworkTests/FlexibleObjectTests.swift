//
//  FlexibleObjectTests.swift
//  Layout
//
//  Created by James Tang on 10/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit
import XCTest
import LayoutFramework

class FlexibleObjectTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSizing() {
        let flex = FlexibleObject(volume: CGSizeMake(3, 3), maxSize:CGSizeZero)

        flex.maxSize = CGSizeMake(2, CGFloat.max)
        XCTAssertEqual(flex.size, CGSizeMake(2, 5), "")

        flex.maxSize = CGSizeMake(CGFloat.max, 2)
        XCTAssertEqual(flex.size, CGSizeMake(5, 2), "")

        flex.maxSize = CGSizeMake(CGFloat.max, 1)
        XCTAssertEqual(flex.size, CGSizeMake(9, 1), "")

        flex.maxSize = CGSizeMax
        XCTAssertEqual(flex.size, CGSizeMake(3, 3), "")

        flex.maxSize = CGSizeMake(1, 2)
        XCTAssertEqual(flex.size, CGSizeMake(1, 2), "")
    }

}
