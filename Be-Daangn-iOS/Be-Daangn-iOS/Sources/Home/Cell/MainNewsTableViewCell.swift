//
//  NewsTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/05/17.
//

import UIKit

class MainNewsTableViewCell: UITableViewCell {

    static let identifier : String = "MainNewsTableViewCell"

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var subNameLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none

        // Configure the view for the selected state
    }
    
    func setData(icon : String, name : String, subname:String, location : String){
        if let newsIcon = UIImage(named: icon){
            newsImage.image = newsIcon
        }
        nameLable.text = name
        subNameLable.text = subname
        locationLabel.text = location
        
    }

}
