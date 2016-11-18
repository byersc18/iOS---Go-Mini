//
//  YourQuoteViewController.swift
//  Go Mini V3
//
//  Created by Cameron Byers on 6/22/16.
//  Copyright © 2016 Go Mini. All rights reserved.
//

import UIKit

class YourQuoteViewController: UIViewController {
    
    
    @IBOutlet weak var sizePrice: UILabel!
    @IBOutlet weak var months: UILabel!
    @IBOutlet weak var deliveryFee: UILabel!
    @IBOutlet weak var deliveryFee2: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tax: UILabel!

    @IBOutlet weak var scrollView: UIScrollView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 667
        
        deliveryFee.text = deliveryPrice
        
        if use == "Moving" {
            let x = 2 * Int(deliveryPriceTwo)!
            deliveryFee2.text = String(x)
        }
        else {
            deliveryFee2.text = deliveryPrice
        }
        
        var totalPrice = 0
        if size == "12ft" {
            if companyTwelve != "" {
                sizePrice.text = companyTwelve
                totalPrice = Int(companyTwelve)! * Int(numMonths)! + Int(deliveryFee.text!)! + Int(deliveryFee2.text!)!
            }
            else {
                sizePrice.text = "149"
                totalPrice = 149 * Int(numMonths)! + Int(deliveryFee.text!)! + Int(deliveryFee2.text!)!
            }
        }
        else if size == "16ft" {
            if companySixteen != "" {
                sizePrice.text = companySixteen
                totalPrice = Int(companySixteen)! * Int(numMonths)! + Int(deliveryFee.text!)! + Int(deliveryFee2.text!)!
            }
            else {
                sizePrice.text = "164"
                totalPrice = 164 * Int(numMonths)! + Int(deliveryFee.text!)! + Int(deliveryFee2.text!)!
            }
        }
        else {
            if companyTwenty != "" {
                sizePrice.text = companyTwenty
                totalPrice = Int(companyTwenty)! * Int(numMonths)! + Int(deliveryFee.text!)! + Int(deliveryFee2.text!)!
            }
            else {
                sizePrice.text = "169"
                totalPrice = 169 * Int(numMonths)! + Int(deliveryFee.text!)! + Int(deliveryFee2.text!)!
            }
        }
        deliveryFee.text = "$" + deliveryFee.text! + ".00"
        deliveryFee2.text = "$" + deliveryFee2.text! + ".00"
        let taxPrice = Double(totalPrice) * 0.07
        tax.text = "$" + String(taxPrice)
        let t = Double(totalPrice) * 1.07
        sizePrice.text = "$" + sizePrice.text! + ".00"
        months.text = sizePrice.text
        total.text = "$" + String(t)
        cPrice = sizePrice.text!
        quoteTotal = total.text!
        

        if tax.text!.substringFromIndex(tax.text!.endIndex.predecessor().predecessor()).substringToIndex(tax.text!.startIndex.successor()) == "." {
            tax.text! = tax.text! + "0"
        }
        if total.text!.substringFromIndex(total.text!.endIndex.predecessor().predecessor()).substringToIndex(total.text!.startIndex.successor()) == "." {
            total.text! = total.text! + "0"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

    
    
    
    @IBAction func continueWithReservation(sender: UIButton) {
        if use == "Storage" {
            let resultController = storyboard!.instantiateViewControllerWithIdentifier("Storage") as? StorageViewController
            presentViewController(resultController!, animated: true, completion: nil)
        }
        else {
            let resultController = storyboard!.instantiateViewControllerWithIdentifier("Moving") as? MovingViewController
            presentViewController(resultController!, animated: true, completion: nil)
        }
    }
    
}
