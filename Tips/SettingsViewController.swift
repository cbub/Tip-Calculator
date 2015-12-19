//
//  SettingsViewController.swift
//  Tips
//
//  Created by Cassie Bub on 12/16/15.
//  Copyright © 2015 Cassie Bub. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UITextField!
    @IBOutlet weak var maxTip: UITextField!
    @IBOutlet weak var minTip: UITextField!

    @IBAction func maxEditingDidChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(maxTip.text, forKey: "max_tip")
        defaults.synchronize()
    }
  
    @IBAction func minEditingDidChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(minTip.text, forKey: "min_tip")
        defaults.synchronize()
    }
    @IBAction func defaultEditingDidChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(defaultTip.text, forKey: "default_tip")
        defaults.synchronize()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.objectForKey("default_tip")
        let maxValue = defaults.objectForKey("max_tip")
        let minValue = defaults.objectForKey("min_tip")
        
        if(tipValue != nil){
            defaultTip.text = "\(tipValue as! String)%"
            
        }
        else{
            defaultTip.text = "18%"
        }
        if(maxValue != nil){
            maxTip.text = "\(maxValue as! String)%"
        }
        else{
            maxTip.text = "30%"
        }
        if(minValue != nil){
            minTip.text = "\(minValue as! String)%"
        }
        else{
            maxTip.text = "15%"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
