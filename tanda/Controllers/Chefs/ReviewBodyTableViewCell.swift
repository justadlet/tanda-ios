//
//  ReviewBodyTableViewCell.swift
//  tanda
//
//  Created by Адлет Зейнекен on 16.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Alamofire

class ReviewBodyTableViewCell: UITableViewCell {
    @IBOutlet weak var reviewAuthorNameLabel: UILabel!
    @IBOutlet weak var reviewAuthorImage: UIImageView!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var starsStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var reviewBodyLabel: UILabel!
    @IBOutlet weak var replyBodyLabel: UILabel!
    @IBOutlet weak var replyDateLabel: UILabel!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewTopMargin: NSLayoutConstraint!
    @IBOutlet weak var replyViewTopMargin: NSLayoutConstraint!
    @IBOutlet weak var arrowHeight: NSLayoutConstraint!
    @IBOutlet weak var arrowWidth: NSLayoutConstraint!
    @IBOutlet weak var replyViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var reviewBodyTopMargin: NSLayoutConstraint!
    @IBOutlet weak var replyViewHeight: NSLayoutConstraint!
    var reviewIndexPath: IndexPath!
    
    var reviewAuthor = Chef() {
        didSet {
            reviewAuthorNameLabel.text = reviewAuthor.name
            reviewAuthorImage.layer.cornerRadius = 14
            reviewAuthorImage.setImage(from: reviewAuthor.imageURL)
            reviewDateLabel.text = review.updatedAt?.fromNow.0
            for i in 0...4 {
                (starsStackView.subviews[i] as! UIImageView).image = UIImage(systemName: "star")
            }
            for i in 0..<review.rating! {
                (starsStackView.subviews[i] as! UIImageView).image = UIImage(systemName: "star.fill")
            }
        }
    }
    var review = Review() {
        didSet {
            if review.images.count == 0 {
                collectionViewHeight.constant = 0
                collectionViewTopMargin.constant = 0
            } else {
                collectionViewHeight.constant = 200
                collectionViewTopMargin.constant = 12
            }
            if review.reply_to == "" {
                replyViewTopMargin.constant = 0
                replyViewBottomMargin.constant = 0
                replyViewHeight.constant = 0
                arrowHeight.constant = 0
                arrowWidth.constant = 0
                replyDateLabel.text = ""
                replyBodyLabel.text = ""
            } else {
                replyBodyLabel.text = review.reply_to
                replyViewBottomMargin.constant = 12
                replyViewTopMargin.constant = 12
                replyViewHeight.constant = 1000
                replyDateLabel.text = "ReplyDateLable"
                arrowHeight.constant = 25
                arrowWidth.constant = 24
            }
            if review.body == "" {
                reviewBodyLabel.text = ""
                reviewBodyTopMargin.constant = 0
            } else {
                reviewBodyLabel.text = review.body
                reviewBodyTopMargin.constant = 12
            }
            self.imagePageControl.numberOfPages = review.images.count
            self.collectionView.layer.cornerRadius = 14
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.reloadData()
            let reviewAuthorURL = "\(Constants.chefsURL)/\(review.author_id!)"
            Alamofire.request(reviewAuthorURL).response(completionHandler: { (response) in
                if let data = response.data {
                    do {
                        self.reviewAuthor = try JSONDecoder().decode(Chef.self, from: data)
                    } catch {
                        print("Error while decoding reviewAuthor: \(error)")
                    }
                }
            })
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

extension ReviewBodyTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        imagePageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.imagePageControl.currentPage = indexPath.section
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return review.images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ReviewImageCollectionViewCell
        if indexPath.row < review.images.count {
            cell.image = review.images[indexPath.row] ?? ""
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate.select(reviewIndexPath)
//        collectionView.deselectItem(at: indexPath, animated: true)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
