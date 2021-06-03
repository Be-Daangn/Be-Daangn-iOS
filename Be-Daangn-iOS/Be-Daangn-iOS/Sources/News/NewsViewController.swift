//
//  NewsViewController.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

import UIKit
import Kingfisher

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var middleTableView: UITableView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet var button: [CornerButton]!
    
    var newsServiceList : [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNewsServiceList()
        
        newsLabel.font = UIFont.NotoSans(.extraBold, size: 27)
        for button in button {
            button.titleLabel?.font = UIFont.NotoSans(.extraBold, size: 13)
        }
      
        
        
        middleTableView.delegate = self
        middleTableView.dataSource = self
        
        // 아래 View 모서리 둥글게 하기
        middleView.layer.cornerRadius = 60
        middleView.layer.masksToBounds = true
        middleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // 상단 좌, 우 coner만
        
        // code
    }
    

    
    func setNewsServiceList(){
      
        GetNewsListService.shared.getNews { (response) in
                    switch(response){
                    
                    case .success(let newsDataList):
                        
                        if let newsDataListR = newsDataList as? [News] {
                            for newsData in newsDataListR {
                                
                                let info = newsData.info.replacingOccurrences(of: "\\n", with: "\n")
                                
                                
            
                                self.newsServiceList.append(contentsOf: [
                                    News(id: newsData.id,
                                                             titleIdx: newsData.titleIdx,
                                                             title: newsData.title,
                                                             image: newsData.image,
                                                             event: newsData.event, place: newsData.place, info: info, v: newsData.v)
                                                                          ])
                                self.middleTableView.reloadData()
                                

                            
                        }
                            
                        
                        }
                        else {
                            print("설마 여기나옴?")
                        }
                        
                        
                        
                    case .requestErr(let message) :
                        print("requestERR", message)
                    case .pathErr :
                        print("pathERR")
                    case .serverErr:
                        print("serverERR")
                    case .networkFail:
                        print("networkFail")
                        
                    }
                    
                }
        
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        setButtonColor(state: sender.isSelected, tag: sender.tag)
        
    }
    // 뒤로가는 버튼을 누르면
    @IBAction func backButtonClicked(_ sender: Any) {
        // 홈 뷰로 이동
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 500
        return UITableView.automaticDimension
        
    }
    
}
extension NewsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsServiceList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell =  middleTableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        
        newsCell.setData(imageName: newsServiceList[indexPath.row].image,
                         title: newsServiceList[indexPath.row].title,
                         address: newsServiceList[indexPath.row].place,
                         detail: newsServiceList[indexPath.row].info)
        

        return newsCell
        
    }
    
    
}

extension NewsViewController {
    private func setButtonColor(state: Bool, tag: Int) {
        // 눌렸을때
        if state {
            button[tag].backgroundColor = .white
            button[tag].setTitleColor(.mainOrange, for: .selected)
        }
        // 안 눌렸을때
        else {
            button[tag].backgroundColor = .clear
            button[tag].setTitleColor(.white, for: .normal)
        }
    }
}
