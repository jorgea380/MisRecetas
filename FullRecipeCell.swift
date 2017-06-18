//
//  FullRecipeCell.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 4/15/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import UIKit

class FullRecipeCell: UITableViewCell {

    @IBOutlet var imagen: UIImageView!
    @IBOutlet var nombre: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
}
