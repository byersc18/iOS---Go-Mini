//
//  SCSixteenViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 8/8/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit

class SCSixteenViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 667
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
}
