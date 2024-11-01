//
//  ReviewCell.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit
import Then
import SnapKit

class ReviewCell: UICollectionViewCell {
    private let reviewTitleLabel = UILabel()
    private let detailStarRatingView = StarRatingView(starColor: .black)
    private let reviewDateLabel = UILabel()
    private let reviewUserLabel = UILabel()
    private let reviewInfoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        contentView.do {
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowOffset = CGSize(width: 2, height: 2)
            $0.layer.shadowRadius = 4
            $0.layer.masksToBounds = false
            $0.backgroundColor = .white
        }
        reviewTitleLabel.do {
            $0.text = "안녕하세요 안녕히가세요"
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.textColor = .black
        }
        reviewDateLabel.do {
            $0.text = "11월 17일 "
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .lightGray
        }
        reviewUserLabel.do {
            $0.text = "• 유비니"
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .lightGray
        }
        reviewInfoLabel.do {
            $0.text = "시기다른 래퍼들의 반대편을 바라보던 래퍼들의 배포 그건 백프로 다 개뻥 텐션업을 해야지 제대로"
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .lightGray
            $0.numberOfLines = 0
        }
    }
        
    private func setUI() {
        contentView.addSubviews(reviewTitleLabel, detailStarRatingView, reviewDateLabel, reviewUserLabel, reviewInfoLabel)
    }
        
    private func setLayout() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        reviewTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        detailStarRatingView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(reviewTitleLabel)
            $0.height.equalTo(12)
            $0.width.equalTo(60)
        }
            
        reviewDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(detailStarRatingView)
            $0.leading.equalTo(detailStarRatingView.snp.trailing).offset(10)
        }
            
        reviewUserLabel.snp.makeConstraints {
            $0.centerY.equalTo(detailStarRatingView)
            $0.leading.equalTo(reviewDateLabel.snp.trailing).offset(5)
        }
            
        reviewInfoLabel.snp.makeConstraints {
            $0.top.equalTo(detailStarRatingView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
    }
    
    func configure(with review: ReviewModel) {
        reviewTitleLabel.text = review.title
        reviewDateLabel.text = "\(review.date) "
        reviewUserLabel.text = "• \(review.user)"
        reviewInfoLabel.text = review.info
    }
}

