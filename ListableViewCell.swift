//
//  ListableViewCell.swift
//  MegaGenerator
//
//  Created by Oran Levi on 30/10/2022.
//

import UIKit

class ListableViewCell: UITableViewCell {

    @IBOutlet weak var listTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
