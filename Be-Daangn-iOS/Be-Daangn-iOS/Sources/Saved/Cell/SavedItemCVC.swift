//
//  SavedItemCVC.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/20.
//

import UIKit

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
        // Font
        savedItemTitleLabel.font = UIFont.NotoSans(.extraBold, size: 13)
        savedItemPlaceLabel.font = UIFont.NotoSans(.bold, size: 9)
        
        // Color
        savedItemTitleLabel.textColor = .subGray1
        savedItemPlaceLabel.textColor = .subGray3
    }
}
