//
//  ViewController.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit
import LayoutFramework

class ViewController: UIViewController {

    @IBOutlet weak var stackView: StackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let plainTexts : [Sizable] = strings.map { str in
            let plainText : PlainText = PlainText(text: str, font: font, maxSize: CGSizeMake(maxWidth, CGFloat.max))
            return plainText
        }
    
        let stack : VerticalStack = VerticalStack(sizables: plainTexts, spacing: 0)
        stack.inset = Inset(top: 20, left: 20, bottom: 0, right: 0)
        stack.spacing = 10

        stackView.stack = stack
    }

}

