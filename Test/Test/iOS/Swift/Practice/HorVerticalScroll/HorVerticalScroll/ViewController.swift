//
//  ViewController.swift
//  HorVerticalScroll
//
//  Created by Balaji Goud  on 4/3/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        UITableView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        cell.tag = indexPath.row
        cell.collectionView.scrollToItemAtIndexPath(NSIndexPath/, atScrollPosition: <#T##UICollectionViewScrollPosition#>, animated: <#T##Bool#>)
        cell.collectionView.reloadData()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return tableView.bounds.height
    }
}

