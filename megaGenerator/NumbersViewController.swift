//
//  NumbersViewController.swift
//  megaGenerator
//
//  Created by Oran Levi on 03/10/2022.
//

import UIKit

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var numberFromTextField: UITextField!
    @IBOutlet weak var numberToTextField: UITextField!
    @IBOutlet weak var numbersTextField: UITextField!
    
    var numberGenerator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func generatorButton(_ sender: Any) {
        
        numberGenerator = ""
        numbersTextField.text = ""
        
        if numberFromTextField.text!.isEmpty || numberToTextField.text!.isEmpty{
            numbersTextField.text = "Error"
            return
        }
        
        if numberFromTextField.text! > numberToTextField.text! {
            numbersTextField.text = "Error"
            return
        }
        
        let lower: Int = Int(numberFromTextField.text!)!
        let bigger: Int = Int(numberToTextField.text!)!
        
        let randomInt = Int.random(in: lower..<bigger)
        
        numbersTextField.text = String(randomInt)
    }
    
    @IBAction func copyButton(_ sender: Any) {
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = numbersTextField.text
    }
    
}
