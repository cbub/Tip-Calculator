//
//  ViewController.swift
//  Tips
//
//  Created by Cassie Bub on 12/12/15.
//  Copyright © 2015 Cassie Bub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderValueChanged(sender: AnyObject) {
        let num = slider.value
        tipPercentage.text = "\(NSString(format:"%.0f", num))%"
        let tip = NSString(string: billAmount.text!).doubleValue * (NSString(string: tipPercentage.text!).doubleValue * 0.01)
        tipAmount.text = String(format:"$%.02f", tip)
        let total = tip + NSString(string: billAmount.text!).doubleValue
        totalBill.text = String(format:"$%.02f", total)
        
    }
    @IBOutlet weak var tipPercentage: UILabel!
    
    @IBAction func billAmountEditingChanged(sender: AnyObject) {
        let tip = NSString(string: billAmount.text!).doubleValue * (NSString(string: tipPercentage.text!).doubleValue * 0.01)
        tipAmount.text = String(format:"$%.02f", tip)
        let total = tip + NSString(string: billAmount.text!).doubleValue
        totalBill.text = String(format:"$%.02f", total)
    }
    
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let previousDate = defaults.objectForKey("date")
        let date = NSDate()
        if(previousDate != nil){
            if(abs(date.timeIntervalSinceDate(previousDate as! NSDate)) <= 600){
                let bill = defaults.objectForKey("bill_amount")
                if(bill != nil && (bill as! String) != ""){
                    view.endEditing(true)
                    let billDouble = NSString(string: bill as! String).doubleValue
                    billAmount.text = String(format:"$%.02f", billDouble)
                    let tip = NSString(string: bill as! String).doubleValue * (NSString(string: tipPercentage.text!).doubleValue * 0.01)
                    tipAmount.text = String(format:"$%.02f", tip)
                    let total = tip + billDouble
                    totalBill.text = String(format:"$%.02f", total)
                }else{billAmount.becomeFirstResponder()}
            }else {billAmount.becomeFirstResponder()}
        }else {billAmount.becomeFirstResponder()}
        
        defaults.setObject(date, forKey: "date")
        defaults.synchronize()
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(billAmount.text, forKey: "bill_amount")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        // Do any additional setup after loading the view, typically from a nib.
        let tipValue = defaults.objectForKey("default_tip")
        let maxValue = defaults.objectForKey("max_tip")
        let minValue = defaults.objectForKey("min_tip")
        
        if(tipValue != nil){
            tipPercentage.text = "\(tipValue as! String)%"
            
        }
        else{
            tipPercentage.text = "18%"
            slider.setValue((tipPercentage.text! as NSString).floatValue, animated: true)
        }
        if(maxValue != nil && (maxValue as! NSString) != ""){
            slider.maximumValue = (maxValue as! NSString).floatValue
        }
        else{
            slider.maximumValue = 30
        }
        if(minValue != nil && (minValue as! NSString) != ""){
            slider.minimumValue = (minValue as! NSString).floatValue
        }
        else{
            slider.minimumValue = 15
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }


}

