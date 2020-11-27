//
//  RecipesViewController.swift
//  Tañda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecipesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var recipeCategories: [RecipeCategory] = []
    var selectedCategory = RecipeCategory()
    var recipes: [Recipe] = []
    var selectedChef = Chef()
    var chefs: [Chef] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.addSectionHeader()
        fetchData()
    }
    
    func fetchData() {
        Alamofire.request(Constants.recipeCategoryURL).response(completionHandler: { (response) in
            if let data = response.data {
                do {
                    self.recipeCategories = try JSONDecoder().decode([RecipeCategory].self, from: data)
//                    print(self.recipeCategories[0].name)
                    self.tableView.reloadData()
                } catch {
                    print("Error while decoding recipeCategories: \(error)")
                }
            }
        })

        print(Constants.chefsURL)
        Alamofire.request(Constants.chefsURL).response(completionHandler: { (response) in
            if let data = response.data {
                do {
                    self.chefs = try JSONDecoder().decode([Chef].self, from: data)
                    self.tableView.reloadData()
                } catch {
                    print("Error while decoding chefs: \(error)")
                }
            }
        })
        Alamofire.request(Constants.recipesURL).response(completionHandler: { (response) in
            if let data = response.data {
                do {
                    self.recipes = try JSONDecoder().decode([Recipe].self, from: data)
//                    print(self.recipes)
//                    print(self.recipes[0].name)
//                    print(self.recipes[0].chef_city)
                    self.tableView.reloadData()
                } catch {
                    print("Error while decoding recipes: \(error)")
                }
            }
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategories" {
            let dest = segue.destination as! RecipeCategoryViewController
            dest.recipeCategories = recipeCategories
        }
        if segue.identifier == "showCategory" {
            let dest = segue.destination as! OneRecipeCategoryViewController
            dest.recipeCategory = self.selectedCategory
        }
        if segue.identifier == "showChef" {
            let dest = segue.destination as! OneChefViewController
            dest.chef = self.selectedChef
        }
    }

}


extension RecipesViewController: UITableViewDataSource, UITableViewDelegate, SectionHeaderProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCategory", for: indexPath) as! RecipeCategoryCollectionViewCell
           let recipeCategory = recipeCategories[indexPath.row]
           cell.nameLabel.text = recipeCategory.name
           cell.countLabel.text = recipeCategory.count.declension
           cell.imageView.setImage(from: recipeCategory.imageURL)
           return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCategory = recipeCategories[indexPath.row]
        self.performSegue(withIdentifier: "showCategory", sender: nil)
    }
    
    func buttonPressed(_ section: Int) {
        if section == 0 {
            self.performSegue(withIdentifier: "showCategories", sender: nil)
        } else if section == 1 {
            self.performSegue(withIdentifier: "showChefs", sender: nil)
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return recipes.count
        default:
            return recipeCategories.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCategories", for: indexPath) as! RecipeCategoriesTableViewCell
            cell.recipeCategories = recipeCategories
            cell.collectionView?.delegate = self
            cell.collectionView?.dataSource = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "chef", for: indexPath) as! ChefTableViewCell
            if indexPath.row < chefs.count {
                cell.chef = chefs[indexPath.row]
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "meal", for: indexPath) as! MealTableViewCell
            if indexPath.row < recipes.count {
                cell.recipe = recipes[indexPath.row]
            }
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 234
        case 1:
            return 76
        case 2:
            return 310
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeader = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "customSectionHeader") as! SectionHeader
        
        sectionHeader.section = section
        sectionHeader.delegate = self
        switch section {
        case 0:
            sectionHeader.titleLabel.text = "Категории"
            sectionHeader.backView.backgroundColor = .systemBackground
            sectionHeader.button.setTitleColor(UIColor(named: "Main"), for: .normal)
            sectionHeader.arrayImage.tintColor = UIColor(red: 0.204, green: 0.780, blue: 0.349, alpha: 1)
            sectionHeader.button.isUserInteractionEnabled = true
            sectionHeader.titleLabel.textColor = .label
            break
        case 1:
            sectionHeader.titleLabel.text = "Повара"
            break
        default:
            sectionHeader.titleLabel.text = "Блюда"
            sectionHeader.button.setTitleColor(UIColor.clear, for: .normal)
            sectionHeader.button.isUserInteractionEnabled = false
            sectionHeader.arrayImage.tintColor = UIColor.clear
            if #available(iOS 13.0, *) {
                sectionHeader.backView.backgroundColor = .systemBackground
            } else {
                sectionHeader.backView.backgroundColor = UIColor(red: 0.783922, green: 0.78039, blue: 0.8, alpha: 1)
            }
            if #available(iOS 13.0, *) {
                sectionHeader.titleLabel.textColor = .label
            } else {
                sectionHeader.titleLabel.textColor = UIColor(named: "Label")
            }
            break
        }
        
        
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.showLogin()
        if indexPath.section == 2 {
            self.performSegue(withIdentifier: "showRecipe", sender: nil)
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        selectedChef = chefs[indexPath.row]
        self.performSegue(withIdentifier: "showChef", sender: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}


