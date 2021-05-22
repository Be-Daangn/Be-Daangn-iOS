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
        RecommendStoreDataModel(imageName: "recommend_1", name: "다운타우너", review: "89", customer: "31", tags: [0, 1]),
        RecommendStoreDataModel(imageName: "recommend_2", name: "오복수산", review: "75", customer: "24", tags: [1, 6]),
        RecommendStoreDataModel(imageName: "recommend_3", name: "파이프그라운드", review: "66", customer: "18", tags: [2, 4]),
        RecommendStoreDataModel(imageName: "recommend_1", name: "다운타우너", review: "89", customer: "31", tags: [0, 1]),
        RecommendStoreDataModel(imageName: "recommend_2", name: "오복수산", review: "75", customer: "24", tags: [1, 6]),
        RecommendStoreDataModel(imageName: "recommend_3", name: "파이프그라운드", review: "66", customer: "18", tags: [2, 4]),
        RecommendStoreDataModel(imageName: "recommend_1", name: "다운타우너", review: "89", customer: "31", tags: [0, 1]),
        RecommendStoreDataModel(imageName: "recommend_2", name: "오복수산", review: "75", customer: "24", tags: [1, 6]),
        RecommendStoreDataModel(imageName: "recommend_3", name: "파이프그라운드", review: "66", customer: "18", tags: [2, 4]),
    ]
    
    var filterTags: [RecommendStoreDataModel] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // view가 다시 나타날때 collectionView 데이터 리로드
        collectionView.reloadData()
    }
    
    // MARK: - IBActions
    /// 태그 버튼 클릭 이벤트
    /// [o] 어떤 식으로 다중 선택 구현할건지
    /// [o] 어떤 태그가 선택되었는지 어떻게 관찰할건지
    @IBAction func tagButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        setButtonColor(state: sender.isSelected, tag: sender.tag)
        
        // 1. 선택된 태그가 몇 번인지 걸러주기
        let selectedTags = TagButtonCollection
            .filter { $0.isSelected }
            .map { $0.tag }
        
        // 2. 선택된 태그와 겹치는 태그가 있는 모델만 걸러주기
        filterTags = dummyDataList
            .filter({ data in
                // 1. 포함되는 태그가 하나만 있어도 되는지
                //Array(Set(data.tags!).intersection(Set(selectedTags))) != []
                // 2. 태그를 전부 다 포함하는 경우를 걸러야 하는지
                Set(selectedTags).isSubset(of: Set(data.tags!))
            })
        
        // 3. 선택된 태그가 없을 때는 전체 목록 다 표시해야 함
        if selectedTags == [] {
            filterTags = dummyDataList
        }
        
        // 컬렉션뷰 리로드
        // - 리로드 해줘야 에러 안남
        collectionView.reloadData()
    }
    
    /// 뒤로 가기 버튼 클릭 이벤트 ▶︎ PopViewController
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /// 북마크 버튼 클릭 이벤트 ▶︎ 북마크(저장됨) 뷰로 화면전환
    @IBAction func bookmarkButtonClicked(_ sender: Any) {
        let savedStoryboard = UIStoryboard(name: "SavedStoryboard", bundle: nil)
        let savedVC = savedStoryboard.instantiateViewController(identifier: "SavedViewController") as! SavedViewController
        self.navigationController?.pushViewController(savedVC, animated: true)
    }
    
    /// 글쓰기 버튼 클릭 이벤트
    @IBAction func writeButtonClicked(_ sender: Any) {
        presentAlert(title: "준비중 🙋🏻‍♂️", message: "아직 준비가 안 됐어요~~",okAction: nil)
    }
    
}

// MARK: - Custom Function Part
// IBAction 제외한 함수들의 세팅은 여기서 하도록 함
extension RecommendViewController {
    
    @objc func bookmarkButtonClicked(sender: UIButton) {
        print(sender.tag)
    }
    
    private func setButtonColor(state: Bool, tag: Int) {
        // 눌렸을때
        if state {
            TagButtonCollection[tag].backgroundColor = .white
            TagButtonCollection[tag].setTitleColor(.mainOrange, for: .selected)
        }
        // 안 눌렸을때
        else {
            TagButtonCollection[tag].backgroundColor = .clear
            TagButtonCollection[tag].setTitleColor(.white, for: .normal)
        }
    }
    
    // UI 셋업 함수
    private func configureUI() {
        setupCollectionView()
        
        // Font
        TitleLabel.font = UIFont.NotoSans(.extraBold, size: 27)
        for button in TagButtonCollection {
            button.titleLabel?.font = UIFont.NotoSans(.extraBold, size: 13)
        }
        
    }
    
    // 컬렉션 뷰 셋업 함수
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
        
        filterTags = dummyDataList
    }
    
}

// MARK: - CollectionView Delegate
extension RecommendViewController: UICollectionViewDelegate {}

// MARK: - CollectionView DataSource
extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendStoreCVC.identifier,
                                                            for: indexPath) as? RecommendStoreCVC else { return UICollectionViewCell() }
        
        let dummyData = filterTags[indexPath.row]

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

