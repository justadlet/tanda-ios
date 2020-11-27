//
//  reviewSummaryCell.swift
//  tanda
//
//  Created by Адлет Зейнекен on 15.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class ReviewSummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var numberOfRatingsLabel: UILabel!
    @IBOutlet weak var progressView0: UIProgressView!
    @IBOutlet weak var progressView1: UIProgressView!
    @IBOutlet weak var progressView2: UIProgressView!
    @IBOutlet weak var progressView3: UIProgressView!
    @IBOutlet weak var progressView4: UIProgressView!
    @IBOutlet weak var reviewsLabel0: UILabel!
    @IBOutlet weak var reviewsLabel1: UILabel!
    @IBOutlet weak var reviewsLabel2: UILabel!
    @IBOutlet weak var reviewsLabel3: UILabel!
    @IBOutlet weak var reviewsLabel4: UILabel!
    @IBOutlet weak var squareView: UIView!
    
    var rating: [Int] = [] {
        didSet {
            let sum = rating[0] + rating[1] * 2 + rating[2] * 3  + rating[3] * 4 + rating[4] * 5
            let size = rating[0] + rating[1] + rating[2] + rating[3] + rating[4]
            averageRatingLabel.text = String(format: "%.1f", Double(Double(sum) / Double(size)))
            numberOfRatingsLabel.text = "\(size)"
            progressView0.progress = Float(Float(rating[0]) / Float(size))
            progressView1.progress = Float(Float(rating[1]) / Float(size))
            progressView2.progress = Float(Float(rating[2]) / Float(size))
            progressView3.progress = Float(Float(rating[3]) / Float(size))
            progressView4.progress = Float(Float(rating[4]) / Float(size))
            reviewsLabel0.textAlignment = .right
            reviewsLabel1.textAlignment = .right
            reviewsLabel2.textAlignment = .right
            reviewsLabel3.textAlignment = .right
            reviewsLabel4.textAlignment = .right
            reviewsLabel0.text = "\(rating[0])"
            reviewsLabel1.text = "\(rating[1])"
            reviewsLabel2.text = "\(rating[2])"
            reviewsLabel3.text = "\(rating[3])"
            reviewsLabel4.text = "\(rating[4])"
            squareView.layer.cornerRadius = 14
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
