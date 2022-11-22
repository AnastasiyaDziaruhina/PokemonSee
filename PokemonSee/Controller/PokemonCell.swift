//
//  UITableViewCell.swift
//  PokemonSee
//
//  Created by Stacy on 20/11/2022.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var pIMG: UIImageView!
    @IBOutlet weak var pName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
