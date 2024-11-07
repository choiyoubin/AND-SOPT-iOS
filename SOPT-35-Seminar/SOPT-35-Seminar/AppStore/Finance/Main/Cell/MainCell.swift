//
//  BannerCell.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit
import Then
import SnapKit

class BannerCell: UICollectionViewCell {
    
    private let sortLabel = UILabel()
    private let appTitleLabel = UILabel()
    private let appSubTitleLabel = UILabel()
    private let appMiniTitleLabel = UILabel()
    private let appInfoLabel = UILabel()
    private let bannerImageView = UIImageView()
    private let appLogoImageView = UIImageView()
    private let appDownloadButton = UIButton()
    private let inAppPurchaseLabel = UILabel()
    
    private let headerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //TODO: Label 속성들 묶어 수정
    func setStyle() {
        sortLabel.do {
            $0.text = "새로운 경험"
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .tintColor
            $0.textAlignment = .left
        }
        appTitleLabel.do {
            $0.text = "앱 이름"
            $0.font = .systemFont(ofSize: 18)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        appSubTitleLabel.do {
            $0.text = "앱 subtitle"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .gray
            $0.textAlignment = .left
        }
        appMiniTitleLabel.do {
            $0.text = "앱 이름"
            $0.font = .systemFont(ofSize: 14, weight: .bold)
            $0.textColor = .white
            $0.textAlignment = .left
        }
        appInfoLabel.do {
            $0.text = "앱 설명"
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .lightGray
            $0.textAlignment = .left
        }
        appDownloadButton.do {
            $0.setTitle("받기" ,for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .gray.withAlphaComponent(0.5)
            $0.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        }
        inAppPurchaseLabel.do {
            $0.text = "앱 내 구입"
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .gray
            $0.textAlignment = .center
        }
        bannerImageView.do {
            $0.image = .mainImage1
        }
        appLogoImageView.do {
            $0.image = .icon1
        }
        
    }
    
    func setUI(){
        headerView.addSubviews(sortLabel, appTitleLabel, appSubTitleLabel)
        contentView.addSubviews(headerView, bannerImageView, appLogoImageView, appMiniTitleLabel, appInfoLabel, appDownloadButton, inAppPurchaseLabel)
    }
    
    func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.bottom.equalTo(appSubTitleLabel.snp.bottom)
        }
        sortLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        appTitleLabel.snp.makeConstraints {
            $0.top.equalTo(sortLabel.snp.bottom)
            $0.leading.equalToSuperview()
        }
        appSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(appTitleLabel.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(250)
        }
        
        appLogoImageView.snp.makeConstraints {
            $0.leading.equalTo(bannerImageView).offset(10)
            $0.bottom.equalTo(bannerImageView.snp.bottom).offset(-10)
            $0.size.equalTo(40)
        }
        appMiniTitleLabel.snp.makeConstraints {
            $0.bottom.equalTo(appLogoImageView.snp.centerY).offset(-2)
            $0.leading.equalTo(appLogoImageView.snp.trailing).offset(6)
        }
        appInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(appMiniTitleLabel.snp.leading)
            $0.top.equalTo(appLogoImageView.snp.centerY)
        }
        appDownloadButton.snp.makeConstraints {
            $0.trailing.equalTo(bannerImageView).offset(-10)
            $0.top.equalTo(appMiniTitleLabel.snp.top)
        }
        inAppPurchaseLabel.snp.makeConstraints {
            $0.centerX.equalTo(appDownloadButton)
            $0.bottom.equalTo(appLogoImageView.snp.bottom)
        }
    }
    
    func bindData(bannerImage: UIImage, sort: String, title: String, subTitle: String, logoImage: UIImage, miniTitle: String, info: String, inApp: String) {
        self.bannerImageView.image = bannerImage
        self.sortLabel.text = sort
        self.appTitleLabel.text = title
        self.appSubTitleLabel.text = subTitle
        self.appLogoImageView.image = logoImage
        self.appMiniTitleLabel.text = miniTitle
        self.appInfoLabel.text = info
        self.inAppPurchaseLabel.text = inApp
    }
}
