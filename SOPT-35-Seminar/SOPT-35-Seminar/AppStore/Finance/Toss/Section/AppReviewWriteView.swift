//
//  AppReviewWriteView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/29/24.
//

import UIKit
import Then
import SnapKit

class AppReviewWriteView: UIView {

    private let reviewTapLabel = UILabel()
    private let writeStarRatingView = WriteStarRatingView()
    private let reviewWritebutton = UIButton()
    private let appSupportButton = UIButton()
    
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
        reviewTapLabel.do {
            $0.text = "탭하여 평가하기"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
        reviewWritebutton.do {
            $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
            $0.setTitle("리뷰 작성", for: .normal)
            $0.setTitleColor(.tintColor, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .systemGray6
            $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
            $0.contentHorizontalAlignment = .center
            $0.contentVerticalAlignment = .center
        }
        appSupportButton.do {
            $0.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
            $0.setTitle("앱 지원", for: .normal)
            $0.setTitleColor(.tintColor, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .systemGray6
            $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
            $0.contentHorizontalAlignment = .center
            $0.contentVerticalAlignment = .center
        }
    }
    
    func setUI() {
        addSubviews(reviewTapLabel, writeStarRatingView, reviewWritebutton, appSupportButton)
    }
    
    func setLayout() {
        reviewTapLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        writeStarRatingView.snp.makeConstraints {
            $0.top.equalTo(reviewTapLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        reviewWritebutton.snp.makeConstraints {
            $0.top.equalTo(writeStarRatingView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(writeStarRatingView.snp.centerX).offset(-5)
            $0.height.equalTo(50)
        }
        appSupportButton.snp.makeConstraints {
            $0.top.equalTo(reviewWritebutton)
            $0.trailing.equalToSuperview().offset(-20)
            $0.leading.equalTo(writeStarRatingView.snp.centerX).offset(5)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview()
        }
    }
}
