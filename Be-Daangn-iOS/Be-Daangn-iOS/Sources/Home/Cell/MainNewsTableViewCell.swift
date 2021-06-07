//
//  NewsTableViewCell.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/05/17.
//

import UIKit

class MainNewsTableViewCell: UITableViewCell {

    static let identifier : String = "MainNewsTableViewCell"

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var subNameLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var background: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none

        // Configure the view for the selected state
    }
    
    func setRound(){
        newsImage.clipsToBounds = true
        newsImage.layer.cornerRadius = 20
    }
    func setNetworkData(n : Int){
        setRound()
        GetHomeDataService.shared.getHomeInfo { (response) in
                    switch(response)
                    {
                    
                    case .success(let newsData):
                        
                        if let data = newsData as? [HomeDataModel] {
                            
                            //url에 정확한 이미지 url 주소를 넣는다.
                            let url = URL(string: data[n].image)
                            DispatchQueue.global().async { let data = try? Data(contentsOf: url!)
                                DispatchQueue.main.async { self.newsImage.image = UIImage(data: data!) } }
                            self.nameLable.text = data[n].event
                            self.subNameLable.text = data[n].title
                            self.locationLabel.text = data[n].place
                            self.newsImage.image = UIImage(contentsOfFile: data[n].image)
                        }
                    case .requestErr(let message) :
                        print("requestERR",message)
                    case .pathErr :
                        print("pathERR")
                    case .serverErr:
                        print("serverERR")
                    case .networkFail:
                        print("networkFail")
                    }
                }
        
    }
    
//    func setData(icon : String, name : String, subname:String, location : String){
//        if let newsIcon = UIImage(named: icon){
//            newsImage.image = newsIcon
//        }
//        nameLable.text = name
//        subNameLable.text = subname
//        locationLabel.text = location
//
//            }
}
