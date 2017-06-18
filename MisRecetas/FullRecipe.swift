//
//  FullRecipe.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 4/15/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import UIKit

class FullRecipe: UITableViewController {
    
    var recetas : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var recipe = Recipe(name: "Tortilla de patatas",image: #imageLiteral(resourceName: "tortilla"), time: 20, ingredients: ["Patatas", "Huevos", "Cebolla"], steps: ["Paso 1", "Paso 2", "Paso 3"])
        recetas.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",image: #imageLiteral(resourceName: "pizza"), time: 20, ingredients: ["Patatas", "Huevos", "Cebolla"], steps: ["Paso 1", "Paso 2", "Paso 3"])
        recetas.append(recipe)
        
        recipe = Recipe(name: "Hamburgesa con queso",image: #imageLiteral(resourceName: "hamburguesa"), time: 20, ingredients: ["Patatas", "Huevos", "Cebolla"], steps: ["Paso 1", "Paso 2", "Paso 3"])
        recetas.append(recipe)
        
        recipe =  Recipe(name: "Ensalada Cesar",image: #imageLiteral(resourceName: "ensalada"), time: 20, ingredients: ["Patatas", "Huevos", "Cebolla"], steps: ["Paso 1", "Paso 2", "Paso 3"])
        recetas.append(recipe)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    //MARK: -UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recetas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recetas[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
        
        cell.imagen.image = recipe.image
        cell.nombre.text = recipe.name
        
        return cell
    }
}

