//
//  Service.swift
//  Mega Genrot
//
//  Created by Oran Levi on 07/10/2022.
//

import UIKit


class Service{
    
    enum Constant: Int{
        case password = 0
        case names = 1
        case numbers = 2
        case coin = 3
        case list = 4
        case hexColor = 5
        case animalsNames = 6
    }
    
    func copyButton(textToCopy: AnyObject, button: UIButton) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = textToCopy.text
        button.setTitle("Copied", for: .normal)
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            button.setTitle("Copy", for: .normal)
            button.setImage(UIImage(), for: .normal)
        }
    }
}
