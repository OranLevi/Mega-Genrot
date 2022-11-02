//
//  CoinViewController.swift
//  MegaGenerator
//
//  Created by Oran Levi on 30/10/2022.
//

import UIKit

class CoinViewController: UIViewController {
    
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var flipButton: UIButton!
    @IBOutlet weak var euroImageView: UIImageView!
    @IBOutlet weak var australImageView: UIImageView!
    @IBOutlet weak var australTextLabel: UILabel!
    @IBOutlet weak var euroTextLabel: UILabel! 
    @IBOutlet weak var countView: UIView!
    
    var timerUpdateCount:Timer?
    var coinAustralCount = 0
    var coinEuroCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountView()
        setupLabels()
        setupButton()
    }
    
    func setupButton() {
        flipButton.layer.cornerRadius = 15
    }
    
    func setupLabels() {
        australTextLabel.text = String(coinAustralCount)
        euroTextLabel.text = String(coinEuroCount)
    }
    
    func setupCountView(){
        countView.layer.cornerRadius = 15
        countView.layer.shadowColor = UIColor.black.cgColor
        countView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        countView.layer.shadowRadius = 2.0
        countView.layer.shadowOpacity = 0.5
    }
    
    @IBAction func generatorButton(_ sender: Any) {
        let randomInt = Int.random(in: 0..<20)
        
        UIView.transition(with: self.coinImageView, duration: 1.4, options: [.transitionFlipFromTop], animations: nil, completion: nil)
        
        if randomInt < 10 {
            coinImageView.image = UIImage(systemName: "australsign.circle")
            timerUpdateCount?.invalidate()
            timerUpdateCount = Timer.scheduledTimer(withTimeInterval: 1.3, repeats: false) { timer in
                self.coinAustralCount += 1
                self.setupLabels()
            }
        } else {
            coinImageView.image = UIImage(systemName: "eurosign.circle")
            timerUpdateCount?.invalidate()
            timerUpdateCount = Timer.scheduledTimer(withTimeInterval: 1.3, repeats: false) { timer in
                self.coinEuroCount += 1
                self.setupLabels()
            }

        }
    }
}
