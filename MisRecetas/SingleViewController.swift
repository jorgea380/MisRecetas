//
//  SingleViewController.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 4/15/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController{

    @IBOutlet var tableView: UITableView!
    var recetas : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*self.tableView.dataSource = self
        self.tableView.delegate = self*/
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SingleViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recetas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recetas[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }

}
