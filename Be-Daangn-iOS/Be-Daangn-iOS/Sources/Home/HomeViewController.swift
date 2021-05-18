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
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var searchViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewConstraint: NSLayoutConstraint!
    
    var newsModel : [newsDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRound()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        self.view.sendSubviewToBack(searchView)
        self.view.sendSubviewToBack(homeTableView)
        
        // code
    }
    

    func setNewsData(){
        newsModel.append(contentsOf: [newsDataModel(image: "news1", name: "아인플라워오픈행사", subname: "아인플라워", location: "한남동"), newsDataModel(image: "news2", name: "인테리어상담서비스", subname: "제일인테리어", location: "한남동"), newsDataModel(image: "news3", name: "시즌 디저트 개시", subname: "아워즈카페", location: "한남동") ])
    }
    
    func setRound(){
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 20
        headerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 20
        searchView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        
    }
   
}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 120
        }
        return 210
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let MainButtonCell = tableView.dequeueReusableCell(withIdentifier: MainButtonTableViewCell.identifier) as? MainButtonTableViewCell else {return UITableViewCell() }
        
        if indexPath.row == 1{
        return MainButtonCell
        }
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

           if scrollView.contentOffset.y > 0 {
            print("되냐?")
               if scrollView.contentOffset.y < 2000 {
                searchViewConstraint.constant = -scrollView.contentOffset.y-20
               } else {
                searchViewConstraint.constant = -100
                print("-100")
               }
           }
        else{
            searchViewConstraint.constant = -20
           }

       }
    
    
}
