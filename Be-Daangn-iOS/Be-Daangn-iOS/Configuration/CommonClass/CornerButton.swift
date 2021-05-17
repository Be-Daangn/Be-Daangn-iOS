//
//  CornerButton.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/17.
//

import UIKit

class CornerButton: UIButton {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
    }

}
