//
//  PlainTextTests.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit
import XCTest
import LayoutFramework

class PlainTextTests: XCTestCase {

    var label : UILabel!
    var plainText : PlainText!
    var maxSize = CGSizeMake(100, CGFloat.max)

    override func setUp() {
        super.setUp()

        label = UILabel(frame: CGRectMake(0, 0, 100, 0))
        label.font = UIFont.systemFontOfSize(8)
        label.numberOfLines = 0
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHelloWorld() {
        var str = "Hello World"
        label.text = str
        let plainText = newPlainText(str)
        XCTAssertEqual(plainText.size, label.sizeThatFits(maxSize), "")
    }

    func testApple() {
        var str = "Apple"
        label.text = str
        let plainText = newPlainText(str)
        XCTAssertEqual(plainText.size, label.sizeThatFits(maxSize), "")
    }
    
    func testSomethingMore() {
        var str = "The reason behind why Apple wasn't able to fix auto cell sizing is that there're a fundamental design problem with how they store data."
        label.text = str
        let plainText = newPlainText(str)
        XCTAssertEqual(plainText.size, label.sizeThatFits(maxSize), "")
    }

    func newPlainText(text: String) -> PlainText {
        let size = CGSizeMake(100, CGFloat.max)
        return PlainText(text: text, font: label.font, maxSize: size)
    }
}
