//
//  MasterClassViewController.swift
//  tanda
//
//  Created by Адлет Зейнекен on 17.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Alamofire

class MasterClassViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MasterClassViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lessonNameCell") as! MasterClassNameTableViewCell
//            cell.name = "Hello, world"
            return cell
//        }
        
    }
    
    
    
}
