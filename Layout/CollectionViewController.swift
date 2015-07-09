//
//  CollectionViewController.swift
//  Layout
//
//  Created by James Tang on 9/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit
import LayoutFramework

let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var stacks : [Stack] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.registerClass(StackCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        self.reloadData()
    }

    func reloadData() {
        let plainTexts : [Sizable] = strings.map { str in
            let plainText : PlainText = PlainText(text: str, font: font, maxSize: CGSizeMake(self.view.frame.size.width - 20, CGFloat.max))
            return plainText
        }

        self.stacks = plainTexts.map { sizable in
            return HorizontalStack(sizables: [sizable], spacing: 0, inset: Inset(top: 0, left: 10, bottom: 0, right: 0))
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.stacks.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! StackCollectionViewCell

        let stack = self.stacks[indexPath.row]
        cell.backgroundColor = UIColor.whiteColor()
        cell.stack = stack

        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let stack = self.stacks[indexPath.row]
        var size = stack.size
        size.width = self.view.frame.size.width
        return size
    }
}
