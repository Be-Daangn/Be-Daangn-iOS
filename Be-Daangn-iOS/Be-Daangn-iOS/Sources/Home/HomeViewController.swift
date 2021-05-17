//
//  HomeViewController.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRound()
        
        
        // code
    }
    
    func setRound(){
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 40
        headerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 40
        searchView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        
    }
}

