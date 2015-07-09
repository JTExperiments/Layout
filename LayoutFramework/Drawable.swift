//
//  Drawable.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public protocol Drawable {
    func drawInRect(rect: CGRect)
}


extension PlainText : Drawable {
    public func drawInRect(rect: CGRect) {
        self.attributedString.drawInRect(rect)
    }
}
