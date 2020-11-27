//
//  OneChefViewController.swift
//  tanda
//
//  Created by Адлет Зейнекен on 12.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Alamofire

class OneChefViewController: UIViewController {
 
    enum chefView {
        case recipes
        case lessons
        case reviews
    }
    var currentView: chefView = .recipes
    var reviews: [Review] = []
    var recipes: [Recipe] = []
    var masterclasses: [Masterclass] = [Masterclass(_id: "0", name: "Фисташковый рулет с малиной", date: "16 июня, 22:00", recipe_id: "5f0f20fbcc4f85085f63422e", limit: 10, members: 8, duration: 120, price: 1990, image: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg", platform: ["name" : "Zoom", "link" : "http://zoom.us/"], terms: ["First term", "Second term", "Third term"], requirement: [["field" : "gender", "parameter" : "=", "value" : "female"], ["field" : "age", "parameter" : ">", "value" : "12"]], author_id: "5f0eab3ecc4f85085f63422c")]
    
//    var lessons: [Masterclass] = []
//    var selectedMasterClass: Masterclass = Masterclass()
    
    @IBOutlet weak var tableView: UITableView!
    
    var chef = Chef()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        fetchData()
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
        
//        Alamofire.request(Constants.lessonsURL).response(completionHandler: { (response) in
//            if let data = response.data {
//                do {
//                    self.lessons = try JSONDecoder().decode([Masterclass].self, from: data)
////                    print(self.lessons[0].name)
//                    self.tableView.reloadData()
//                } catch {
//                    print("Error while decoding lessons: \(error)")
//                }
//            }
//        })
        
        Alamofire.request(Constants.reviewsURL).response(completionHandler: { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    self.reviews = try decoder.decode([Review].self, from: data)
//                    print(self.reviews[0].body)
//                    print(self.reviews[0].updatedAt)
                    self.tableView.reloadData()
                } catch {
                    print("Error while decoding reviews: \(error)")
                }
            }
        })
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            currentView = .recipes
        } else if sender.selectedSegmentIndex == 1 {
            currentView = .lessons
        } else if sender.selectedSegmentIndex == 2 {
            currentView = .reviews
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMasterClass" {
//            let dest = segue.destination as! MasterClassViewController
//            dest.masterClass = self.selectedMasterClass
        }
    }
    
}

extension OneChefViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentView == .recipes {
            return 2 + recipes.count
        }
        else if currentView == .lessons {
            return 2 + masterclasses.count
        }
        return 2 + reviews.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "chefCell", for: indexPath) as! OneChefTableViewCell
            cell.chef = self.chef
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "segmentedControlCell", for: indexPath) as! SegmentedControlTableViewCell
            return cell
        }
        else if currentView == .recipes {
            let cell = tableView.dequeueReusableCell(withIdentifier: "meal", for: indexPath) as! MealTableViewCell
            cell.recipe = self.recipes[indexPath.row - 2]
            return cell
        }
        else if currentView == .lessons {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath) as! LessonTableViewCell
            cell.lesson = self.masterclasses[indexPath.row - 2]
            return cell
        }
        // REVIEWS
        // reviewSummaryCell
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewSummaryCell", for: indexPath) as! ReviewSummaryTableViewCell
            cell.rating = self.chef.rating
            return cell
        }
        // reviewBodyCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewBodyCell", for: indexPath) as! ReviewBodyTableViewCell
        cell.review = self.reviews[indexPath.row - 3]
        cell.reviewIndexPath = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentView == .lessons {
            if indexPath.row > 1 {
                self.performSegue(withIdentifier: "showMasterclass", sender: nil)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

