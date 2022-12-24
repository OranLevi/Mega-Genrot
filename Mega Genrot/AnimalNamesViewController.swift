//
//  AnimalNamesViewController.swift
//  Mega Genrot
//
//  Created by Oran Levi on 23/12/2022.
//

import UIKit

class AnimalNamesViewController: UIViewController {
    
    @IBOutlet weak var startLetterPicker: UIPickerView!
    @IBOutlet weak var endLetterPicker: UIPickerView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalView: UIView!
    @IBOutlet weak var copyButton: UIButton!
    
    var service = Service()
    var letterArray = ["None", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var maximumArray = [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
    
    var startLetterSelected = ""
    var maxLetterSelected:Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickers()
        setupViews()
        setupButtons()
    }
    
    func setupViews(){
        animalLabel.text = ""
        animalView.layer.cornerRadius = 15
        animalView.layer.shadowColor = UIColor.black.cgColor
        animalView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        animalView.layer.shadowRadius = 2.0
        animalView.layer.shadowOpacity = 0.5
    }
    
    func setupPickers(){
        startLetterPicker.dataSource = self
        startLetterPicker.delegate = self
        endLetterPicker.dataSource = self
        endLetterPicker.delegate = self
        startLetterPicker.tag = 0
        endLetterPicker.tag = 1
        pickerView(startLetterPicker, didSelectRow: 0, inComponent: 0)
        pickerView(endLetterPicker, didSelectRow: 0, inComponent: 0)
    }
    
    func setupButtons() {
        copyButton.layer.cornerRadius = 15
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        
        for _ in 0...animalsArray.count {
            let randomArray = animalsArray.randomElement()
            if startLetterSelected == "None" && randomArray!.count <= maxLetterSelected {
                animalLabel.text = randomArray
                break
            } else if startLetterSelected != "None" {
                if randomArray.map({ $0.prefix(1) })! == startLetterSelected && randomArray!.count <= maxLetterSelected {
                    animalLabel.text = randomArray
                    break
                } else {
                    animalLabel.text = "Not Found!"
                }
            }
        }
    }
    
    @IBAction func copyButton(_ sender: Any) {
        Service().copyButton(textToCopy: animalLabel, button: copyButton)
    }
}


extension AnimalNamesViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return letterArray.count
        }else {
            return maximumArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return letterArray[row]
        } else {
            return String(maximumArray[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            startLetterSelected = letterArray[row]
        } else {
            maxLetterSelected = maximumArray[row]
        }
    }
}


