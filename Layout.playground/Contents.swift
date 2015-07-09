//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import LayoutFramework

var str = "Hello World5"

let width = 100
let label = UILabel(frame: CGRectMake(0, 0, 100, 0))
label.text = str
label.font = UIFont.systemFontOfSize(17)
label.numberOfLines = 0
let size = label.sizeThatFits(CGSizeMake(100, CGFloat.max))
label.frame = CGRectMake(0, 0, size.width, size.height)
label

XCPShowView("label", label)

let plainText = PlainText(text: str, font: label.font, maxSize: CGSizeMake(100, CGFloat.max))

plainText.size

let aspectFit : AspectFit<PlainText> = AspectFit(content: plainText, maxSize: CGSizeMake(50, 50))

aspectFit.size

let aspectFill : AspectFill<PlainText> = AspectFill(content: plainText, maxSize: CGSizeMake(50, 50))

aspectFill.size

let stack : VerticalStack = VerticalStack(sizables: [plainText, plainText], spacing: 0)
