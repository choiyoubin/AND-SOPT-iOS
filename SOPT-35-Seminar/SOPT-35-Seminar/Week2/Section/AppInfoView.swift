//
//  AppInfoView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/28/24.
//

import UIKit
import Then
import SnapKit

class AppInfoView: UIView {
    
    private let infoTitleLabel = UILabel()
    private let developerNameLabel = UILabel()
    private let developerLabel = UILabel()
    private let developerInfoButton = UIButton()
    
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
        infoTitleLabel.do {
            $0.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다."
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .black
        }
        developerNameLabel.do {
            $0.text = "Viva Republica"
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .tintColor
        }
        developerLabel.do {
            $0.text = "개발자"
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .lightGray
        }
        developerInfoButton.do {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.tintColor = .gray
        }
    }
    
    func setUI() {
        addSubviews(infoTitleLabel, developerNameLabel, developerLabel, developerInfoButton)
    }
    
    func setLayout() {
        infoTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        developerNameLabel.snp.makeConstraints {
            $0.top.equalTo(infoTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(infoTitleLabel)
        }
        developerLabel.snp.makeConstraints {
            $0.top.equalTo(developerNameLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(infoTitleLabel)
        }
        developerInfoButton.snp.makeConstraints {
            $0.top.equalTo(developerNameLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        
    }
    
}
