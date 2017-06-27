//
//  InitialViewController.swift
//  MVVM_SAMPLE
//
//  Created by Balaji Goud  on 3/29/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //         Get the new view controller using segue.destinationViewController.
        //         Pass the selected object to the new view controller.
        if segue.identifier == "ActionSegueIdentifier" {
            if let profileViewController = segue.destinationViewController as? ProfileViewController{
                profileViewController.profileViewModel = ProfileViewModel(withProfile: Profile())
            }
        }
    }


}


enum ProfileSection: Int {
    case Time, WarmUp, CoolDown, Count
    
    static var count = {
        return ProfileSection.Count.rawValue
    }
    
    static let sectionTitles = [
        Time: "Time",
        WarmUp: "Warm Up",
        CoolDown: "Cool Down"
    ]
    
    func sectionTitle() -> String {
        if let sectionTitle = ProfileSection.sectionTitles[self] {
            return sectionTitle
        } else {
            return ""
        }
    }
    
}