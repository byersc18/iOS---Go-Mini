//
//  LoginView.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 6/24/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    @IBAction func checkPassword(sender: UIButton) {
        for companies in comp {
            if password.text == companies.password {
                companyTwelve = companies.twelve
                companySixteen = companies.sixteen
                companyTwenty = companies.twenty
                companyTitle = companies.title
                
                
                let resultController = storyboard!.instantiateViewControllerWithIdentifier("LoginSuccess") as? LoginSuccessViewController
                presentViewController(resultController!, animated: true, completion: nil)
                
            }
        }
    }

    
    
    
}
