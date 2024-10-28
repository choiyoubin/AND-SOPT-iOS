//
//  AppNewsView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/28/24.
//

import UIKit
import Then
import SnapKit

class AppNewsView: UIView {
    
    let newsButton = UIButton()
    private let versionLabel = UILabel()
    private let timeLabel = UILabel()
    private let newsLabel = UILabel()
    
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
        newsButton.do {
            $0.sizeToFit()
            $0.setTitle("새로운 소식 ", for: .normal)
            $0.setImage(UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12)), for: .normal)
            $0.semanticContentAttribute = .forceRightToLeft
            $0.contentHorizontalAlignment = .center
            $0.contentVerticalAlignment = .center
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.titleLabel?.textAlignment = .left
            $0.setTitleColor(.black, for: .normal)
            $0.setImageTintColor(UIColor.darkGray)
        }
        versionLabel.do {
            $0.text = "버전 5.186.0"
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .left
            $0.textColor = .gray
        }
        timeLabel.do {
            $0.text = "23시간 전"
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .center
            $0.textColor = .gray
        }
        newsLabel.do {
            $0.text = "• 구석구석 숨어있던 버그들을 잡았어요."
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textAlignment = .center
            $0.textColor = .black
            $0.numberOfLines = 1
        }
    }
    
    func setUI() {
        addSubviews(newsButton, versionLabel, timeLabel, newsLabel)
    }
    
    func setLayout() {
        newsButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(newsButton.snp.bottom).offset(10)
            $0.leading.equalTo(newsButton)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        newsLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(newsButton)
        }
    }
}
