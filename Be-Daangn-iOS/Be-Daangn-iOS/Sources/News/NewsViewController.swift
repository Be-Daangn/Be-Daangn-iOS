//
//  NewsViewController.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

import UIKit

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 아래 View 모서리 둥글게 하기
        middleView.layer.cornerRadius = 60
        middleView.layer.masksToBounds = true
        middleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // 상단 좌, 우 coner만
        
        // code
    }
}
