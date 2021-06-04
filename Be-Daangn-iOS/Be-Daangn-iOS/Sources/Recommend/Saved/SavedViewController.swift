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
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
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
    

}

// MARK: - UICollectionViewDelegate
extension SavedViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension SavedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedItemCVC.identifier, for: indexPath) as? SavedItemCVC else { return UICollectionViewCell() }
        
        
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
