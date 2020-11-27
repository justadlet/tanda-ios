//
//  RecipeViewController.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    

    @IBOutlet weak var radiusView: UIView!
    @IBOutlet weak var actionTop: NSLayoutConstraint!
    @IBOutlet weak var lessonButton: UIView!
    @IBOutlet weak var orderMealButton: UIView!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navTop: NSLayoutConstraint!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var shopDetails: UILabel!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        radiusView.layer.cornerRadius = 12
        radiusView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        orderMealButton.layer.cornerRadius = 8
        orderMealButton.layer.borderColor = UIColor.backgroundColor.cgColor
        orderMealButton.layer.borderWidth = 1
        lessonButton.layer.cornerRadius = 8
        lessonButton.layer.borderColor = UIColor.backgroundColor.cgColor
        lessonButton.layer.borderWidth = 1
        orderButton.layer.cornerRadius = 8
        countView.layer.cornerRadius = 4
        likeButton.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
        topView.isHidden = true
        
        tableView.addSectionHeader()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    
    
    @IBAction func orderPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showOrder", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 6
        } else if section == 3 {
            return 1
        }
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return tableView.dequeueReusableCell(withIdentifier: "hiddenCell", for: indexPath)
            } else {
                return tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
            }
        } else if indexPath.section == 1  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell", for: indexPath) as! IngredientsTableViewCell
            
            return cell
        } else if indexPath.section == 2 {
            if indexPath.row  == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "adCell", for: indexPath) as! NoteTableViewCell
                cell.noteLabel.text = "Главное , вам нужно форма для духовки, можно как у меня или стеклянные есть 👍 я купила в Астане в магазине @posyda_astana 😍😍😍 цены почти даром , каменные сковородки , поварёшки от Vikalina 🔥🔥🔥 качество просто супер 👏"
                
                return cell
            }  else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath) as! StepTableViewCell
                cell.stepLabel.text = "Яйце с сахаром перемешиваем и добавляем масло сливочное,  а не маргарин \n\n🔥качество просто супер"
                cell.mainImage.setImage(from: URL(string: "https://images.pexels.com/photos/374052/pexels-photo-374052.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"))
                
                return cell
            }
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "authorCell", for: indexPath) as! AuthorTableViewCell
            
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
            if indexPath.row % 2 == 0 {
                cell.replyLabel.text = ""
            } else {
                cell.replyLabel.text = "We stayed at Rose’s for a month and it was the perfect desert getaway! The tiny house is gorgeous and well-designed, and the location and proximity to the park was perfect."
            }
            
            return cell
        }
    }
    
    
    @available(iOS 13.0, *)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            return 300 - height
        } else if indexPath.section == 0 && indexPath.row == 1 {
            return 178
        } else if indexPath.section == 1 {
            return 280
        }
        
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "customSectionHeader") as! SectionHeader
        
        switch section {
        case 1:
            sectionHeader.titleLabel.text = "Ингредиенты"
            break
        case 2:
            sectionHeader.titleLabel.text = "Приготовление"
            break
        case 3:
            sectionHeader.titleLabel.text = "Об авторе"
            break
        default:
            sectionHeader.titleLabel.text = "Комментарии"
            break
        }
        
        
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 52
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        topView.isHidden = tableView.contentOffset.y <= 300 + height - 12
        if scrollView == tableView {
            if tableView.contentOffset.y <= 300 + height {
                self.navTop.constant = -tableView.contentOffset.y
            }
        }
        
    }
}

extension RecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        (cell.viewWithTag(1) as? UIImageView)?.setImage(from: URL(string: "https://images.pexels.com/photos/374052/pexels-photo-374052.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"))
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
