//
//  StarRatingView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/25/24.
//

import UIKit
import Then
import SnapKit

class StarRatingView: UIView {
    
    private var starColor: UIColor
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 0
    }
    
    init(starColor: UIColor) {
        self.starColor = starColor
        super.init(frame: .zero)
        setupStars()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init not implemented")
    }
    
    private func setupStars() {
        let filledStarImage = UIImage(systemName: "star.fill")
        let halfStarImage = UIImage(systemName: "star.leadinghalf.filled")
        
        for _ in 0..<4 {
            let imageView = UIImageView(image: filledStarImage)
            imageView.tintColor = starColor
            stackView.addArrangedSubview(imageView)
        }
        
        let halfStarImageView = UIImageView(image: halfStarImage)
        halfStarImageView.tintColor = starColor
        stackView.addArrangedSubview(halfStarImageView)
    }
    
    private func setupLayout() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
