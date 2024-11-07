//
//  AppReviewView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/28/24.
//

import UIKit
import Then
import SnapKit

class AppReviewView: UIView {

    let reviewButton = UIButton()
    private let reviewRateLabel = UILabel()
    private let reviewNumberLabel = UILabel()
    private let starRatingView = StarRatingView(starColor: .black)
    
    override init(frame: CGRect) {
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
        reviewButton.do {
            $0.sizeToFit()
            $0.setTitle("평가 및 리뷰 ", for: .normal)
            $0.setImage(UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12)), for: .normal)
            $0.semanticContentAttribute = .forceRightToLeft
            $0.contentHorizontalAlignment = .center
            $0.contentVerticalAlignment = .center
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.titleLabel?.textAlignment = .left
            $0.setTitleColor(.black, for: .normal)
            $0.setImageTintColor(UIColor.darkGray)
        }
        
        reviewRateLabel.do {
            $0.text = "4.4"
            $0.font = .systemFont(ofSize: 40, weight: .bold)
            $0.textColor = .black
        }
        
        reviewNumberLabel.do {
            $0.text = "8.4만개의 평가"
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.textColor = .darkGray
        }
    }
    
    func setUI() {
        addSubviews(reviewButton, reviewRateLabel, reviewNumberLabel, starRatingView)
    }
    
    func setLayout() {
        reviewButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        reviewRateLabel.snp.makeConstraints {
            $0.top.equalTo(reviewButton.snp.bottom)
            $0.leading.equalTo(reviewButton)
            $0.bottom.equalToSuperview()
        }
        reviewNumberLabel.snp.makeConstraints {
            $0.bottom.equalTo(reviewRateLabel.snp.bottom)
            $0.trailing.equalToSuperview().offset(-20)
        }
        starRatingView.snp.makeConstraints {
            $0.bottom.equalTo(reviewNumberLabel.snp.top)
            $0.trailing.equalTo(reviewNumberLabel)
        }
    }
}
