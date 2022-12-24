//
//  NamesViewController.swift
//  Mega Genrot
//
//  Created by Oran Levi on 03/10/2022.
//

import UIKit

class NamesViewController: UIViewController {
    
    @IBOutlet weak var maleNameSwitch: UISwitch!
    @IBOutlet weak var femaleNameSwitch: UISwitch!
    @IBOutlet weak var surnameSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var generatorButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    
    var nameGenerator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        nameTextField.isUserInteractionEnabled = false
    }
    
    func setupButton() {
        generatorButton.layer.cornerRadius = 15
        copyButton.layer.cornerRadius = 15
    }
    
    @IBAction func checkSwitchFemale(_ sender: Any) {
        if femaleNameSwitch.isOn {
            maleNameSwitch.isOn = false
        }
    }
    
    @IBAction func checkSwitchMale(_ sender: Any) {
        if maleNameSwitch.isOn {
            femaleNameSwitch.isOn = false
        }
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        nameGenerator = ""
        nameTextField.text = ""
        
        if maleNameSwitch.isOn {
            nameGenerator += " \(maleNames.randomElement()!)"
        }
        if femaleNameSwitch.isOn {
            nameGenerator += " \(femaleNames.randomElement()!)"
        }
        if surnameSwitch.isOn {
            nameGenerator += " \(surname.randomElement()!)"
        }
        
        nameTextField.text = nameGenerator
    }
    
    @IBAction func copyButton(_ sender: Any) {
        Service().copyButton(textToCopy: nameTextField, button: copyButton)
    }
    
}
