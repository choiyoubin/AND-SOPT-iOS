//
//  PaidChartCell.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit
import Then
import SnapKit

class PaidChartCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let downloadButton = UIButton()
    private let subTitleLabel = UILabel()
    private let inAppPurchaseLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        iconImageView.do {
            $0.image = .icon5
            $0.layer.borderWidth = 0.3
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.layer.cornerRadius = 20
        }
        rankingLabel.do {
            $0.text = "1"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
        titleLabel.do {
            $0.text = "앱 제목"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .black
        }
        subTitleLabel.do {
            $0.text = "앱 소제목"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
        downloadButton.do {
            $0.setTitle("₩9,900" ,for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.setTitleColor(.tintColor, for: .normal)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .systemGray5
            $0.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        }
        inAppPurchaseLabel.do {
            $0.text = "앱 내 구입"
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .lightGray
        }
        
    }

    private func setUI() {
        contentView.addSubviews(iconImageView, rankingLabel, titleLabel, subTitleLabel, downloadButton, inAppPurchaseLabel)
    }

    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalToSuperview().offset(15)
            $0.size.equalTo(60)
        }

        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(6)
            $0.bottom.equalTo(iconImageView.snp.centerY).offset(-2)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
            $0.bottom.equalTo(rankingLabel.snp.bottom)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(iconImageView.snp.centerY)
        }

        downloadButton.snp.makeConstraints {
            $0.centerY.equalTo(iconImageView)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        inAppPurchaseLabel.snp.makeConstraints {
            $0.centerX.equalTo(downloadButton)
            $0.top.equalTo(downloadButton.snp.bottom).offset(2)
        }
    }
    
    
    
    func configure(
        app: App, ranking: Int
    ) {
        iconImageView.image = app.iconImage
        rankingLabel.text = app.ranking.description
        titleLabel.text = app.title
        subTitleLabel.text = app.subtitle
    }

}
