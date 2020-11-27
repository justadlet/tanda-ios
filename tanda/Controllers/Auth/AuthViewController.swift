//
//  AuthViewController.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var phoneField: UITextField!
    var codeSent = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        codeField.delegate = self
        phoneField.delegate = self
        mainButton.layer.cornerRadius = 12
        self.addLine()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let loading = self.loadingAlert
        if self.codeSent {
            guard let phone = self.phoneField.text, let code = self.codeField.text else {
                return
            }
            self.present(loading, animated: true, completion: nil)
            User.confirmCode(phone, code, completion: { (callback, user) in
                loading.dismiss(animated: true, completion: nil)
//                print(user)
                if callback.status == 200 {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    let alert = self.alert("Возникла ошибка")
                    self.present(alert, animated: true, completion: nil)
                }
            })
        } else {
            guard let phone = self.phoneField.text else {
                return
            }
            self.present(loading, animated: true, completion: nil)
            User.sendCode(phone) { (callback) in
                loading.dismiss(animated: true, completion: nil)
                if callback.status == 200 {
                    self.codeSent = true
                    self.topConstraint.constant = 0
                    self.bottomConstraint.constant = 0
                    self.keyboardAnimation()
                } else {
                    let alert = self.alert("Возникла ошибка")
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func termsPressed(_ sender: Any) {
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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
