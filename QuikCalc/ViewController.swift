//
//  ViewController.swift
//  QuikCalc
//
//  Created by Robert O'Connor on 12/02/2015.
//  Copyright (c) 2015 WIT. All rights reserved.
//

import UIKit

/*
    1. User presses digit - number appended to string (up to 10 digits)
    2. User presses operator:
        - number converted to int
        - operator logged
        - gets ready for next number
    3. User presses =
        - currentTotal displayed (including any calculated value)
    4. User presses C
        - All clear
    5. User presses D:
        - last digit of displayLabel deleted
        - if 0 or 1 digits, back to 0
*/


class ViewController: UIViewController {
    
    // does this require a limiter? So as to only display a certain number of characters?
    @IBOutlet weak var displayLabel: UILabel!
    // or should it be done in InterfaceBuilder?
    
    var currentTotal:Double = 0.0;
    var oper:String?
    //var calc = Calculator()
    var num1:Double = 0.0
    var num2:Double = 0.0
    var aux:Double = 0.0
    var flag:Bool = false
    var equalsPressed: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        If 0 display, start a new one, otherwise append
    
        If operator set, start new number
    
        Is this it?
    */
    @IBAction func pressNumber(sender: AnyObject) {
        
        if let digit = (sender as UIButton).titleLabel?.text {
            if(displayLabel.text! != "0.0"){
                displayLabel.text! += digit
                if(displayLabel.text! == "."){
                    displayLabel.text! += "."
                }
                aux = (displayLabel.text! as NSString).doubleValue
            }
            else{
                displayLabel.text = digit
                aux = (displayLabel.text! as NSString).doubleValue
            }
        }
     
    }
    
    /*
        If no currentValue, copy in displayLabel. Set operator
        If currentValue, set operator and recalculate
        Is this it?
    */
    @IBAction func pressOperator(sender: AnyObject) {
        if (num1==0.0 && num2 == 0.0 && flag){
            num1 = currentTotal
        }else{
            num1 = aux
        }
        displayLabel.text="";
        var o:String! = (sender as UIButton).titleLabel?.text
        if o == "MOD" {
            o = "%"
        }
        switch(o){
            case "+":
                // add operation
                oper = "+"
            case "-":
                // subtract operation
                oper = "-"
            case "x":
                // multiply operation
                oper = "x"
            case "/":
                // divide operation
                oper = "/"
            case "%":
                oper = "%"
        default:
            oper = nil
        }
    }

    /*
        Perform calculation and display result
    */
    @IBAction func equalsOp (sender: AnyObject) {
        
        num2 = aux
        println(NSString(format:"%f",num1))
        println(NSString(format:"%f",num2))
        println(NSString(format:"%f",currentTotal))
        println(oper!)
        
        
        let calc = Calculator()
        
        if let o:String = oper{
            
            switch(o){
            case "+":
                // add operation
                displayLabel.text = calc.add(num1,num2: num2).description
            case "-":
                // subtract operation
                displayLabel.text = calc.sub(num1,num2: num2).description
            case "x":
                // multiply operation
                displayLabel.text = calc.mul(num1,num2: num2).description
            case "/":
                // divide operation
                displayLabel.text = calc.div(num1,num2: num2).description
            case "%":
                displayLabel.text = calc.mod(Int(floor(num1)),b: Int(floor(num2))).description
            default:
                oper = nil
            }

        }
        flag = true
        num1=0.0
        num2=0.0
        currentTotal = (displayLabel.text! as NSString).doubleValue
        
        
        
        //displayLabel.text = "\(currentTotal)"
    }
    
    /*
        Reset all values
    */
    @IBAction func clearOp (sender: AnyObject) {
        currentTotal = 0
        oper = nil
        flag = false
        displayLabel.text = "\(currentTotal)"
    }
    
    /*
        if displayLabel has more than one digit, append
        else reset to 0
    */
    @IBAction func deleteOp (sender: AnyObject) {
        var display:String! = displayLabel.text
        
        if(countElements(display) > 1){
            display = dropLast(display)
        }
        else{
            display = "0"
        }
        
        displayLabel.text = "\(display)"
    }
    
}

