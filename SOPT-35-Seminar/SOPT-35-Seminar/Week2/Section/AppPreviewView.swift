//
//  AppPreviewView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/28/24.
//

import UIKit
import Then
import SnapKit

class AppPreviewView: UIView {

    private let previewLabel = UILabel()
    private let previewImageView = UIImageView()
    
    override init(frame: CGRect){
        super .init(frame: frame)
        
        backgroundColor = .white
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        previewLabel.do {
            $0.text = "미리 보기"
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
        previewImageView.do {
            $0.image = .tossPreview
        }
    }
    
    func setUI() {
        addSubviews(previewLabel, previewImageView)
    }
    
    func setLayout() {
        previewLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(previewLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(previewImageView.snp.width).multipliedBy(16.0/9.0)
        }
    }
}
