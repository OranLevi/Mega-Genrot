//
//  NamesViewController.swift
//  megaGenerator
//
//  Created by Oran Levi on 03/10/2022.
//

import UIKit

class NamesViewController: UIViewController {
    
    @IBOutlet weak var maleNameSwitch: UISwitch!
    @IBOutlet weak var femaleNameSwitch: UISwitch!
    @IBOutlet weak var surnameSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    
    var nameGenerator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
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
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = nameTextField.text
    }
    
}
