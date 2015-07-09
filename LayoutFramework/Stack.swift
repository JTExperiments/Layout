//
//  VerticalStack.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public struct Inset {
    var top: CGFloat // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
    var left: CGFloat
    var bottom: CGFloat
    var right: CGFloat

    var height : CGFloat {
        return self.top + self.bottom
    }
    var width : CGFloat {
        return self.left + self.right
    }

    public init() {
        self.init(top: 0, left: 0, bottom: 0, right: 0)
    }

    public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }

    public func applyToSize(size: CGSize) -> CGSize {
        var newSize = size
        newSize.height += self.height
        newSize.width += self.width
        return newSize
    }

}

public class Stack : Sizable, Drawable {
    public private (set) var sizables : [Sizable]
    public private (set) var size : CGSize = CGSizeZero
    public private (set) var frames : [CGRect] = []
    public var count : Int {
        return self.sizables.count
    }
    public var inset : Inset = Inset() {
        didSet {
            self.reloadData()
        }
    }
    public var spacing : CGFloat = 0 {
        didSet {
            self.reloadData()
        }
    }

    public init(sizables : [Sizable], spacing: CGFloat = 0, inset: Inset = Inset()) {
        self.sizables = sizables
        self.spacing = spacing
        self.inset = inset
        self.reloadData()
    }

    public func framesInRect(rect: CGRect) -> [CGRect] {
        var frames : [CGRect] = []
        for (index, frame) in enumerate(self.frames) {
            if CGRectIntersectsRect(frame, rect) {
                frames.append(frame)
            }
        }
        return frames
    }

    // MARK: Private

    private func reloadData() {
        self.calculateSize()
        self.calculateFrames()
    }

    private func calculateSize() {
        // Override by subclass
    }

    private func calculateFrames() {
        // Override by subclass
    }

    // MARK: Drawable

    public func drawInRect(rect: CGRect) {
        for (index, frame) in enumerate(self.frames) {

//            if drawDebugFrame {
                UIColor.blueColor().setStroke()
                UIRectFrame(frame)
//            }

            if let drawable = self.sizables[index] as? Drawable {
                drawable.drawInRect(frame)
            }
            
        }
    }
}

public class HorizontalStack : Stack {

    private override func calculateSize() {
        var size = CGSizeZero
        for obj in self.sizables {
            size.width += obj.size.width
            size.height = max(size.height, obj.size.height)
        }
        size.width += (spacing * CGFloat(self.sizables.count - 1))
        size = inset.applyToSize(size)
        self.size = size
    }

    public override func calculateFrames() {
        let maxHeight : CGFloat = self.size.height - inset.height
        var frames : [CGRect] = []
        var lastFrame = CGRectMake(-spacing + inset.left, inset.top, 0, 0)
        for (index, obj) in enumerate(self.sizables) {
            var frame : CGRect = CGRectZero
            frame.origin = CGPoint(
                x:CGRectGetMaxX(lastFrame) + spacing,
                y:(maxHeight - obj.size.height) / 2 + inset.top
            )
            frame.size = obj.size
            lastFrame = frame
            frames.append(frame)
        }
        self.frames = frames
    }
}

public class VerticalStack : Stack {

    private override func calculateSize() {
        var size = CGSizeZero
        for obj in self.sizables {
            size.width = max(size.width, obj.size.width)
            size.height += obj.size.height
        }
        size.height += (spacing * CGFloat(self.sizables.count - 1))
        size = inset.applyToSize(size)
        self.size = size
    }

    public override func calculateFrames() {
        let maxWidth : CGFloat = self.size.width - inset.width
        var frames : [CGRect] = []
        var lastFrame = CGRectMake(inset.left, -spacing + inset.top, 0, 0)
        for (index, obj) in enumerate(self.sizables) {
            var frame : CGRect = CGRectZero
            frame.origin = CGPoint(
                x:(maxWidth - obj.size.width) / 2 + inset.left,
                y:CGRectGetMaxY(lastFrame) + spacing
            )
            frame.size = obj.size
            lastFrame = frame
            frames.append(frame)
        }
        self.frames = frames
    }

}

public class VerticalJustifiedStack : VerticalStack {

    public override func calculateFrames() {
        let maxWidth : CGFloat = self.size.width - inset.width
        var frames : [CGRect] = []
        var lastFrame = CGRectMake(inset.left, -spacing + inset.top, 0, 0)
        for (index, obj) in enumerate(self.sizables) {
            var frame : CGRect = CGRectZero
            frame.origin = CGPoint(
                x:inset.left,
                y:CGRectGetMaxY(lastFrame) + spacing
            )
            frame.size = CGSizeMake(maxWidth, obj.size.height)
            lastFrame = frame
            frames.append(frame)
        }
        self.frames = frames
    }

}

public class VerticalLeftAlignedStack : VerticalStack {

    public override func calculateFrames() {
        let maxWidth : CGFloat = self.size.width - inset.width
        var frames : [CGRect] = []
        var lastFrame = CGRectMake(inset.left, -spacing + inset.top, 0, 0)
        for (index, obj) in enumerate(self.sizables) {
            var frame : CGRect = CGRectZero
            frame.origin = CGPoint(
                x:inset.left,
                y:CGRectGetMaxY(lastFrame) + spacing
            )
            frame.size = obj.size
            lastFrame = frame
            frames.append(frame)
        }
        self.frames = frames
    }
}

public class VerticalRightAlignedStack : VerticalStack {

    public override func calculateFrames() {
        let maxWidth : CGFloat = self.size.width - inset.width
        var frames : [CGRect] = []
        var lastFrame = CGRectMake(inset.left, -spacing + inset.top, 0, 0)
        for (index, obj) in enumerate(self.sizables) {
            var frame : CGRect = CGRectZero
            frame.origin = CGPoint(
                x:(maxWidth - obj.size.width + inset.left),
                y:CGRectGetMaxY(lastFrame) + spacing
            )
            frame.size = obj.size
            lastFrame = frame
            frames.append(frame)
        }
        self.frames = frames
    }
}
