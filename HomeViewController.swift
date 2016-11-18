//
//  ViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 6/14/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
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
    
    
    
    
    
    //Link to Websites
    @IBAction func goToFacebook(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/GoMinisCO")!)
    }
    
    @IBAction func goToTwitter(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/go_minis")!)
    }
    
    @IBAction func goToGooglePlus(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://plus.google.com/+Gominis")!)
    }
    
    @IBAction func goToPackingSupplies(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.gominisboxes.com")!)
    }
    
    @IBAction func goToLoadingAssistance(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.hireahelper.com")!)
    }
    //---------------------------------------------------

}

