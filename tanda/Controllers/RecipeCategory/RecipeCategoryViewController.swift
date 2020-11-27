//
//  RecipeCategoryViewController.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class RecipeCategoryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipeCategories: [RecipeCategory] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    var selectedCategory = RecipeCategory()
//    let widthForCell = (self.view.frame.width - 46) / 2
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategory" {
            let dest = segue.destination as! OneRecipeCategoryViewController
            dest.recipeCategory = self.selectedCategory
        }
    }
}

extension RecipeCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCategory", for: indexPath) as! RecipeCategoryCollectionViewCell
        cell.recipeCategory = recipeCategories[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCategory = recipeCategories[indexPath.row]
        self.performSegue(withIdentifier: "showCategory", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 45) / 2
        return CGSize(width: (collectionView.frame.width - 45) / 2, height: width + 60)
    }
    
    
}

