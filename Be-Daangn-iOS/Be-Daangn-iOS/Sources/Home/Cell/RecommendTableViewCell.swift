//
//  RecommendTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/05/18.
//

import UIKit

class RecommendTableViewCell: UITableViewCell {
    
    static let identifier : String = "RecommendTableViewCell"

    @IBOutlet weak var recommendImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var customLabel: UILabel!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(icon : String, name : String, location : String, subject : String, review : String, custom : String){
        if let recommendIcon = UIImage(named: icon){
            recommendImage.image = recommendIcon
        }
        nameLabel.text = name
        locationLabel.text = location
        subjectLabel.text = subject
        customLabel.text = custom
        reviewLabel.text = review
        recommendImage.clipsToBounds = true
        recommendImage.layer.cornerRadius = 20
        }
    func setLabel(){
        print("함수 실행")
        self.subjectLabel.numberOfLines = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none

        // Configure the view for the selected state
    }

}
