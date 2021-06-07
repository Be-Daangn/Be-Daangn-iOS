//
//  HomeViewController.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK: 뷰 및 데이터 선언
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
        setRound() //헤더뷰 및 서치뷰 모서리 둥글게
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        self.view.sendSubviewToBack(searchView) //뷰끼리 우선순위 조정
        self.view.sendSubviewToBack(homeTableView)       // code
    }
    
    //MARK: 데이터 설정 함수
    func setSectionData(){
        sectionModel.append(contentsOf: [sectionDataModel(name: "소식"),
                                         sectionDataModel(name: "추천 가게")])
    }
    
    func setSmallSectionData(){
        smallSectionModel.append(contentsOf: [smallSectionDataModel(name: "소식 전체보기 >"),
                                              smallSectionDataModel(name: "추천 가게 전체보기 >")])
    }

    func setNewsData(){
//        newsModel.append(contentsOf: [newsDataModel(Newsimage: "news1",
//                                                    name: "아인플라워오픈행사",
//                                                    subname: "아인플라워",
//                                                    location: "한남동"), newsDataModel(Newsimage: "news2", name: "인테리어상담서비스", subname: "제일인테리어", location: "한남동"), newsDataModel(Newsimage: "news3", name: "시즌 디저트 개시", subname: "아워즈카페", location: "한남동") ])
       
        
    }
    //MARK: 뷰 모서리 곡선화 함수
    func setRound(){
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 20
        headerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 20
        searchView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        
    }
    //MARK: 서치뷰로 푸시하는 함수
    @IBAction func searchButtonClicked(_ sender: Any) {
        print("버튼클릭")
        guard let searchVC = storyboard?.instantiateViewController(identifier: "SearchViewController")
                as? SearchViewController else {return}
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{ //새로고침부분
            return 140
        }
        if indexPath.row == 2{ //소식
            return 50
        }
        
        if indexPath.row == 3{ //소식 CEll 1
            return 110
        }
        if indexPath.row == 4{//소식 CEll 2
            return 110
        }
        if indexPath.row == 5{//소식 CEll 3
            return 110
        }
        if indexPath.row == 6{ //소식 전체보기
            return 50
        }
        if indexPath.row == 7{ // 추천가게
            return 105
        }
        if indexPath.row == 8{ // 추천가게 Cell
            return 390
        }
        if indexPath.row == 9{ // 추천가게 전체보기
            return 50
        }
        return 210 //버튼셀
        
    }
    //MARK: 테이블뷰 셀 구현부분
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6{
            guard let newsVC = UIStoryboard(name: "NewsStoryboard", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController else {return}
            self.navigationController?.pushViewController(newsVC, animated: true)
        }
        if indexPath.row == 9 {
        guard let recommendVC = UIStoryboard(name: "RecommendStoryboard", bundle: nil).instantiateViewController(identifier: "RecommendViewController") as? RecommendViewController else {return}
        self.navigationController?.pushViewController(recommendVC, animated: true)
    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let MainButtonCell = tableView.dequeueReusableCell(withIdentifier: MainButtonTableViewCell.identifier) as? MainButtonTableViewCell else {return UITableViewCell() }
        guard let NewsCell = tableView.dequeueReusableCell(withIdentifier: MainNewsTableViewCell.identifier) as? MainNewsTableViewCell else {return UITableViewCell() }
        guard let SectionCell = tableView.dequeueReusableCell(withIdentifier: SectionTableViewCell.identifier) as? SectionTableViewCell else {return UITableViewCell() }
        guard let SmallSectionCell = tableView.dequeueReusableCell(withIdentifier: SmalllSectionTableViewCell.identifier) as? SmalllSectionTableViewCell else {return UITableViewCell() }
        guard let RecommendCell = tableView.dequeueReusableCell(withIdentifier: RecommendTableViewCell.identifier) as? RecommendTableViewCell else {return UITableViewCell() }
        guard let RefreshCell = tableView.dequeueReusableCell(withIdentifier: RefreshTableViewCell.identifier) as? RefreshTableViewCell else {return UITableViewCell() }
        setSmallSectionData()
        setSectionData()
        SectionCell.setData(name: sectionModel[indexPath.row].name)
        SmallSectionCell.setData(name: smallSectionModel[indexPath.row].name)
       
        
        
        
        
        if indexPath.row == 0{
            return RefreshCell
        }
        if indexPath.row == 1{
        return MainButtonCell
        }
        if indexPath.row == 2{
            return SectionCell
        }
        if indexPath.row == 3{
            NewsCell.setNetworkData(n: 0)
            return NewsCell
        }
        if indexPath.row == 4{
            NewsCell.setNetworkData(n: 1)
            return NewsCell
        }
        if indexPath.row == 5{
            NewsCell.setNetworkData(n: 2)
            return NewsCell
        }
        if indexPath.row == 6{
            return SmallSectionCell
        }
        if indexPath.row == 7{
            return SectionCell
        }
        if indexPath.row == 8{
            RecommendCell.setNetworkData()
            RecommendCell.setRecommendNetworkData()
            return RecommendCell
        }
        if indexPath.row == 9{
            return SmallSectionCell
        }
        return UITableViewCell()
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

           if scrollView.contentOffset.y > 0 {
               if scrollView.contentOffset.y < 2000 {
                searchViewConstraint.constant = -scrollView.contentOffset.y-20
               } else {
                searchViewConstraint.constant = -100
               }
           }
        else{
            searchViewConstraint.constant = -20
           }

       }
    
    
}
