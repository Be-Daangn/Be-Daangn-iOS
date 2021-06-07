//
//  RecommendTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/05/18.
//

import UIKit

class RecommendTableViewCell: UITableViewCell {
    
    static let identifier : String = "RecommendTableViewCell"

    @IBOutlet weak var recommendImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var customLabel: UILabel!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setRound(){
        recommendImage.clipsToBounds = true

        recommendImage.layer.cornerRadius = 20
//        recommendImage.layer.borderWidth = 2
//        recommendImage.layer.borderColor = UIColor.gray.cgColor
//        recommendImage.layer.shadowOpacity = 1
//        recommendImage.layer.shadowColor = UIColor.black.cgColor
//        recommendImage.layer.shadowOffset = CGSize(width: 0, height: 0)
//        recommendImage.layer.shadowRadius = 0

    }
    
    func setNetworkData(){
        setRound()
        GetHomeDataService.shared.getHomeInfo { (response) in
                    switch(response)
                    {
                    
                    case .success(let newsData):
                        print("newsData", newsData, type(of: newsData))
                        
                        if let data = newsData as? [HomeDataModel] {
                            var infoText : String = data[2].info
                            //url에 정확한 이미지 url 주소를 넣는다.
                            let url = URL(string: data[2].image)
                            DispatchQueue.global().async { let data = try? Data(contentsOf: url!)
                                DispatchQueue.main.async { self.recommendImage.image = UIImage(data: data!) } }
                            self.setLabel()
                            self.nameLabel.text = data[2].title
                            self.subjectLabel.text = infoText.replacingOccurrences(of: "\\n", with: " ")
                            self.locationLabel.text = data[2].place
                            self.recommendImage.image = UIImage(contentsOfFile: data[2].image)
                        }
                    case .requestErr(let message) :
                        print("requestERR",message)
                    case .pathErr :
                        print("pathERR NE")
                    case .serverErr:
                        print("serverERR")
                    case .networkFail:
                        print("networkFail")
                    }
                }
    }
    
    
    func setRecommendNetworkData(){
        setRound()
        print("호잇22")
        GetRecommendDataService.sharedRecommend.getRecommendInfo { (rcommendResponse) in
                    switch(rcommendResponse)
                    {
                    case .success(let recommendData):
                        print("호잇", recommendData, type(of: recommendData))
                        if let recommendData = recommendData as? [RecommendDataModel] {
                            self.customLabel.text = "후기 " + String(recommendData[0].review)
                            self.reviewLabel.text = "단골 " + String(recommendData[0].customer)
                        }
                    case .requestErr(let message) :
                        print("requestERR",message)
                    case .pathErr :
                        print("pathERR RE")
                    case .serverErr:
                        print("serverERR")
                    case .networkFail:
                        print("networkFail")
                    }
                }
    }
    
    
    
    func setLabel(){
        print("함수 실행")
        self.subjectLabel.numberOfLines = 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none

        // Configure the view for the selected state
    }

}
extension RecommendTableViewCell {
    
}
