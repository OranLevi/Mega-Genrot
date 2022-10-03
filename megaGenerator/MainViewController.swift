//
//  ViewController.swift
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

}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        if indexPath.row == 0 {  // create enum
            cell.imageView.image = UIImage(systemName: "key.viewfinder")
            cell.textLabel.text = "Password"
        } else if indexPath.row == 1 {
            cell.imageView.image = UIImage(systemName: "person.fill")
            cell.textLabel.text = "Names"
        } else if indexPath.row == 2 {
            cell.imageView.image = UIImage(systemName: "die.face.5")
            cell.textLabel.text = "Numbers"
        }
        
        return cell
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 5
        return CGSize(width: width  , height: width )
    }
}
