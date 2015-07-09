//
//  PlainText.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import CoreText

public class PlainText : Sizable {
    let text : String
    let font : UIFont
    var maxSize : CGSize
    var attributedString : NSAttributedString {
        return NSAttributedString(string: self.text, attributes: [NSFontAttributeName:self.font])
    }

    struct Static {
        static let label : UILabel = UILabel()
    }
    public var size : CGSize {
        let string : NSString = self.text
        /* CoreText sizing wasn't matching exactly */
//        let frameSetter = CTFramesetterCreateWithAttributedString(self.attributedString)
//        var size = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, string.length), nil, maxSize, nil)
//        size.width = ceil((size.width + 0.5) * 2) / 2
//        size.height = ceil((size.height + 0.5) * 2) / 2

        /* CoreText sizing wasn't matching exactly */
        Static.label.font = self.font
        Static.label.text = self.text
        Static.label.numberOfLines = 0
        Static.label.preferredMaxLayoutWidth = maxSize.width
        var size = Static.label.sizeThatFits(maxSize)
        return size
    }

    public init(text: String, font: UIFont, maxSize: CGSize = CGSizeMax) {
        self.text = text
        self.font = font
        self.maxSize = maxSize
    }

    public func calculateSize(externalMaxSize: CGSize) -> CGSize {
        self.maxSize = CGSize(
            width: min(self.maxSize.width, externalMaxSize.width),
            height: min(self.maxSize.height, externalMaxSize.height)
            )
        return self.size
    }
}
