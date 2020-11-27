//
//  ProfileViewController.swift
//  Qolzhetimdi
//
//  Created by Kuanysh Anarbay on 5/8/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Contacts


class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var currentUser: User? = User.currentUser
    let steps = [
        "Шаг 1: Напишите ваше имя и фото",
        "Шаг 2: Укажите ваш адрес доставки",
        "Шаг 3: Добавьте вашу карту"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Вид", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Системный", style: .default, handler: { (action) in
            UserDefaults.standard.set("Системный", forKey: "appearance")
            if #available(iOS 13.0, *) {
                self.overrideUserInterfaceStyle = .unspecified
            } else {
                // no dark mode in ios 12 :)
            }
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Светлый", style: .default, handler: { (action) in
            UserDefaults.standard.set("Светлый", forKey: "appearance")
            if #available(iOS 13.0, *) {
                self.overrideUserInterfaceStyle = .light
            } else {
                // no dark mode in ios 12 :)
            }
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Темный", style: .default, handler: { (action) in
            UserDefaults.standard.set("Темный", forKey: "appearance")
            if #available(iOS 13.0, *) {
                self.overrideUserInterfaceStyle = .dark
            } else {
                // no dark mode in ios 12 :)
            }
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction.cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 2
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if  indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
                
                cell.nameLabel.text = currentUser?.name
                cell.phoneLabel.text = currentUser?.phoneNumber
                cell.mainImage.setImage(from: URL(string: currentUser?.image ?? ""))
                cell.mainImage.isUserInteractionEnabled = true
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! ProgressTableViewCell
                
                return cell
            }
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Купон"
            case 1:
                cell.textLabel?.text = "Уроки"
            case 2:
                cell.textLabel?.text = "Контакты"
            default:
                cell.textLabel?.text = "Вид"
            }
            
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            if indexPath.row == 0 {
                cell.textLabel?.text = "Карта"
                if #available(iOS 13.0, *) {
                    cell.imageView?.image = UIImage(systemName: "questionmark.circle.fill")
                } else {
                    cell.imageView?.image = UIImage(named: "questionmark.circle.fill")
                }
                cell.imageView?.tintColor = UIColor.systemPurple
                cell.detailTextLabel?.text = ""
            } else {
                cell.textLabel?.text = "Адрес"
                if #available(iOS 13.0, *) {
                    cell.imageView?.image = UIImage(systemName: "info.circle.fill")
                } else {
                    cell.imageView?.image = UIImage(named: "info.circle.fill")
                }
                cell.imageView?.tintColor = UIColor.systemPink
                cell.detailTextLabel?.text = ""
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            if indexPath.row == 0 {
                cell.textLabel?.text = "Условия и правила"
                if #available(iOS 13.0, *) {
                    cell.imageView?.image = UIImage(systemName: "exclamationmark.shield.fill")
                } else {
                    cell.imageView?.image = UIImage(named: "exclamationmark.shield.fill")
                }
                cell.imageView?.tintColor = UIColor.systemGreen
                cell.detailTextLabel?.text = ""
            } else {
                cell.textLabel?.text = "Вопросы"
                if #available(iOS 13.0, *) {
                    cell.imageView?.image = UIImage(systemName: "info.circle.fill")
                } else {
                    cell.imageView?.image = UIImage(named: "info.circle.fill")
                }
                cell.imageView?.tintColor = UIColor.systemPink
                cell.detailTextLabel?.text = ""
            }
            return cell
        }
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Общие"
        case 2:
            return "Оплата"
        case 3:
            return "Помощь "
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 38
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        } else if indexPath.section == 1 {
            switch indexPath.row {
                case 2:
                    self.performSegue(withIdentifier: "showContacts", sender: nil)
                default:
                    print("hello")
                }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.section == 0 {
                return 80
            }
            return 66
        }
        
        return 44
    }
    
}
