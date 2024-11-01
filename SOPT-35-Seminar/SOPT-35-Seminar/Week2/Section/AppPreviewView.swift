//
//  AppPreviewView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/28/24.
//

import UIKit
import Then
import SnapKit

class AppPreviewView: UIView {

    private let previewLabel = UILabel()
    private lazy var previewCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout()).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
    }
    
    private let previewImages: [UIImage] = [.appPreview1, .appPreview2, .appPreview3, .appPreview4, .appPreview5]
    
    override init(frame: CGRect){
        super .init(frame: frame)
        
        backgroundColor = .white
        
        setStyle()
        setUI()
        setLayout()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        previewLabel.do {
            $0.text = "미리 보기"
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
    }
    
    func setUI() {
        addSubviews(previewLabel, previewCollectionView)
    }
    
    func setLayout() {
        previewLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        previewCollectionView.snp.makeConstraints {
            $0.top.equalTo(previewLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(300 * 16/9)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    private func setCollectionView() {
        previewCollectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(PreviewImageCell.self, forCellWithReuseIdentifier: PreviewImageCell.className)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(300), heightDimension: .absolute(300 * 16/9))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 10
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension AppPreviewView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previewImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewImageCell.className, for: indexPath) as? PreviewImageCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: previewImages[indexPath.item])
        return cell
    }
}


