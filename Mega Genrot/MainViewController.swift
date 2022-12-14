//
//  MainViewController.swift
//  Mega Genrot
//
//  Created by Oran Levi on 02/10/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.alwaysBounceVertical = true
    }
    
    func nextViewController(identifier: String){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        cell.layer.cornerRadius = 30
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        
        if indexPath.row == Service.Constant.password.rawValue {
            cell.imageView.image = UIImage(systemName: "key.viewfinder")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            cell.textLabel.text = "Password"
            cell.backgroundColor = UIColor.systemBlue
        } else if indexPath.row == Service.Constant.names.rawValue {
            cell.imageView.image = UIImage(systemName: "person.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            cell.textLabel.text = "Names"
            cell.backgroundColor = UIColor.systemYellow
        } else if indexPath.row == Service.Constant.numbers.rawValue {
            cell.imageView.image = UIImage(systemName: "die.face.5")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            cell.textLabel.text = "Numbers"
            cell.backgroundColor = UIColor.systemOrange
        } else if indexPath.row == Service.Constant.coin.rawValue {
            cell.imageView.image = UIImage(systemName: "dollarsign.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            cell.textLabel.text = "Coin"
            cell.backgroundColor = UIColor.systemCyan
        } else if indexPath.row == Service.Constant.list.rawValue {
            cell.imageView.image = UIImage(systemName: "list.bullet")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            cell.textLabel.text = "List"
            cell.backgroundColor = UIColor.systemTeal
        } else if indexPath.row == Service.Constant.hexColor.rawValue {
            cell.imageView.image = UIImage(systemName: "paintbrush")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            cell.textLabel.text = "Hex Color"
            cell.backgroundColor = UIColor.systemPurple
        } else if indexPath.row == Service.Constant.animalsNames.rawValue {
            cell.imageView.image = UIImage(systemName: "pawprint.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            cell.textLabel.text = "Animals Names"
            cell.backgroundColor = UIColor.systemIndigo
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == Service.Constant.password.rawValue {
            nextViewController(identifier: "passwordVC")
            
        } else if indexPath.row == Service.Constant.names.rawValue {
            nextViewController(identifier: "namesVC")
            
        } else if indexPath.row == Service.Constant.numbers.rawValue {
            nextViewController(identifier: "numbersVC")
            
        } else if indexPath.row == Service.Constant.coin.rawValue {
            nextViewController(identifier: "coinVC")
            
        } else if indexPath.row == Service.Constant.list.rawValue {
            nextViewController(identifier: "listVC")
        }
        else if indexPath.row == Service.Constant.hexColor.rawValue {
            nextViewController(identifier: "hexVC")
        }
        else if indexPath.row == Service.Constant.animalsNames.rawValue {
            nextViewController(identifier: "animalsNameVC")
        }
        
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  30
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 200)
    }
}
