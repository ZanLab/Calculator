//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 15.03.2021.
//  Copyright © 2021 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var prevNum: Double = 0
    var operationStatus: Bool = false
    var operationInput = 0
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if operationStatus == true {
            result?.text = String(sender.tag)
            numberOnScreen = Double(result.text!)!
            operationStatus = false
        }
        else {
            result.text = result.text! + String(sender.tag)
            numberOnScreen = Double(result.text!)! }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        
        if result.text!.isEmpty == false && sender.tag >= 12 && sender.tag <= 15 {
            prevNum = Double(result.text!)!
            operationInput = sender.tag
            operationStatus = true
            
        }
        else if sender.tag == 16 {
            if operationInput == 12 {
                result.text = String(prevNum / numberOnScreen)
            }
            if operationInput == 13 {
                result.text = String(prevNum * numberOnScreen)
            }
            if operationInput == 14 {
                result.text = String(prevNum - numberOnScreen)
            }
            if operationInput == 15 {
                result.text = String(prevNum + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            result.text = ""
            numberOnScreen = 0
            prevNum = 0
            operationInput = 0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
