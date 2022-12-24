//
//  PasswordViewController.swift
//  Mega Genrot
//
//  Created by Oran Levi on 03/10/2022.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var lowerCaseSwitch: UISwitch!
    @IBOutlet weak var upperCaseSwitch: UISwitch!
    @IBOutlet weak var specialSymbolsSwitch: UISwitch!
    @IBOutlet weak var numbersSwitch: UISwitch!
    @IBOutlet weak var passwordLengthLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLengthSlider: UISlider!
    @IBOutlet weak var generatorButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    
    let numbers = ["0","1","2","3","4","5","6","7","8","9"]
    let lowerCharacters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    let upperCharacters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let specialCharacters = ["!","\"","§","$","%","&","/","(",")","=","?","+","*","#",",",";",".",":","-","_","@","<",">"]
    
    var passwordGenerator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        passwordLengthLabel.text = "Password Length: \(Int(passwordLengthSlider.value))"
        passwordTextField.isUserInteractionEnabled = false
    }
    
    func setupButton() {
        generatorButton.layer.cornerRadius = 15
        copyButton.layer.cornerRadius = 15
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        
        if !lowerCaseSwitch.isOn && !upperCaseSwitch.isOn && !specialSymbolsSwitch.isOn && !numbersSwitch.isOn {
            passwordTextField.text! = "Error: Choose one of the options"
            return
        }
        
        passwordGenerator = ""
        passwordTextField.text = ""
        
        for _ in 0..<Int(passwordLengthSlider.value){
            
            if lowerCaseSwitch.isOn {
                passwordGenerator += lowerCharacters.randomElement()!
            }
            
            if upperCaseSwitch.isOn {
                passwordGenerator += upperCharacters.randomElement()!
            }
            
            if specialSymbolsSwitch.isOn {
                passwordGenerator += specialCharacters.randomElement()!
            }
            if numbersSwitch.isOn {
                passwordGenerator += numbers.randomElement()!
            }
        }
        
        passwordTextField.text = passwordGenerator
        passwordTextField.text = String(passwordTextField.text!.prefix(Int(passwordLengthSlider.value)))
    }
    
    @IBAction func passwordSlider(_ sender: Any) {
        passwordLengthLabel.text = "Password Length:  \(Int(passwordLengthSlider.value))"
    }
    
    @IBAction func copyButton(_ sender: Any) {
        Service().copyButton(textToCopy: passwordTextField, button: copyButton)
    }
}
