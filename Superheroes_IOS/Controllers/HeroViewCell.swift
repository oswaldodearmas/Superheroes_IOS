//
//  HeroViewCell.swift
//  Superheroes_IOS
//
//  Created by Mañanas on 3/9/24.
//

import Foundation
import UIKit

class HeroViewCell: UITableViewCell {

    @IBOutlet weak var heroImageView: UIImageView!
    
    @IBOutlet weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
