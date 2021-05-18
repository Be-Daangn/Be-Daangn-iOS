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
    var sectionModel : [sectionDataModel] = []
    var smallSectionModel : [smallSectionDataModel] = []
    
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
    func setSectionData(){
        sectionModel.append(contentsOf: [sectionDataModel(name: "소식"), sectionDataModel(name: "추천 가게")])
    }
    
    func setSmallSectionData(){
        smallSectionModel.append(contentsOf: [smallSectionDataModel(name: "소식 전체보기 >"), smallSectionDataModel(name: "추천 가게 전체보기 >")])
    }

    func setNewsData(){
        newsModel.append(contentsOf: [newsDataModel(Newsimage: "news1", name: "아인플라워오픈행사", subname: "아인플라워", location: "한남동"), newsDataModel(Newsimage: "news2", name: "인테리어상담서비스", subname: "제일인테리어", location: "한남동"), newsDataModel(Newsimage: "news3", name: "시즌 디저트 개시", subname: "아워즈카페", location: "한남동") ])
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 120
        }
        if indexPath.row == 2{
            return 50
        }
        
        if indexPath.row == 3{
            return 105
        }
        if indexPath.row == 4{
            return 105
        }
        if indexPath.row == 5{
            return 105
        }
        if indexPath.row == 6{
            return 50
        }
        return 210
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let MainButtonCell = tableView.dequeueReusableCell(withIdentifier: MainButtonTableViewCell.identifier) as? MainButtonTableViewCell else {return UITableViewCell() }
        guard let NewsCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as? NewsTableViewCell else {return UITableViewCell() }
        guard let SectionCell = tableView.dequeueReusableCell(withIdentifier: SectionTableViewCell.identifier) as? SectionTableViewCell else {return UITableViewCell() }
        guard let SmallSectionCell = tableView.dequeueReusableCell(withIdentifier: SmalllSectionTableViewCell.identifier) as? SmalllSectionTableViewCell else {return UITableViewCell() }
        setSmallSectionData()
        setNewsData()
        setSectionData()
        SectionCell.setData(name: sectionModel[indexPath.row].name)
        NewsCell.setData(icon: newsModel[indexPath.row].Newsimage, name: newsModel[indexPath.row].name, subname: newsModel[indexPath.row].subname, location: newsModel[indexPath.row].location)
        SmallSectionCell.setData(name: smallSectionModel[indexPath.row].name)
        
        if indexPath.row == 1{
        return MainButtonCell
        }
        if indexPath.row == 2{
            return SectionCell
        }
        if indexPath.row == 3{
            return NewsCell
        }
        if indexPath.row == 4{
            return NewsCell
        }
        if indexPath.row == 5{
            return NewsCell
        }
        if indexPath.row == 6{
            return SmallSectionCell
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
