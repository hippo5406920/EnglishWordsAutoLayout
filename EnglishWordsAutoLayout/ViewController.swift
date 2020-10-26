//
//  ViewController.swift
//  CatCalculator
//
//  Created by Yi-Yun Chen on 2017/11/9.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber = CalculatedNumber()
    var currentOperation = Operation.Empty
    var leftVal = CalculatedNumber()
    var rightVal = CalculatedNumber()
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // AC
    @IBAction func restartPressed(_ sender: Any) {
        displayLabel.text = "0"
        currentNumber.text = ""
        leftVal.text = ""
        rightVal.text = ""
        currentOperation = Operation.Empty
    }
    
    // 0~9
    @IBAction func numberPressed(_ sender: UIButton) {
        currentNumber.text += "\(sender.tag)"
        displayLabel.text = currentNumber.display
    }
    
    // +
    @IBAction func addButtonPressed(_ sender: Any) {
        setLeftVal(operation: Operation.Add)
    }
    
    // -
    @IBAction func subtractButtonPressed(_ sender: Any) {
        setLeftVal(operation: Operation.Subtract)
    }
    
    // *
    @IBAction func multiplyButtonPressed(_ sender: Any) {
        setLeftVal(operation: Operation.Multiply)
    }
    
    // ÷
    @IBAction func divideButtonPressed(_ sender: Any) {
        setLeftVal(operation: Operation.Divide)
    }
    
    // =
    @IBAction func equalButtonPressed(_ sender: Any) {
        calculateResult()
        displayLabel.text = currentNumber.display
        currentOperation = Operation.Empty
    }
    
    // .
    @IBAction func pointPressed(_ sender: Any) {
        if displayLabel.text == "0" {
            currentNumber.text = "0"
        }
        currentNumber.text += "."
        displayLabel.text = currentNumber.text
    }
    
    // 00
    @IBAction func hundredPressed(_ sender: Any) {
        currentNumber.text = "\(currentNumber.value * 100)"
        displayLabel.text = currentNumber.display
    }
    
    // %
    @IBAction func persentButtonPressed(_ sender: Any) {
        currentNumber.text = "\(currentNumber.value / 100.0)"
        displayLabel.text = currentNumber.display
    }
    
    // √
    @IBAction func sqrtButtonPressed(_ sender: Any) {
        currentNumber.text = "\(sqrt(currentNumber.value))"
        displayLabel.text = currentNumber.display
    }
    
    func setLeftVal(operation: Operation) {
        if currentOperation != Operation.Empty {
            calculateResult()
        }
            
        leftVal.text = currentNumber.text
        currentNumber.text = ""
        currentOperation = operation
        displayLabel.text = leftVal.display
    }
    
    func calculateResult() {
        rightVal.text = currentNumber.text
        switch currentOperation {
        case .Add:
            currentNumber.text = "\(leftVal.value + rightVal.value)"
        case .Subtract:
            currentNumber.text = "\(leftVal.value - rightVal.value)"
        case .Multiply:
            currentNumber.text = "\(leftVal.value * rightVal.value)"
        case .Divide:
            currentNumber.text = "\(leftVal.value / rightVal.value)"
        default:
            currentNumber.text = currentNumber.text
        }
        
    }
}

