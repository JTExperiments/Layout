//
//  StackCollectionViewLayout.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

public class StackCollectionViewLayout: UICollectionViewLayout {

    public var stack : Stack? {
        didSet {
            self.invalidateLayout()
        }
    }

    public override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        let frames = stack?.framesInRect(rect) ?? []

        var attributes = [UICollectionViewLayoutAttributes]()
        for (index, frame) in enumerate(frames) {
            let item = find(stack!.frames, frame)!
            let attribute : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: item, inSection: 0))
            attribute.frame = frame
            attributes.append(attribute)
        }
        return attributes
    }

    public override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {

        let attribute : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)

        let frame = stack?.frames[indexPath.row] ?? CGRectZero
        attribute.frame = frame
        return attribute
    }

    public override func collectionViewContentSize() -> CGSize {
        var size = self.stack?.size ?? CGSizeZero
        return size
    }

}
