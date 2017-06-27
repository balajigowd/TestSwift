//
//  TableViewCell.swift
//  HorVerticalScroll
//
//  Created by Balaji Goud  on 4/3/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.reloadData()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int

    {
    return 1;
    }
    
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
    
    return 10;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell : CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.viewColor.layer.borderColor = UIColor.redColor().CGColor
        cell.viewColor.layer.borderWidth = 2
        cell.viewColor.layer.masksToBounds = true
        cell.lblNumber.text = "\(self.tag+1).\(indexPath.row+1)"
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.bounds.width, self.bounds.height)
    }
}
