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
        storeImageView.layer.applyShadow(color: .black,
                                         alpha: 0.25,
                                         x: 0,
                                         y: 4,
                                         blur: 4)
        
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
        
        // 혹시나 해서 검색해봤는데, Kingfisher로 가져온 이미지에 cornerRadius 적용하려면
        // 아래와 같이 코드를 작성해서 옵션을 적용해줘야 한다.
        /*
         let processor = RoundCornerImageProcessor(cornerRadius: 20)
         imageView.kf.setImage(with: url, placeholder: nil, options: [.processor(processor)])
         */
        if let imageURL = URL(string: image) {
            let processor = RoundCornerImageProcessor(cornerRadius: 20)
            self.storeImageView.kf.setImage(with: imageURL, options: [.processor(processor)])
        }
        
        self.storeNameLabel.text = name
        self.storeReviewLabel.text = "후기 \(review)"
        self.storeCustomerLabel.text = "단골 \(customer)"
    }
}
