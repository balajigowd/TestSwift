//
//  ImagePickerController.swift
//  ApiReference
//
//  Created by Balaji Goud  on 3/16/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ImagePickerController: UIViewController {

    @IBOutlet weak var btnSelectImage: UIButton!
    @IBOutlet weak var imageSelected: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSelectImageClicked(sender: AnyObject) {
        ImagePicker.OpenActionSheetToPickImage(self) { (selectedImage) in
            self.btnSelectImage.setTitle("", forState: UIControlState.Normal)
            self.imageSelected.image = selectedImage
        }
    }

    /*
    // MARK: - Navigation
   // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
