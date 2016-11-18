//
//  SelectSizeViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 6/22/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit

class SelectSizeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func back(sender: UIButton) {
        if loginQuote == true {
            let resultController = storyboard!.instantiateViewControllerWithIdentifier("Commercial") as? LoginQuoteViewController
            presentViewController(resultController!, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonOne(sender: UIButton) {
        size = "12ft"
    }
    
    
    @IBAction func buttonTwo(sender: UIButton) {
        size = "16ft"
    }
    
    @IBAction func buttonThree(sender: UIButton) {
        size = "20ft"
    }
    
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
