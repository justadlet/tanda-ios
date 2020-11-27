//
//  ProductPageViewController.swift
//  tanda
//
//  Created by Адлет Зейнекен on 25.06.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class ProductPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    var imageUrl = ""
    var productName = ""
    var productCategory = ""
    var productBrand = ""
    var shopNames = ["Magnum Cash & Carry"]
    var shopAddresses = ["Улица Бауржан Момышулы, 15"]
    var shopImages = ["https://media-exp1.licdn.com/dms/image/C4D0BAQGjBoMj0HzxOQ/company-logo_200_200/0?e=2159024400&v=beta&t=i6iE4SWWe3V4R8ERasMb1RQrYG1YEBU1eFSG2nxjp18"]
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLabel.setImage(from: URL(string: imageUrl))
        nameLabel.text = productName
        categoryLabel.text = productCategory
        brandLabel.text = productBrand
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
