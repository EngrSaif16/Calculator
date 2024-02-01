//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook Pro on 01/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
       var firstNum: String = ""
       var secondNum: String = ""
       var operation: String = ""
       var haveResult: Bool = false
       var resultNumber: String = ""
       var numAfterResult: String = ""
       
    
    
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    
    
    @IBAction func multiply(_ sender: Any) {
        operation = "x"
    }
    
    
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    
    
    @IBAction func percent(_ sender: Any) {
        operation = "%"
    }
    
    
    @IBAction func alterSign(_ sender: Any) {
        operation = "+/-"
    }
    
    
    @IBAction func equals(_ sender: Any) {
        resultNumber = String(doOperation())
        numOnScreen.text = resultNumber
        
        let numArray = resultNumber.components(separatedBy: ".")
        if numArray[1] == "0"
        {
            numOnScreen.text = numArray[0]
        }
        else {
            numOnScreen.text = resultNumber
        }
        numAfterResult = ""
    }
    
    @IBOutlet weak var numOnScreen: UILabel!
    
    @IBOutlet var calcButtons: [UIButton]!
    
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum
        }
        else if operation != "" && !haveResult{
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
        }
        else if operation != "" && haveResult{
            numAfterResult += String(sender.tag)
            numOnScreen.text = numAfterResult
        }
    }
    
    @IBAction func decimalPressed(_ sender: Any) {
        if operation == "" {
        if !firstNum.contains(".") {
            firstNum += "."
            numOnScreen.text = firstNum
            }
        } else if operation != "" && !haveResult {
            if !secondNum.contains(".") {
                secondNum += "."
                numOnScreen.text = secondNum
            }
        } else if operation != "" && haveResult {
            if !numAfterResult.contains(".") {
                numAfterResult += "."
                numOnScreen.text = numAfterResult
            }
        }
    }
    @IBAction func clear(_ sender: Any) {
        
        firstNum = ""
        secondNum = ""
        operation = ""
        haveResult = false
        resultNumber = ""
        numAfterResult = ""
        numOnScreen.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func doOperation() -> Double {
        if operation == "+"{
            if !haveResult{
                haveResult = true
                return Double(firstNum)! + Double(secondNum)!
            }
            else
            {
                return Double(resultNumber)! + Double(numAfterResult)!
            }
        }
        else if operation == "-"{
            if !haveResult{
                haveResult = true
                return Double(firstNum)! - Double(secondNum)!
            }
            else
            {
                return Double(resultNumber)! - Double(numAfterResult)!
            }
        }
        else if operation == "x"{
            if !haveResult{
                haveResult = true
                return Double(firstNum)! * Double(secondNum)!
            }
            else
            {
                return Double(resultNumber)! * Double(numAfterResult)!
            }
        }
        else if operation == "/"{
            if !haveResult{
                haveResult = true
                return Double(firstNum)! / Double(secondNum)!
            }
            else
            {
                return Double(resultNumber)! / Double(numAfterResult)!
            }
        }
        
        else if operation == "%"{
            if !haveResult{
                haveResult = true
                return Double(firstNum)! / 100
            }
            else
            {
                return Double(resultNumber)! / 100
            }
        }
        
        else if operation == "+/-"{
            if !haveResult{
                haveResult = true
                return Double(firstNum)! * -1
            }
            else
            {
                return Double(resultNumber)! * -1
            }
        }
        return 0
    }
}

