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
/// IBAction 제외한 함수들의 세팅은 여기서 하도록 함
extension RecommendViewController {
    private func configureUI() {
        setupCollectionView()
        
        /// Font
        TitleLabel.font = UIFont.NotoSans(.extraBold, size: 27)
        for button in TagButtonCollection {
            button.titleLabel?.font = UIFont.NotoSans(.extraBold, size: 13)
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - CollectionView Delegate
extension RecommendViewController: UICollectionViewDelegate {}

// MARK: - CollectionView DataSource
extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension RecommendViewController: UICollectionViewDelegateFlowLayout {}
