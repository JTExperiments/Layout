//
//  StackView.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

public class StackView : UIView {

    public var drawDebugFrame : Bool = false

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    func commonInit() {
        self.contentMode = UIViewContentMode.Redraw
    }

    public var stack : Stack! = Stack(sizables: []) {
        didSet {
            self.setNeedsDisplay()
        }
    }

    public override func drawRect(rect: CGRect) {
        self.stack.drawInRect(rect)
    }

}