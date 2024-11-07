//
//  AppDescriptionView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/27/24.
//

import UIKit

class AppDescriptionView: UIView {

    private let ratingView = UIStackView()
    private let rateTitleLabel = UILabel()
    private let rateLabel = UILabel()
    private let rateStarRatingView = StarRatingView(starColor: .gray)
    
    private let awardView = UIStackView()
    private let awardTitleLabel = UILabel()
    private let awardImageView = UIImageView()
    private let awardCateLabel = UILabel()
    
    private let ageView = UIStackView()
    private let ageTitleLabel = UILabel()
    private let ageLabel = UILabel()
    private let ageStandardLabel = UILabel()
    
    private let FirstVerticalDivider = UIView()
    private let SecondVerticalDivider = UIView()
    
    private let FirstHorizontalDivider = UIView()
    private let SecondHorizontalDivider = UIView()
    
    private let descriptionView = UIStackView()
    
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
        rateTitleLabel.do {
            $0.text = "8.4만개의 평가"
            $0.font = .systemFont(ofSize: 10)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        rateLabel.do {
            $0.text = "4.4"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        ratingView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 5
            $0.distribution = .fillProportionally
        }
        
        awardTitleLabel.do {
            $0.text = "수상"
            $0.font = .systemFont(ofSize: 10)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        awardImageView.do {
            $0.image = UIImage(systemName: "person.fill")
            $0.tintColor = .gray
        }
        awardCateLabel.do {
            $0.text = "앱"
            $0.font = .systemFont(ofSize: 10)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        awardView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 5
            $0.distribution = .fillProportionally
        }
        
        ageTitleLabel.do {
            $0.text = "연령"
            $0.font = .systemFont(ofSize: 10)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        ageLabel.do {
            $0.text = "4+"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        ageStandardLabel.do {
            $0.text = "세"
            $0.font = .systemFont(ofSize: 10)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        ageView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 5
            $0.distribution = .fillProportionally
        }
        
        FirstVerticalDivider.do {
            $0.backgroundColor = .systemGray3
        }
        SecondVerticalDivider.do {
            $0.backgroundColor = .systemGray3
        }
        FirstHorizontalDivider.do {
            $0.backgroundColor = .systemGray3
        }
        SecondHorizontalDivider.do {
            $0.backgroundColor = .systemGray3
        }
        
        descriptionView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 10
            $0.distribution = .fill
        }
    }
    
    func setUI() {
        ratingView.addArrangedSubviews(rateTitleLabel, rateLabel, rateStarRatingView)
        awardView.addArrangedSubviews(awardTitleLabel, awardImageView, awardCateLabel)
        ageView.addArrangedSubviews(ageTitleLabel, ageLabel, ageStandardLabel)
        descriptionView.addArrangedSubviews(ratingView, FirstVerticalDivider, awardView, SecondVerticalDivider, ageView)
        addSubviews(descriptionView, FirstHorizontalDivider, SecondHorizontalDivider)
    }
    
    func setLayout() {
        rateStarRatingView.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(60)
        }
        
        ratingView.snp.makeConstraints {
            $0.width.equalTo(awardView)
        }
        
        awardView.snp.makeConstraints {
            $0.width.equalTo(ageView)
        }
        
        FirstVerticalDivider.snp.makeConstraints {
            $0.width.equalTo(0.3)
            $0.height.equalTo(40)
        }
        
        SecondVerticalDivider.snp.makeConstraints {
            $0.width.equalTo(0.3)
            $0.height.equalTo(40)
        }
        
        FirstHorizontalDivider.snp.makeConstraints {
            $0.bottom.equalTo(descriptionView.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.3)
        }
        
        SecondHorizontalDivider.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.3)
        }
        
        descriptionView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
