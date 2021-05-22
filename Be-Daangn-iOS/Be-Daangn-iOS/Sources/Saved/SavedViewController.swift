//
//  SavedViewController.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/20.
//

import UIKit

class SavedViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var savedTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var dummyDataList: [RecommendStoreDataModel] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        makeDummyData()
    }
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SavedViewController {
    // UI 셋업 함수
    private func configureUI() {
        setupCollectionView()
        
        // Font
        savedTitleLabel.font = UIFont.NotoSans(.extraBold, size: 27)
    }
    
    // 컬렉션 뷰 셋업 함수
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: SavedItemCVC.identifier, bundle: nil), forCellWithReuseIdentifier: SavedItemCVC.identifier)
        
        collectionView.backgroundColor = .clear
    }
    
    private func makeDummyData() {
        dummyDataList.append(contentsOf: [
            RecommendStoreDataModel(imageName: "saved1", name: "다운타우너", place: "한남동", review: "89", customer: "31", tags: [0, 1]),
            RecommendStoreDataModel(imageName: "saved2", name: "일호식", place: "한남동", review: "75", customer: "24", tags: [1, 6]),
            RecommendStoreDataModel(imageName: "saved3", name: "파이프그라운드", place: "연남동", review: "66", customer: "18", tags: [2, 4]),
            RecommendStoreDataModel(imageName: "saved4", name: "다운타우너", place: "삼전동", review: "89", customer: "31", tags: [0, 1]),
            RecommendStoreDataModel(imageName: "saved5", name: "오복수산", place: "삼성동", review: "75", customer: "24", tags: [1, 6]),
            RecommendStoreDataModel(imageName: "saved6", name: "파이프그라운드", place: "상도동", review: "66", customer: "18", tags: [2, 4]),
        ])
    }
}

// MARK: - UICollectionViewDelegate
extension SavedViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension SavedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedItemCVC.identifier, for: indexPath) as? SavedItemCVC else { return UICollectionViewCell() }
        
        let savedItem = dummyDataList[indexPath.row]
        cell.setData(image: savedItem.imageName, name: savedItem.name, place: savedItem.place)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SavedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        
        let cellWidth = screenWidth * (139 / 375)
        let cellHeight = cellWidth * (161 / 139)
        
        print(screenWidth, cellWidth, cellHeight)

        return CGSize(width: cellWidth, height: cellHeight)
    }

    // 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 29
    }
    
    // 아이템 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth * (20/375)
    }

    // 컬렉션뷰 여백 (padding)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}
