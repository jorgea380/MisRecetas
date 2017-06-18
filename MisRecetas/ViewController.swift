//
//  ViewController.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 4/13/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recetas : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
       
       
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
       /* if recipe.isFavorite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        /*cell.thumbnailImageView.layer.cornerRadius = 42.0
        cell.thumbnailImageView.clipsToBounds = true*/
        
        return cell
    }
    
   /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recetas.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }*/
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        var acciones: [UITableViewRowAction] = []
        
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (accion, indexPath) in
            self.recetas.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        acciones.append(deleteAction)

        
        //Compartir
        let shareAction = UITableViewRowAction(style: .normal, title: "Compartir") { (accion, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recetas[indexPath.row].name!) en la app del curso de iOS 10"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText,self.recetas[indexPath.row].image], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
        }
        shareAction.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        acciones.append(shareAction)
    
        
        
        return acciones
    }
    
    //MARK: UITableViewDelegate

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /* let recipe = recetas[indexPath.row]
        
        let alert = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        var favorito = "Favorito"
        var favoritoEstilo = UIAlertActionStyle.default
        if recipe.isFavorite {
            favorito = "No favorita"
            favoritoEstilo=UIAlertActionStyle.destructive
        }
        
        let favoriteAction = UIAlertAction(title: favorito, style: favoritoEstilo) { (action) in
            let recipe = self.recetas[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
        }
        
        alert.addAction(favoriteAction)
        self.present(alert, animated: true, completion: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recetas[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         navigationController?.hidesBarsOnSwipe = true
    }
    
}

