//
//  SmalllSectionTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/05/18.
//

import UIKit

class SmalllSectionTableViewCell: UITableViewCell {
    
    static let identifier : String = "SmalllSectionTableViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(name : String){
        nameLabel.text = name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
