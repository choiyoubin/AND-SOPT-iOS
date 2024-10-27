//
//  AppDetailView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/27/24.
//

import UIKit
import Then
import UIKit

class AppDetailHeaderView: UIView {

    let IconImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let openButton = UIButton()
    let shareButton = UIButton()
    
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
        IconImageView.do {
            $0.image = UIImage(named: "tossIcon")
            $0.layer.borderWidth = 0.3
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.layer.cornerRadius = 20
        }
        titleLabel.do {
            $0.text = "토스"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textAlignment = .center
            $0.textColor = .black
        }
        subtitleLabel.do {
            $0.text = "금융이 쉬워진다"
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textAlignment = .center
            $0.textColor = .lightGray
        }
        openButton.do {
            $0.setTitle("열기", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.backgroundColor = .tintColor
            $0.layer.cornerRadius = 10
        }
        shareButton.do {
            $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
            $0.tintColor = .tintColor
        }
    }
    
    func setUI() {
        addSubviews(IconImageView, titleLabel, subtitleLabel, openButton, shareButton)
    }
    
    func setLayout() {
        IconImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(80)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(IconImageView)
            $0.leading.equalTo(IconImageView.snp.trailing).offset(20)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel)
        }
        openButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(IconImageView.snp.bottom)
            $0.height.equalTo(20)
            $0.width.equalTo(50)
        }
        shareButton.snp.makeConstraints {
            $0.bottom.equalTo(IconImageView.snp.bottom)
            $0.width.height.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }

}
