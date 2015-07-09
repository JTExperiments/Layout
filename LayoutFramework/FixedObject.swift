//
//  FixedObject.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public struct FixedObject : Sizable {
    public var size : CGSize
    public init(size: CGSize) {
        self.size = size
    }
    public func calculateSize(maxSize: CGSize) -> CGSize {
        var size = CGSize(
            width: min(maxSize.width, self.size.width),
            height: min(maxSize.height, self.size.height)
        )
        return size
    }
}
