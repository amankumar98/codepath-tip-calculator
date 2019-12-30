//
//  ViewController.swift
//  Tip3
//
//  Created by Aman Kumar on 12/21/19.
//  Copyright © 2019 Aman Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
   

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBAction func numbers(_ sender: UIButton)
       {
           billField.text = billField.text! + String(sender.tag-1)
        numberOnScreen = Double(billField.text!)!
        
        if sender.tag < 11 {
            calculateTip(numberOnScreen)
        }
        
       }
       

    @IBAction func buttons(_ sender: UIButton) {
        
        if sender.tag == 11
        {
            billField.text = ""
            numberOnScreen = 0;
        }
        
        else if sender.tag == 12 {
            billField.text = billField.text! + String(".")
            numberOnScreen = Double(billField.text!)!
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    
    
}

