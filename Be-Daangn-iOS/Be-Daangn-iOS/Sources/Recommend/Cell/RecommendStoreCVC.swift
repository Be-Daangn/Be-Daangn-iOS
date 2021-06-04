//
//  RecommendStoreCVC.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/17.
//

import UIKit

import Kingfisher

class RecommendStoreCVC: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeReviewLabel: UILabel!
    @IBOutlet weak var storeCustomerLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    // MARK: - Properties
    static let identifier = "RecommendStoreCVC"

    // MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        // font
        storeNameLabel.font = UIFont.NotoSans(.bold, size: 20)
        storeReviewLabel.font = UIFont.NotoSans(.extraBold, size: 13)
        storeCustomerLabel.font = UIFont.NotoSans(.extraBold, size: 13)
        
        // text color
        storeNameLabel.textColor = UIColor.subGray1
        storeReviewLabel.textColor = UIColor.mainOrange
        storeCustomerLabel.textColor = UIColor.subGray2
    }

    func setData(image: String,
                 name: String,
                 review: String,
                 customer: String) {
        
        if let imageURL = URL(string: image) {
            self.storeImageView.kf.setImage(with: imageURL)
        }
        
        self.storeNameLabel.text = name
        self.storeReviewLabel.text = "후기 \(review)"
        self.storeCustomerLabel.text = "단골 \(customer)"
    }
}
