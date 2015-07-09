//
//  StackCollectionViewCell.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

public class StackCollectionViewCell: UICollectionViewCell {

    private var stackView : StackView!
    public var stack : Stack! {
        didSet {
            self.stackView.stack = stack
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureStackView()
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        self.configureStackView()
    }

    private func configureStackView() {
        self.stackView = StackView(frame: self.bounds)
        self.stackView.backgroundColor = UIColor.whiteColor()
        self.stackView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.addSubview(self.stackView)
    }
}
