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
    @IBOutlet weak var copyButton: UIButton!
    
    var numberGenerator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numbersTextField.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        
        numberGenerator = ""
        numbersTextField.text = ""
        
        if numberFromTextField.text!.isEmpty || numberToTextField.text!.isEmpty{
            numbersTextField.text = "Error: empty fields"
            return
        }

        let lower: Int = Int(numberFromTextField.text!)!
        let bigger: Int = Int(numberToTextField.text!)!
        
        if lower < bigger {
            let randomInt = Int.random(in: lower..<bigger+1)
            numbersTextField.text = String(randomInt)
        } else if lower > bigger {
            numbersTextField.text = "Error: number from is bigger than to number"
        } else {
            numbersTextField.text = "Error"
        }
    }
    
    @IBAction func copyButton(_ sender: Any) {
        Service().copyButton(textField: numbersTextField, button: copyButton)
    }
    
}
