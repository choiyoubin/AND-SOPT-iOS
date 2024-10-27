//
//  WriteStarRatingView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/25/24.
//

import UIKit
import Then
import SnapKit

class WriteStarRatingView: UIView {
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 5
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    init() {
        super.init(frame: .zero)
        setupStars()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init not implemented")
    }
    
    private func setupStars() {
        let starImage = UIImage(systemName: "star")
        
        for _ in 0..<5 {
            let imageView = UIImageView(image: starImage)
            imageView.tintColor = .tintColor
            stackView.addArrangedSubview(imageView)
        }
    }
    
    private func setupLayout() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

