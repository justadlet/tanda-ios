//
//  RecipeCategoryViewController.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Alamofire

class OneRecipeCategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    var recipes: [Recipe] = []
    var recipeCategory: RecipeCategory = RecipeCategory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        navigationController!.navigationBar.isTranslucent = true
        for constraint in self.view.constraints {
            if constraint.identifier == "searchBarHeight" {
                let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
                constraint.constant = statusBarHeight
            }
        }
        tableView.tableFooterView = UIView()
        searchBar.backgroundColor = UIColor.clear
        searchBar.barTintColor = UIColor.lightGray
        searchBar.tintColor = UIColor.lightGray
        searchBar.backgroundImage = UIImage()
        searchBarView.backgroundColor = UIColor.clear
        searchBar.searchTextField.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 0.75)
        searchBar.searchTextField.textColor =
            UIColor(red: 0.2352, green: 0.2352, blue: 0.2627, alpha: 0.6)
        searchBar.isTranslucent = true
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = UIColor(red: 0.204, green: 0.780, blue: 0.349, alpha: 1)
        fetchData()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 40 {
            UIView.animate(withDuration: 0.2) {
                self.searchBarView.backgroundColor = UIColor.white
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.searchBarView.backgroundColor = UIColor.clear
            }
        }
    }
    
    func fetchData() {
        Alamofire.request(Constants.recipesURL).response(completionHandler: { (response) in
            if let data = response.data {
                do {
                    self.recipes = try JSONDecoder().decode([Recipe].self, from: data)
                    self.tableView.reloadData()
                } catch {
                    print("Error while decoding recipes: \(error)")
                }
            }
        })
    }
    
}

extension OneRecipeCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCategoryImage", for: indexPath) as! RecipeCategoryImageTableViewCell
            cell.mainImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
            cell.mainImage.clipsToBounds = true
            cell.mainImage.setImage(from: self.recipeCategory.imageURL)
            
            for constraint in cell.mainImage.constraints {
                if constraint.identifier == "imageWidth" {
                    constraint.constant = self.view.frame.width
                }
                if constraint.identifier == "imageHeight" {
                    constraint.constant = 300
                }
            }
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCategoryDescription", for: indexPath) as! RecipeCategoryDescriptionTableViewCell
            cell.recipeCategoryNameLabel.text = self.recipeCategory.name
            cell.recipeCategoryCountLabel.text = self.recipeCategory.count.declension
            cell.recipeCategoryDescriptionLabel.text = self.recipeCategory.description
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "meal", for: indexPath) as! MealTableViewCell
            if indexPath.row - 2 < recipes.count {
                cell.recipe = recipes[indexPath.row - 2]
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }
        if indexPath.row == 1 {
            return UITableView.automaticDimension
        }
        return 310
    }
}
