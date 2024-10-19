//
//  AppStoreViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/20/24.
//

import UIKit
import Then
import SnapKit

class AppStoreViewController: UIViewController {
    
    // MARK: - Component 구성
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
    }
    private let contentView = UIView()
    
    let IconImageView = UIImageView().then {
        $0.image = UIImage(named: "tossIcon")
    }
    
    let titleLabel = UILabel().then {
        $0.text = "토스"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    let subtitleLabel = UILabel().then {
        $0.text = "금융이 쉬워진다"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textAlignment = .center
        $0.textColor = .lightGray
    }
    
    let openButton = UIButton().then {
        $0.setTitle("열기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.backgroundColor = .tintColor
        $0.layer.cornerRadius = 10
    }
    
    let shareButton = UIButton().then {
        $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        $0.tintColor = .tintColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - UI
    func setStyle() {
        self.view.backgroundColor = .white
    }
    
    func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(IconImageView, titleLabel, subtitleLabel, openButton, shareButton)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        IconImageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(20)
            $0.leading.equalTo(contentView).offset(20)
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
            $0.trailing.equalTo(contentView).offset(-20)
        }
    }
}
