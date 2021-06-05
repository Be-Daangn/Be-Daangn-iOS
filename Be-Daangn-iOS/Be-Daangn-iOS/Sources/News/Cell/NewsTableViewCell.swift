//
//  NewsTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 김혜수 on 2021/05/18.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    static let identifier : String = "NewsTableViewCell"
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    

    @IBOutlet weak var newsAddressLabel: UILabel!
    @IBOutlet weak var newsDetailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        // 라벨 폰트 적용
        newsTitleLabel.font = UIFont.NotoSans(.bold, size: 20)
        newsAddressLabel.font = UIFont.NotoSans(.extraBold, size: 12)
        newsDetailLabel.font = UIFont.NotoSans(.medium, size: 14)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setData(imageName: String, title: String, address: String, detail: String){
        

        let url = URL(string: imageName)
       
//        if let imageURL = URL(string: imageName) {
//            let processor = RoundCornerImageProcessor(cornerRadius: 50)
//            newsImageView.kf.setImage(with: imageURL, options: [.processor(processor)])
//        }

        newsImageView.kf.setImage(with: url)
        newsTitleLabel.text = title
        newsAddressLabel.text = address
        newsDetailLabel.text = detail
        
    }

}
