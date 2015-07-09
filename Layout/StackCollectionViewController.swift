//
//  StackCollectionViewController.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit
import LayoutFramework

class StackCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var stack : Stack?
    var selectedSegmentIndex : Int = 0

    @IBOutlet weak var stackLayout: StackCollectionViewLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.registerClass(StackCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        self.reloadData()
    }

    func reloadData() {

        switch (self.selectedSegmentIndex) {
        case 0...3:
            let plainTexts : [Sizable] = strings.map { str in
                let plainText : PlainText = PlainText(text: str, font: font, maxSize: CGSizeMake(self.view.frame.size.width - 0, CGFloat.max))
                return plainText
            }

            switch (self.selectedSegmentIndex) {
            case 0:
                self.stack = VerticalStack(sizables: plainTexts, spacing: 10, inset: Inset(top: 20, left: 0, bottom: 10, right: 0))
            case 1:
                self.stack = VerticalLeftAlignedStack(sizables: plainTexts, spacing: 10, inset: Inset(top: 20, left: 0, bottom: 10, right: 0))
            case 2:
                self.stack = VerticalJustifiedStack(sizables: plainTexts, spacing: 10, inset: Inset(top: 20, left: 0, bottom: 10, right: 0))
            case 3:
                self.stack = VerticalRightAlignedStack(sizables: plainTexts, spacing: 10, inset: Inset(top: 20, left: 0, bottom: 10, right: 0))
            default:
                break
            }
        default:
            let plainTexts : [Sizable] = strings.map { str in
                let plainText : PlainText = PlainText(text: str, font: font, maxSize: CGSizeMake(300, CGFloat.max))
                return plainText
            }

            self.stack = HorizontalStack(sizables: plainTexts, spacing: 10, inset: Inset(top: 20, left: 10, bottom: 20, right: 10))
        }

        self.stackLayout.stack = self.stack
        self.collectionView?.reloadData()
    }

    @IBAction func segmentValueDidChange(sender: UISegmentedControl) {
        self.selectedSegmentIndex = sender.selectedSegmentIndex
        self.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.stack?.count ?? 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! StackCollectionViewCell

        if let stack = self.stack?.sizables[indexPath.row] {
            cell.backgroundColor = UIColor.whiteColor()
            cell.stack = HorizontalStack(sizables: [stack], spacing: 0, inset: Inset(top: 0, left: 0, bottom: 0, right: 0))
        }

        return cell
    }

}
