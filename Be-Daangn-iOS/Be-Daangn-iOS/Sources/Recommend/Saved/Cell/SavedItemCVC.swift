//
//  SavedItemCVC.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/20.
//

import UIKit

import Kingfisher

class SavedItemCVC: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var savedItemImageView: UIImageView!
    @IBOutlet weak var savedItemTitleLabel: UILabel!
    @IBOutlet weak var savedItemPlaceLabel: UILabel!
    
    // MARK: - Properties
    static let identifier = "SavedItemCVC"

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: - Functions
    // UI Setup
    private func configureUI() {
        // Layer
        self.layer.cornerRadius = 14
        
        savedItemImageView.layer.applyShadow(color: .black,
                                         alpha: 0.25,
                                         x: 0,
                                         y: 4,
                                         blur: 4)
        
        // Font
        savedItemTitleLabel.font = UIFont.NotoSans(.extraBold, size: 13)
        savedItemPlaceLabel.font = UIFont.NotoSans(.bold, size: 9)
        
        // Color
        savedItemTitleLabel.textColor = .subGray1
        savedItemPlaceLabel.textColor = .subGray3
    }
    
    func setData(image: String,
                 name: String,
                 place: String) {
        if let imageURL = URL(string: image) {
            let processor = RoundCornerImageProcessor(cornerRadius: 20)
            self.savedItemImageView.kf.setImage(with: imageURL, options: [.processor(processor)])
        }
        
        self.savedItemTitleLabel.text = name
        self.savedItemPlaceLabel.text = place
    }
}
