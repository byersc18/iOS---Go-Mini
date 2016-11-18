//
//  StorageCalculatorViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 8/7/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit

class StorageCalculatorViewController: UIViewController {
    
    @IBOutlet weak var scrollViewMain: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollViewMain.contentSize.height = 667
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
}
