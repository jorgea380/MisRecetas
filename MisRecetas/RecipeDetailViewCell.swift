//
//  RecipeDetailViewCell.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 5/1/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
