//
//  FlexibleObject.swift
//  Layout
//
//  Created by James Tang on 10/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public class FlexibleObject : Sizable {

    public var size : CGSize {
        let total = volume.width * volume.height
        if maxSize.width * maxSize.height < total {
            return maxSize
        } else if maxSize.width < volume.width {
            var height = ceil(total / maxSize.width)
            return CGSizeMake(maxSize.width, height)
        } else if maxSize.height < volume.height {
            var width = ceil(total / maxSize.height)
            return CGSizeMake(width, maxSize.height)
        } else {
            return volume
        }
    }

    public private (set) var volume : CGSize
    public var maxSize : CGSize

    public init(volume: CGSize, maxSize: CGSize = CGSizeMax) {
        self.volume = volume
        self.maxSize = maxSize
    }

    public func calculateSize(externalMaxSize: CGSize) -> CGSize {
        self.maxSize = CGSize(
            width: min(externalMaxSize.width, self.maxSize.width),
            height: min(externalMaxSize.height, self.maxSize.height)
        )
        return self.size
    }
}
