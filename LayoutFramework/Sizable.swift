//
//  Sizable.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public protocol Sizable {
    var size : CGSize { get }
    func calculateSize(maxSize: CGSize) -> CGSize
}

public let CGSizeMax = CGSizeMake(CGFloat.max, CGFloat.max)

/*
public struct AspectFit<T:Sizable> : Sizable {
    let content : T
    let maxSize : CGSize
    public var size : CGSize {
        let widthRatio = maxSize.width / content.size.width
        let heightRatio = maxSize.height / content.size.height
        let minRatio = min(widthRatio, heightRatio)
        let size = CGSizeApplyAffineTransform(content.size, CGAffineTransformMakeScale(minRatio, minRatio))
        return size
    }
    public init(content: T, maxSize: CGSize = CGSizeMax) {
        self.content = content
        self.maxSize = maxSize
    }
}

public struct AspectFill<T:Sizable> : Sizable {
    let content : T
    let maxSize : CGSize
    public var size : CGSize {
        let widthRatio = maxSize.width / content.size.width
        let heightRatio = maxSize.height / content.size.height
        let maxRatio = max(widthRatio, heightRatio)
        let size = CGSizeApplyAffineTransform(content.size, CGAffineTransformMakeScale(maxRatio, maxRatio))
        return size
    }
    public init(content: T, maxSize: CGSize = CGSizeMax) {
        self.content = content
        self.maxSize = maxSize
    }
}
*/
