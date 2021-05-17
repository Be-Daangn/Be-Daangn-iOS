//
//  RecommendViewController.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

import UIKit

class RecommendViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var TitleLabel: UILabel!
    /// Tag: 0 ~ 6으로 구분
    /// 0: 한식, 1: 일식, 2: 중식, 3: 분식, 4: 혼밥하기 좋은, 5: 만원의 행복, 6: 맛집랭킹
    @IBOutlet var TagButtonCollection: [UIButton]!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var dummyDataList: [RecommendStoreDataModel] = [
        RecommendStoreDataModel(imageName: "recommend_1", name: "다운타우너", review: "89", customer: "31"),
        RecommendStoreDataModel(imageName: "recommend_2", name: "오복수산", review: "75", customer: "24"),
        RecommendStoreDataModel(imageName: "recommend_3", name: "파이프그라운드", review: "66", customer: "18"),
        RecommendStoreDataModel(imageName: "recommend_1", name: "다운타우너", review: "89", customer: "31"),
        RecommendStoreDataModel(imageName: "recommend_2", name: "오복수산", review: "75", customer: "24"),
        RecommendStoreDataModel(imageName: "recommend_3", name: "파이프그라운드", review: "66", customer: "18"),
        RecommendStoreDataModel(imageName: "recommend_1", name: "다운타우너", review: "89", customer: "31"),
        RecommendStoreDataModel(imageName: "recommend_2", name: "오복수산", review: "75", customer: "24"),
        RecommendStoreDataModel(imageName: "recommend_3", name: "파이프그라운드", review: "66", customer: "18"),
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - IBActions
    /// 뒤로 가기 버튼 클릭 이벤트 ▶︎ PopViewController
    @IBAction func backButtonClicked(_ sender: Any) {
    }
    
    /// 북마크 버튼 클릭 이벤트 ▶︎ 북마크(저장됨) 뷰로 화면전환
    @IBAction func bookmarkButtonClicked(_ sender: Any) {
    }
    
    /// 글쓰기 버튼 클릭 이벤트
    @IBAction func writeButtonClicked(_ sender: Any) {
        // 미 구현
    }
    
}

// MARK: - Custom Function Part
// IBAction 제외한 함수들의 세팅은 여기서 하도록 함
extension RecommendViewController {
    private func configureUI() {
        setupCollectionView()
        
        // Font
        TitleLabel.font = UIFont.NotoSans(.extraBold, size: 27)
        for button in TagButtonCollection {
            button.titleLabel?.font = UIFont.NotoSans(.extraBold, size: 13)
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        /*
         [Corner Radius : left-top, right-top에만 적용]
         layerMaxXMaxYCorner – lower right corner
         layerMaxXMinYCorner – top right corner
         layerMinXMaxYCorner – lower left corner
         layerMinXMinYCorner – top left corner
         */
        collectionView.layer.cornerRadius = 40
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        collectionView.register(UINib(nibName: RecommendStoreCVC.identifier, bundle: nil), forCellWithReuseIdentifier: RecommendStoreCVC.identifier)
    }
}

// MARK: - CollectionView Delegate
extension RecommendViewController: UICollectionViewDelegate {}

// MARK: - CollectionView DataSource
extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendStoreCVC.identifier,
                                                            for: indexPath) as? RecommendStoreCVC else { return UICollectionViewCell() }
        
        let dummyData = dummyDataList[indexPath.row]
        cell.setData(image: dummyData.imageName,
                     name: dummyData.name,
                     review: dummyData.review,
                     customer: dummyData.customer)
        
        return cell
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    
    // 셀 크기 조정하기!! (스크린 사이즈를 잡아주고 들어가야, 모든 기기에서 동일한 비율을 얻을 수 있음)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.width
        let widthSize = screenSize * (293 / 375)
        let heightSize = screenSize * (297 / 375)

        return CGSize(width: widthSize, height: heightSize)
    }

    // 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 53
    }


    // 컬렉션뷰 여백 (padding)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 43, left: 41, bottom: 70, right: 41)
    }
    
}
