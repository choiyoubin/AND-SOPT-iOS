//
//  AppHelpfulReviewView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/29/24.
//

import UIKit
import Then
import SnapKit

class AppHelpfulReviewView: UIView {

    private let helpfulReviewLabel = UILabel()
    
    private lazy var reviewCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.className)
        collectionView.decelerationRate = .fast
        return collectionView
    }()
    
    private let reviewData: [ReviewModel] = ReviewModel.getReview()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        helpfulReviewLabel.do {
            $0.text = "가장 도움이 되는 리뷰"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
    }
    
    private func setUI() {
        addSubviews(helpfulReviewLabel, reviewCollectionView)
    }
    
    private func setLayout() {
        helpfulReviewLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        reviewCollectionView.snp.makeConstraints {
            $0.top.equalTo(helpfulReviewLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(200)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 10

        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

extension AppHelpfulReviewView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.className , for: indexPath) as? ReviewCell else {
            return UICollectionViewCell()
        }
        let review = reviewData[indexPath.item]
        cell.configure(with: review)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidth = (scrollView.frame.width * 0.8) + 20 // 셀 너비 + 간격
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidth
        let roundedIndex = round(index)

        offset = CGPoint(x: roundedIndex * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
