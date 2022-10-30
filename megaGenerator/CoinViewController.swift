//
//  CoinViewController.swift
//  MegaGenerator
//
//  Created by Oran Levi on 30/10/2022.
//

import UIKit

class CoinViewController: UIViewController {
    
    @IBOutlet weak var coinImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        let randomInt = Int.random(in: 0..<20)
        
        UIView.transition(with: self.coinImageView, duration: 1.4, options: [.transitionFlipFromTop], animations: nil, completion: nil)
        
        if randomInt < 10 {
            coinImageView.image = UIImage(systemName: "australsign.circle")
        } else {
            coinImageView.image = UIImage(systemName: "eurosign.circle")
        }
    }
}
