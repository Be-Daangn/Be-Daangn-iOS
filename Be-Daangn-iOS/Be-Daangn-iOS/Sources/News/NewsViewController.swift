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
    @IBOutlet weak var middleTableView: UITableView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet var button: [CornerButton]!
    
    var newsServiceList : [NewsListDataModel] = []
    
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
        newsServiceList.append(contentsOf: [
            NewsListDataModel(imageName: "news1", title: "아인플라워 오픈 행사", address: "한남동", detail: """
        <<6월 1일 GRAND OPEN>>
                                      
        안녕하세요 당근님들!
        오픈 기념 이벤트 행사를 진행합니다!

        인스타그램 : aynflower

        카카오 플러스친구 : 아인플라워

        전화 : 070 4151 0488
"""),
            NewsListDataModel(imageName: "news2", title: "인테리어 상담 서비스", address: "한남동", detail: """
<<여름맞이 인테리어가 고민이라면?>>
                              
안녕하세요!
""")
        ])
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
        //return 700
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
        
        newsCell.setData(imageName: newsServiceList[indexPath.row].imageName,
                         title: newsServiceList[indexPath.row].title, address: newsServiceList[indexPath.row].address, detail: newsServiceList[indexPath.row].detail)
        
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
