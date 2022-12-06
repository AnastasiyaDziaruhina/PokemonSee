//
//  UITableViewCell.swift
//  PokemonSee
//
//  Created by Stacy on 20/11/2022.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var pName: UILabel!
    @IBOutlet weak var pCell: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let pCell = UIView()
        pCell.backgroundColor =  .systemPurple
        self.selectedBackgroundView = pCell
       
    }

}
