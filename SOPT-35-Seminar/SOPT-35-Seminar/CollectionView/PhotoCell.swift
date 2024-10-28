//
//  PhotoCell.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/26/24.
//

import UIKit
import SnapKit
import Then

class PhotoCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    
    private lazy var photoImageView = UIImageView()
    private lazy var likeButton = UIButton().then {
        $0.tintColor = .red
        $0.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    var likeButtonAction: (() -> ())?
    var isLiked = false {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [ photoImageView, likeButton ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
    }
    
    @objc func likeButtonTapped() {
        isLiked.toggle()
        likeButtonAction?()
    }
    
    private func updateUI() {
        let image = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: image), for: .normal)
    }
    func bind(
        _ photo: Photo
    ) {
        photoImageView.image = photo.image
        isLiked = photo.isLiked
    }
}
