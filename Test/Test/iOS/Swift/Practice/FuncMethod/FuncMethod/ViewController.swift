//
//  ViewController.swift
//  FuncMethod
//
//  Created by Balaji Goud  on 3/15/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func functTest() {
        TestfunctTest()
    }
}


class test : ViewController{
   
}

func TestfunctTest() {
    print("testing function");
}