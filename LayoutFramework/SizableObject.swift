//
//  SizableObject.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public struct SizableObject : Sizable, Equatable {
    public var size : CGSize
    public init(size: CGSize) {
        self.size = size
    }
}

public func == (lhs: SizableObject, rhs: SizableObject) -> Bool {
    return lhs.size == rhs.size
}