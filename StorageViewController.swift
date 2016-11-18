//
//  StorageViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 6/16/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//


import UIKit
import MessageUI

class StorageViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var storeLocationField: UISegmentedControl!
    @IBOutlet weak var sStreetField: UITextField!
    @IBOutlet weak var sCityField: UITextField!
    @IBOutlet weak var sZipField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 667
        scrollView.userInteractionEnabled = true
        let select: Selector = #selector(StorageViewController.Tap)
        let tapGesture = UITapGestureRecognizer(target: self, action: select)
        tapGesture.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func Tap() {
        self.view.endEditing(true)
    }
    
    
    
    //Sending Email
    @IBAction func sendEmail(sender: UIButton) {
        if  sStreetField.text == "" || sCityField.text == "" || sZipField.text == "" {
            let alertController = UIAlertController(title: "Missing Input", message: "You must enter all the required information.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            storeLocation = storeLocationField.titleForSegmentAtIndex(storeLocationField.selectedSegmentIndex)!
            sStreet = sStreetField.text!
            sCity = sCityField.text!
            sZip = sZipField.text!
            
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            }
            else {
                self.showSendMailErrorAlert()
            }
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        if loginQuote == true {
            let quoteString: String = "Thank you for reserving your Go Mini’s container(s). Please ensure the information below is correct regarding your container. We will contact you within (2)hours to discuss the reservation further. As a preferred customer we strive to make this a fast, easy process for you and your team. Thank you for choosing Go Mini’s Portable Storage. It is a pleasure to serve you." + "\n" + "\n" + "Company: " + companyTitle + "\n" + "Job#: " + jobNumber + "\n" + "Container Used For: " + use + "\n" + "Size of Container: " + size + "\n" + "Store Location: " + storeLocation + "\n" + "Number of Months: " + numMonths + "\n" + "Address: " + sStreet + ", " + sCity + ", " + sZip + "\n" + "Quote Price: " + quoteTotal + "\n" + "Notes: " + notes
            
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
            mailComposerVC.setToRecipients(["columbus@gominis.com"])
            mailComposerVC.setSubject("Go Mini Quote")
            mailComposerVC.setMessageBody(quoteString, isHTML: false)
            
            return mailComposerVC
        }
        else {
            let quoteString: String = "Thank you for visiting the Go Mini’s Portable Storage App. At Go Mini’s, we are 100% committed to meeting your needs. One of our team members will reply within 24-hours. If you need additional assistance. Please contact us at: 614.864.9181." + "\n" + "\n" + "Name: " + name + "\n" + "Email: " + email + "\n" + "Phone Number: " + number + "\n" + "Promotional Code: " + code + "\n" + "Container Used For: " + use + "\n" + "Size of Container: " + size + "\n" + "Address: " + storeLocation + "\n" + "Number of Months: " + numMonths + "\n" + "Their Location: " + sStreet + ", " + sCity + ", " + sZip + "\n" + "Quote Price: " + quoteTotal
            
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
            mailComposerVC.setToRecipients(["columbus@gominis.com", email])
            mailComposerVC.setSubject("Go Mini Quote")
            mailComposerVC.setMessageBody(quoteString, isHTML: false)
            
            return mailComposerVC
        }
        
    }
    
    func showSendMailErrorAlert() {
        NSLog("The email could not send")
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //-------------------------------------------------------
    
}
