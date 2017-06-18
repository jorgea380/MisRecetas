//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 5/1/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet var recipeName: UILabel!
    @IBOutlet var recipeTime: UILabel!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    
    var recipe : Recipe!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = recipe.name
        
        self.recipeImageView.image = self.recipe.image
        self.recipeName.text = self.recipe.name!
        self.recipeTime.text = "\(self.recipe.time!) minutos"
        
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.ratingButton.setImage(UIImage(named: recipe.rating), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close(segue: UIStoryboardSegue){
        
        if let reviewVC = segue.source as? ReviewViewController {
            if let rating = reviewVC.ratingSelected {
                self.recipe.rating = rating
                self.ratingButton.setImage(UIImage(named: recipe.rating), for: .normal)
            }
        }
        
    }

}

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre:"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) min"
            /*case 2:
                cell.keyLabel.text = "Favorita:"
                if self.recipe.isFavorite {
                    cell.valueLabel.text = "Si"
                } else {
                    cell.valueLabel.text = "No"
                }*/
            default:
                break
            }
        case 1:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredientes:"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Pasos:"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        
        return title
    }
}

extension DetailViewController : UITableViewDelegate {
    
}
