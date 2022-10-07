//
//  MainViewController.swift
//  megaGenerator
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
        // Do any additional setup after loading the view.
    }
    
    enum Constant: Int{
        case password = 0
        case names = 1
        case numbers = 2
    }
    
    func nextViewController(identifier: String){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        if indexPath.row == Constant.password.rawValue {
            cell.imageView.image = UIImage(systemName: "key.viewfinder")
            cell.textLabel.text = "Password"
            cell.backgroundColor = UIColor.lightGray
        } else if indexPath.row == Constant.names.rawValue {
            cell.imageView.image = UIImage(systemName: "person.fill")
            cell.textLabel.text = "Names"
            cell.backgroundColor = UIColor.systemYellow
        } else if indexPath.row == Constant.numbers.rawValue {
            cell.imageView.image = UIImage(systemName: "die.face.5")
            cell.textLabel.text = "Numbers"
            cell.backgroundColor = UIColor.systemOrange
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == Constant.password.rawValue {
            nextViewController(identifier: "passwordVC")
            
        } else if indexPath.row == Constant.names.rawValue {
            nextViewController(identifier: "namesVC")
            
        } else if indexPath.row == Constant.numbers.rawValue {
            nextViewController(identifier: "numbersVC")
        }
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 5
        return CGSize(width: width  , height: width )
    }
}