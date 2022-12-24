//
//  HexColorViewController.swift
//  Mega Genrot
//
//  Created by Oran Levi on 23/12/2022.
//

import UIKit

class HexColorViewController: UIViewController {

    @IBOutlet weak var hexColorCollectionView: UICollectionView!
    @IBOutlet weak var hexColorsTextField: UITextField!
    @IBOutlet weak var copyAllButton: UIButton!
    @IBOutlet weak var tapAnyColorLabel: UILabel!
    
    var hexColorArray = [String]()
    var colorTextDoubleTapped = false
    var colorText = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hexColorCollectionView.dataSource = self
        hexColorCollectionView.delegate = self
        barButtonItem()
        hideTapAnyColorLabel()
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        let hexColorRandom = allHexColorsArray.randomElement()!
        hexColorArray.append(hexColorRandom)
        
        hexColorsTextField.text = ""
        for hexColors in hexColorArray{
            let arr  = String(hexColors)+", "+(hexColorsTextField.text ?? "")
            hexColorsTextField.text = arr
        }
        hexColorCollectionView.reloadData()
        
    }
    
    @IBAction func copyButton(_ sender: Any) {
        Service().copyButton(textToCopy: hexColorsTextField, button: copyAllButton)
    }
    
    @IBAction func clearAllButton(_ sender: Any) {
        hexColorArray = []
        hexColorsTextField.text = ""
        hexColorCollectionView.reloadData()
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    func barButtonItem(){
        let changeColorBarButtonItem = UIBarButtonItem(title: "Change Color", style: .done, target: self, action: #selector(changeColor))
        self.navigationItem.rightBarButtonItem  = changeColorBarButtonItem
    }
    
    @objc func changeColor(){
        colorTextDoubleTapped = !colorTextDoubleTapped
        colorText = (colorTextDoubleTapped ? UIColor.white : UIColor.black)
        hexColorCollectionView.reloadData()
    }
    
    func hideTapAnyColorLabel( ){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            UIView.animate(withDuration: 0.3, animations: {
                self.tapAnyColorLabel.alpha = 0
            }) { (finished) in
                self.tapAnyColorLabel.isHidden = true
            }
        }
    }
    
}

extension HexColorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hexColorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HexColorCollectionViewCell", for: indexPath) as! HexColorCollectionViewCell
    
        cell.hexColorLabel.text = hexColorArray[indexPath.row]
        cell.backgroundColor = hexStringToUIColor(hex: hexColorArray[indexPath.row])
        cell.hexColorLabel.textColor = colorText
        
        return cell
    }
}


extension HexColorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at:indexPath) as! HexColorCollectionViewCell
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = hexColorArray[indexPath.row]
        cell.hexColorLabel.text = "Copied!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            cell.hexColorLabel.text = self.hexColorArray[indexPath.row]
        }
    }
}
extension HexColorViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  30
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/3, height: 128)
    }
}
