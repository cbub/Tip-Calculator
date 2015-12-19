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
        billAmount.becomeFirstResponder();
        // Do any additional setup after loading the view, typically from a nib.
        totalBill.text = "$0.00";
        let defaults = NSUserDefaults.standardUserDefaults()
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
        if(maxValue != nil){
            slider.maximumValue = (maxValue as! NSString).floatValue
        }
        else{
            slider.maximumValue = 30
        }
        if(minValue != nil){
            slider.minimumValue = (minValue as! NSString).floatValue
        }
        else{
            slider.minimumValue = 15
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        billAmount.becomeFirstResponder();
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.objectForKey("default_tip")
        let maxValue = defaults.objectForKey("max_tip")
        let minValue = defaults.objectForKey("min_tip")
        
        if(tipValue != nil){
            tipPercentage.text = "\(tipValue as! String)%"
            slider.setValue((tipPercentage.text! as NSString).floatValue, animated: true)
        }
        else{
            tipPercentage.text = "18%"
            slider.setValue((tipPercentage.text! as NSString).floatValue, animated: true)
        }
        if(maxValue != nil){
            slider.maximumValue = (maxValue as! NSString).floatValue
        }
        else{
            slider.maximumValue = 30
        }
        if(minValue != nil){
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


}

