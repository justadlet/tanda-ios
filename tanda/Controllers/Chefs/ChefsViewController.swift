//
//  ChefsViewController.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Alamofire

class ChefsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var chefs: [Chef] = []
    var selectedChef = Chef()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        fetchData()
    }
    func fetchData() {
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
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChef" {
            let dest = segue.destination as! OneChefViewController
            dest.chef = self.selectedChef
        }
    }
}


extension ChefsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chefs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chef", for: indexPath) as! ChefTableViewCell
        if indexPath.row < chefs.count {
            cell.chef = chefs[indexPath.row]
//            print(chefs[indexPath.row].name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedChef = chefs[indexPath.row]
        self.performSegue(withIdentifier: "showChef", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
