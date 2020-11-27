//
//  WalkthroughContentViewController.swift
//  tanda
//
//  Created by Адлет Зейнекен on 08.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var miniTitle1: UILabel!
    @IBOutlet weak var miniDescription1: UILabel!
    @IBOutlet weak var miniTitle2: UILabel!
    @IBOutlet weak var miniDescription2: UILabel!
    @IBOutlet weak var miniTitle3: UILabel!
    @IBOutlet weak var miniDescription3: UILabel!
    @IBOutlet weak var miniTitle4: UILabel!
    @IBOutlet weak var miniDescription4: UILabel!
    var index = 0
    var titleText = ""
    var descriptionText = ""
    var imageURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        mainImage?.setImage(from: URL(string: imageURL))
        // Do any additional setup after loading the view.
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
