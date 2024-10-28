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
    
    private let reviewDetailView = UIView()
    private let reviewTitleLabel = UILabel()
    private let detailStarRatingView = StarRatingView(starColor: .black)
    private let reviewDateLabel = UILabel()
    private let reviewUserLabel = UILabel()
    private let reviewInfoLabel = UILabel()
    
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
    
    func setStyle() {
        helpfulReviewLabel.do {
            $0.text = "가장 도움이 되는 리뷰"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
        reviewDetailView.do {
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1.0
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
    
    func setUI() {
        reviewDetailView.addSubviews(reviewTitleLabel, detailStarRatingView, reviewDateLabel, reviewUserLabel, reviewInfoLabel)
        addSubviews(helpfulReviewLabel, reviewDetailView)
    }
    
    func setLayout() {
        helpfulReviewLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        reviewDetailView.snp.makeConstraints {
            $0.top.equalTo(helpfulReviewLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-20)
        }
        reviewTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        detailStarRatingView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(reviewTitleLabel)
            $0.height.equalTo(12)
            $0.width.equalTo(60)
        }
        reviewDateLabel.snp.makeConstraints {
            $0.top.equalTo(detailStarRatingView)
            $0.leading.equalTo(detailStarRatingView.snp.trailing).offset(10)
            $0.centerY.equalTo(detailStarRatingView)
        }
        reviewUserLabel.snp.makeConstraints {
            $0.top.equalTo(detailStarRatingView)
            $0.leading.equalTo(reviewDateLabel.snp.trailing)
            $0.centerY.equalTo(detailStarRatingView)
        }
        reviewInfoLabel.snp.makeConstraints {
            $0.top.equalTo(detailStarRatingView.snp.bottom).offset(10)
            $0.leading.equalTo(detailStarRatingView)
            $0.trailing.equalTo(reviewDetailView.snp.trailing).offset(-20)
            $0.bottom.equalTo(reviewDetailView).offset(-20)
        }
        
    }
    
}
