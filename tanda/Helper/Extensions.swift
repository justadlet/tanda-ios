//
//  Extensions.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation
import SDWebImage

extension Int {
    var declension: String {
        get {
            let x = self % 100
            let keys = [2, 0, 1, 1, 1, 2]
            let y = (x % 10) < 5 ? (x % 10) : 5
            let suffix = ["", "а", "ов"]
            return "\(self) рецепт\(suffix[x > 4 && x < 21 ? 2 : keys[y]])"
        }
    }
}

extension UIColor {
    static var mainColor:  UIColor = UIColor(named: "Main")!
    static var backgroundColor:  UIColor = UIColor(named: "Background")!
}


extension UIImageView {
    func setImage(from url: URL?){
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "AppIcon"), options: .refreshCached, context: nil)
    }
}

extension UITableView {
    func addSectionHeader() {
        let nib = UINib(nibName: "SectionHeader", bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: "customSectionHeader")
    }
}


extension UIViewController {
    
    var loadingAlert: UIAlertController {
        get {
            let alertVC = UIAlertController(
                title: nil,
                message: "Загрузка...",
                preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            if #available(iOS 13.0, *) {
                loadingIndicator.style = UIActivityIndicatorView.Style.medium
            } else {
                loadingIndicator.style = UIActivityIndicatorView.Style(rawValue: 100)!
            }
            loadingIndicator.startAnimating()
            
            alertVC.view.addSubview(loadingIndicator)
            
            return alertVC
        }
    }
    
    func alert(_ text: String) -> UIAlertController {
        let alertVC = UIAlertController(
            title: nil,
            message: text,
            preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction.cancelAction)
        
        return alertVC
    }
    
    
    func showLogin() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController")
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func addLine(){
        let line = UIView(frame: CGRect(x: self.view.frame.width/2-30, y: 12, width: 66, height: 5))
        line.layer.cornerRadius = 2.5
        if #available(iOS 13.0, *) {
            line.backgroundColor = .separator
        } else {
            line.backgroundColor = UIColor(red: 0.783922, green: 0.78039, blue: 0.8, alpha: 1)
        }
        
        self.view.addSubview(line)
    }
    
    
    func keyboardAnimation() {
        UIViewPropertyAnimator(duration: TimeInterval(0.25), curve: UIView.AnimationCurve(rawValue: UIView.AnimationCurve.RawValue(7.0))!) {
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
}


extension UIAlertAction {
    static var cancelAction: UIAlertAction {
        get {
            return UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        }
    }
}

extension Date {
    var fromNow: (String, String) {
        get {
            let diff = Int(Date().timeIntervalSince1970) - Int(self.timeIntervalSince1970)
            if diff < 60 {
                return ("\(diff)s ago", "today")
            } else if diff < 60*60 {
                return ("\(diff/60)min ago", "today")
            } else if diff < 60*60*24 {
                return ("\(diff/3600)h ago", "today")
            } else if diff < 60*60*7*24 {
                return ("\(diff/(60*60*24))d ago", "this week")
            } else if diff < 60*60*24*28 {
                return ("\(diff/(60*60*24*7))w ago", "this month")
            } else if diff < 60*60*24*365 {
                return ("\(diff/(60*60*24*30))mon ago", "earlier")
            } else {
                return ("\(diff/(60*60*24*365))y ago", "earlier")
            }
        }
    }
}
