//
//  Recipe.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 4/13/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name: String!
    var image: UIImage!
    var time: Int!
    var ingredients: [String]!
    var steps: [String]!
    var rating: String = "rating"
    
    init(name : String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
}
