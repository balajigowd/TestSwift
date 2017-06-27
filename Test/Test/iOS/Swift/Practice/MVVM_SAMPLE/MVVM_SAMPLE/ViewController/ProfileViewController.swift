//
//  ProfileViewController.swift
//  MVVM_SAMPLE
//
//  Created by Balaji Goud  on 3/29/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileViewModel: ProfileViewModel!
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ProfileSection.count()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ProfileSection(rawValue: section) else { return 1 }
        
        switch section {
        default: return 1
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ProfileSection(rawValue: section) else { return "" }
        return section.sectionTitle()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let section = ProfileSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .Time:
            return cellForTimeSectionForRowAtIndexPath(indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    private func cellForTimeSectionForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("profileDefaultTableViewCell", forIndexPath: indexPath) as? profileDefaultTableViewCell else {
            return UITableViewCell()
        }
        
        cell.detailTextLabel?.text = ""
        cell.textLabel?.text = profileViewModel.timeForProfile()
        
        return cell
    }
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    }
    

}
