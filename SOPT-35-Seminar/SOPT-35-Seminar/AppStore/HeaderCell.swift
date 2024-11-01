//
//  HeaderCell.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit
import SnapKit
import Then

class HeaderCell: UICollectionViewCell {
    // MARK: - Properties
    let titleButton = UIButton()
    
    var onTitleButtonTap: (() -> Void)?
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setStyle() {
        titleButton.do {
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
//        subTitleLabel.do {
//            $0.text = "APP Store 에디터가 직접 골랐습니다"
//            $0.font = .systemFont(ofSize: 12)
//            $0.textColor = .gray
//        }
    }
    private func setUI() {
        backgroundColor = .clear
        addSubview(
            titleButton
        )
    }
    
    private func setLayout() {
        titleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setAction(){
        titleButton.addTarget(self, action: #selector(titleButtonTapped), for: .touchUpInside)
    }
    
    @objc private func titleButtonTapped() {
            onTitleButtonTap?()
    }
    
    func bindTitle(title: String) {
        self.titleButton.setTitle(title, for: .normal)
    }
    
}
