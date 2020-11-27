//
//  ContactViewController.swift
//  tanda
//
//  Created by Адлет Зейнекен on 25.06.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Contacts

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("Asked contacts successfully")
            } else {
                print("Error while getting contacts")
            }
        }
        fetchContacts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].firstName + " " + contacts[indexPath.row].secondName
        cell.detailTextLabel?.text = contacts[indexPath.row].number
        
        return cell
    }
    
    func fetchContacts() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        do {
            try contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
                let name = contact.givenName
                let secondName = contact.familyName
                let number = contact.phoneNumbers.first?.value.stringValue
            
                let contactToAppend = ContactStruct(firstName: name, secondName: secondName, number: number ?? "")
                self.contacts.append(contactToAppend)
            }
            tableView.reloadData()
        } catch {
            print("Could not fetch contacts")
        }
    }
}
