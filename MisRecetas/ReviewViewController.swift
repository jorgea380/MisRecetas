//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Jorge Gabriel Gutierrez Ruiz on 6/9/17.
//  Copyright © 2017 Jorge Gabriel Gutierrez Ruiz. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var ratingStackView: UIStackView!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    var ratingSelected: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //ratingStackView.transform = scale.concatenating(translation)
        self.firstButton.transform = scale.concatenating(translation)
        self.secondButton.transform = scale.concatenating(translation)
        self.thirdButton.transform = scale.concatenating(translation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*UIView.animate(withDuration: 0.5, delay: 0.0,options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })*/
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.10, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.20, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },completion: nil)
        
        
        
    }
    
    @IBAction func ratingPressed(_ sender: UIButton) {
    
        
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
}
