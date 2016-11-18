//
//  ContainerIssueViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 6/15/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit
import MessageUI

class ContainerIssueViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var issueField: UITextView!
    
    var picture: UIImage = UIImage()
    
    @IBAction func back(sender: UIButton) {
        if loggedIn == true {
            let resultController = storyboard!.instantiateViewControllerWithIdentifier("LoginSuccess") as? LoginSuccessViewController
            presentViewController(resultController!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 667
        scrollView.userInteractionEnabled = true
        let select: Selector = #selector(ContainerIssueViewController.Tap)
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
    
    
    
    
    
    //Getting a Photo
    @IBAction func addPhoto(sender: UIButton) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picture = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        dismissViewControllerAnimated(true, completion: nil)
    }
    //----------------------------------------------
    
    
    //Sending Email
    @IBAction func submit(sender: UIButton) {
        if issueField.text == "" || nameField.text == "" || phoneNumberField.text == "" {
            let alertController = UIAlertController(title: "Missing Input", message: "You must enter all the required information.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let complaint: String = "Thank you for visiting the Go Mini’s Portable Storage App. At Go Mini’s, we are 100% committed to meeting your needs. One of our team members will reply within 24-hours. In an effort to monitor and improve customer satisfaction at Go Mini’s, we would like to inform you we take all feedback seriously, and will reply to your concern as soon as possible. We appreciate your concern and hope to keep your future business. Please allow us some time to investigate your issue and determine a suitable solution. Thank you again for choosing Go Mini’s Portable Storage." + "\n" + "Name: " + nameField.text! + "\n" + "Phone Number: " + phoneNumberField.text! + "\n" + issueField.text
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        mailComposerVC.setToRecipients(["columbus@gominis.com"])
        mailComposerVC.setSubject("Contact Go Mini")
        mailComposerVC.setMessageBody(complaint, isHTML: false)
        
        let image = UIImageJPEGRepresentation(picture, 1.0)
        if image != nil {
            mailComposerVC.addAttachmentData(image!, mimeType: "image/jpeg", fileName: "ComplaintPicture.jpeg")
        }

        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        NSLog("The email could not send")
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //-----------------------------------------------

}
