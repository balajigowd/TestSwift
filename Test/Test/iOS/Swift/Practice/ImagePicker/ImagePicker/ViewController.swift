//
//  ViewController.swift
//  ImagePicker
//
//  Created by Balaji Goud  on 4/20/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnSelectImageClicked(sender: AnyObject) {
        ImagePicker.OpenActionSheetToPickImage(self) { (selectedImage) in
            self.imageView.image = selectedImage;
        }
    }
}

