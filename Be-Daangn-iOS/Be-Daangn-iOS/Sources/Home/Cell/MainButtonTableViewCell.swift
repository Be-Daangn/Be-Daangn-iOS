//
//  MainButtonTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/05/17.
//

import UIKit

class MainButtonTableViewCell: UITableViewCell {
    
    static let identifier : String = "MainButtonTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.selectionStyle = .none
        // Configure the view for the selected state
    }

}
