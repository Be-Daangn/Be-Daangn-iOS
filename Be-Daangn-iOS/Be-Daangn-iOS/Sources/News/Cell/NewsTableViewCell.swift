//
//  NewsTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 김혜수 on 2021/05/18.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier : String = "NewsTableViewCell"
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    

    @IBOutlet weak var newsAddressLabel: UILabel!
    @IBOutlet weak var newsDetailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(imageName: String, title: String, address: String, detail: String){
        if let image = UIImage(named: imageName) {
            newsImageView.image = image
        }
        
        newsTitleLabel.text = title
        newsAddressLabel.text = address
        newsDetailLabel.text = detail
    }

}
