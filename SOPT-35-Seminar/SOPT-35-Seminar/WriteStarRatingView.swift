//
//  WriteStarRatingView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/25/24.
//

import UIKit

class WriteStarRatingView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

