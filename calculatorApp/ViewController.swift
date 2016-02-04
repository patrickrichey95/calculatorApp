//
//  ViewController.swift
//  calculatorApp
//
//  Created by student on 2016-02-02.
//  Copyright © 2016 student. All rights reserved.
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
    
    @IBOutlet weak var screen: UILabel!
    var firstNumber = Float()
    var secondNumber = Float()
    var result = Float()
    var operation = ""
    var isTypingNumber = false

    @IBAction func numberClicked(sender: AnyObject) {
        let number = sender.currentTitle
        
        if isTypingNumber == true {
            screen.text = screen.text! + number!!
        } else {
            screen.text = number
        }
        isTypingNumber = true
    }

    @IBAction func decimalClicked(sender: AnyObject) {
        let decimal = sender.currentTitle
        
        screen.text = screen.text! + decimal!!
    }
    
    @IBAction func operatorClicked(sender: AnyObject) {
        operation = sender.currentTitle!!
        isTypingNumber = false
        firstNumber = (screen.text! as NSString).floatValue
    }
    
    @IBAction func evaluate(sender: AnyObject) {
        secondNumber = (screen.text! as NSString).floatValue
        isTypingNumber = false
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        } else if operation == "x" {
            result = firstNumber * secondNumber
        } else if operation == "÷" {
            result = firstNumber / secondNumber
        }
        screen.text = "\(result)"
    }
    
    @IBAction func clearView(sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        result = 0
        screen.text = "\(0)"
    }
}

