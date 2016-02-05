//
//  ViewController.swift
//  calculatorApp
//
//  This is a simple calculator app that allows the user to perform simple calculations
//
//  Created by Patrick Richey on 2016-02-02.
//  Copyright © 2016 Patrick Richey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //instantiate variables for calculations
    @IBOutlet weak var screen: UILabel!
    var firstNumber = Float()
    var secondNumber = Float()
    var result = Float()
    var operation = ""
    var isTypingNumber = false
    var decimalCount = 0
    var operatorCount = 0

    //capture event when a number button is clicked
    @IBAction func numberClicked(sender: AnyObject) {
        let number = sender.currentTitle
        //while use is still entering numbers, concat to existing number
        if isTypingNumber == true {
            screen.text = screen.text! + number!!
        } else {
            screen.text = number
            decimalCount = 0
        }
        isTypingNumber = true
    }
    
    //add decimal to current number
    @IBAction func decimalClicked(sender: AnyObject) {
        let decimal = sender.currentTitle
        //if user is typing a number and hasn't yet entered a decimal point
        if isTypingNumber == true && decimalCount == 0 {
            screen.text = screen.text! + decimal!!
            decimalCount = 1 //to limit allowed decimals per number
        }
    }
    
    //assign the operator on click (working on multiple operator clicks)
    @IBAction func operatorClicked(sender: AnyObject) {
        if operatorCount == 0 {
            firstNumber = (screen.text! as NSString).floatValue
            operation = sender.currentTitle!!
            isTypingNumber = false
        }
        operatorCount++
    }
    
    //perform calculation
    @IBAction func evaluate(sender: AnyObject) {
        secondNumber = (screen.text! as NSString).floatValue
        isTypingNumber = false
        //perform any chosen operation
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        } else if operation == "x" {
            result = firstNumber * secondNumber
        } else if operation == "÷" {
            result = firstNumber / secondNumber
        }
        //display the result to the screen
        screen.text = "\(result)"
        operatorCount = 0
    }
    
    //clear the screen and reset numbers
    @IBAction func clearView(sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        result = 0
        screen.text = "\(0)"
    }
}

