//
//  GetQuoteOneViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 6/16/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit

class GetQuoteOneViewController: UIViewController {
    
    @IBOutlet weak var useField: UISegmentedControl!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var monthsField: UITextField!
    @IBOutlet weak var fromZipField: UITextField!
    @IBOutlet weak var toZipField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 667
        scrollView.userInteractionEnabled = true
        let select: Selector = #selector(GetQuoteOneViewController.Tap)
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
    
    
    
    @IBAction func continueQuote(sender: UIButton) {
        
        if nameField.text == "" || emailField.text == "" || numberField.text == "" || monthsField.text == "" || fromZipField.text == "" || (useField.titleForSegmentAtIndex(useField.selectedSegmentIndex) == "Moving" && toZipField.text == "") {
                let alertController = UIAlertController(title: "Missing Input", message: "You must enter all the required information.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if Int(fromZipField.text!)! < 43001 || Int(fromZipField.text!)! > 45999 || (useField.titleForSegmentAtIndex(useField.selectedSegmentIndex) == "Moving" && (Int(toZipField.text!)! < 43001 || Int(toZipField.text!)! > 45999)) {
            let alertController = UIAlertController(title: "To Far Away", message: "Sorry, but the zip you entered is not in our operating range.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if useField.titleForSegmentAtIndex(useField.selectedSegmentIndex) == "Storage" && toZipField.text != "" {
            let alertController = UIAlertController(title: "Incorrect Input", message: "If Storage selected dont enter a End Zip.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            
            name = nameField.text!
            email = emailField.text!
            number = numberField.text!
            code = codeField.text!
            numMonths = monthsField.text!
            fromZip = fromZipField.text!
            toZip = toZipField.text!
            use = useField.titleForSegmentAtIndex(useField.selectedSegmentIndex)!
            
            var url: NSURL!
            if use == "Storage" {
                url = NSURL(string: "https://www.zipcodeapi.com/rest/mZy4QGg3ETrXeAb2wVK2fksk4xt0UeGhefl4WC7AvzxK9IMGExITRaeWIIWCWDUb/distance.json/" + "\(storageZip)" + "/" + "\(fromZip)" + "/mile")
                
                let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                    var dString = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    dString = dString.substringFromIndex(dString.startIndex.advancedBy(21))
                    dString = dString.substringToIndex(dString.startIndex.advancedBy(3))
                    if dString[dString.startIndex.advancedBy(2)] == "." {
                        dString = dString.substringToIndex(dString.startIndex.advancedBy(2))
                    }
                    distance = Int(Double(dString)!)
                    print(String(distance))
                    
                    if distance <= 25 {
                        deliveryPrice = "59"
                    }
                    else if distance <= 49 {
                        deliveryPrice = "79"
                    }
                    else if distance <= 74 {
                        deliveryPrice = "99"
                    }
                    else {
                        deliveryPrice = String(Int(Double(distance) * 2.5))
                    }
                    
                }
                
                task.resume()
            }
            else {
                url = NSURL(string: "https://www.zipcodeapi.com/rest/mZy4QGg3ETrXeAb2wVK2fksk4xt0UeGhefl4WC7AvzxK9IMGExITRaeWIIWCWDUb/distance.json/" + "\(storageZip)" + "/" + "\(fromZip)" + "/mile")
                
                let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                    var dString = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    dString = dString.substringFromIndex(dString.startIndex.advancedBy(21))
                    dString = dString.substringToIndex(dString.startIndex.advancedBy(3))
                    if dString[dString.startIndex.advancedBy(2)] == "." {
                        dString = dString.substringToIndex(dString.startIndex.advancedBy(2))
                    }
                    distance = Int(Double(dString)!)
                    print(String(distance))
                    
                    if distance <= 25 {
                        deliveryPrice = "59"
                    }
                    else if distance <= 49 {
                        deliveryPrice = "79"
                    }
                    else if distance <= 74 {
                        deliveryPrice = "99"
                    }
                    else {
                        deliveryPrice = String(Int(Double(distance) * 2.5))
                    }
                    
                }
                
                task.resume()
                
                url = NSURL(string: "https://www.zipcodeapi.com/rest/mZy4QGg3ETrXeAb2wVK2fksk4xt0UeGhefl4WC7AvzxK9IMGExITRaeWIIWCWDUb/distance.json/" + "\(storageZip)" + "/" + "\(toZip)" + "/mile")
                
                let taskTwo = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                    var dString = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    dString = dString.substringFromIndex(dString.startIndex.advancedBy(21))
                    dString = dString.substringToIndex(dString.startIndex.advancedBy(3))
                    if dString[dString.startIndex.advancedBy(2)] == "." {
                        dString = dString.substringToIndex(dString.startIndex.advancedBy(2))
                    }
                    distanceTwo = Int(Double(dString)!)
                    print(String(distanceTwo))
                    
                    if distanceTwo <= 25 {
                        deliveryPriceTwo = "59"
                    }
                    else if distanceTwo <= 49 {
                        deliveryPriceTwo = "79"
                    }
                    else if distanceTwo <= 74 {
                        deliveryPriceTwo = "99"
                    }
                    else {
                        deliveryPriceTwo = String(Int(Double(distanceTwo) * 2.5))
                    }
                    
                }
                
                taskTwo.resume()
            }
            
        }
        
    }
    
    
    
}
