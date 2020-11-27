//
//  ProductsViewController.swift
//  tanda
//
//  Created by Адлет Зейнекен on 25.06.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var currentRow = 0
    var currentSection = 0
    let sections = ["Фрукты", "Молочные изделия"]
    let names = [["Яблоки Американка кг Польша", "Груша Вильямс кг Аргентина", "Голубика 125 г"],
                 ["Масло President сливочное 82% 400 г", "Молоко Амиран живое 2,5% 0,8 л"]]
    
    let brands = [["", "Вильямс", ""],
                 ["President", "Amiran"]]
    
    let productUrls = [["https://arbuz.kz/image/s/169438-yabloki_amerikanka.jpg/w/260/h/260?_c=1591941003", "https://arbuz.kz/image/s/151391-grusha_vilyams_tverdaya_kislo-sladkaya_kg.jpg/w/260/h/260?_c=1591874265", "https://arbuz.kz/image/s/225940-golubika_chili_125_g.jpg/w/260/h/260?_c=1591874513"],
    ["https://arbuz.kz/image/s/226546-maslo_president_slivochnoe_82_400_g.jpg/w/260/h/260?_c=1592198317", "https://arbuz.kz/image/s/191335-moloko_amiran_zhivoe_2_5_0_8l.jpg/w/260/h/260?_c=1591876072"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section]
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as! ProductsTableViewCell
        cell.nameLabel.text = names[indexPath.section][indexPath.row]
        cell.brandLabel.text = brands[indexPath.section][indexPath.row]
        cell.productImage.setImage(from: URL(string: productUrls[indexPath.section][indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        currentSection = indexPath.section
        performSegue(withIdentifier: "showProductPage", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductPage" {
            let destinationVC = segue.destination as! ProductPageViewController
//            print(currentSection)
//            print(currentRow)
//            print(productUrls[currentSection][currentRow])
            destinationVC.imageUrl = productUrls[currentSection][currentRow]
            destinationVC.productName = names[currentSection][currentRow]
            destinationVC.productBrand = brands[currentSection][currentRow]
            destinationVC.productCategory = sections[currentSection]
        }
    }
}
