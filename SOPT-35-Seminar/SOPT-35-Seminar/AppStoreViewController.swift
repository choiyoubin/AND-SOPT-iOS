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
    
    // MARK: APP Details
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
    
    // MARK: APP Description
    private let ratingView = UIView()
    
    let rateTitleLabel = UILabel().then {
        $0.text = "8.4만개의 평가"
        $0.font = .systemFont(ofSize: 10)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    let rateLabel = UILabel().then {
        $0.text = "4.4"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    let rateStarView = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .gray
    }
    
    private let awardView = UIView()
    
    let awardTitleLabel = UILabel().then {
        $0.text = "수상"
        $0.font = .systemFont(ofSize: 10)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    let awardImageview = UIImageView().then {
        $0.image = UIImage(systemName: "person.fill")
        $0.tintColor = .gray
    }
    
    let awardCateLabel = UILabel().then {
        $0.text = "앱"
        $0.font = .systemFont(ofSize: 10)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    private let ageView = UIView()
    
    let ageTitleLabel = UILabel().then {
        $0.text = "연령"
        $0.font = .systemFont(ofSize: 10)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    let ageLabel = UILabel().then {
        $0.text = "4+"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    let ageStandardLabel = UILabel().then {
        $0.text = "세"
        $0.font = .systemFont(ofSize: 10)
        $0.textAlignment = .center
        $0.textColor = .gray
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
        ratingView.addSubviews(rateLabel, rateTitleLabel, rateStarView)
        awardView.addSubviews(awardTitleLabel, awardImageview, awardCateLabel)
        ageView.addSubviews(ageTitleLabel, ageLabel, ageStandardLabel)
        contentView.addSubviews(IconImageView, titleLabel, subtitleLabel, openButton, shareButton, ratingView, awardView, ageView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
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
        
        ratingView.snp.makeConstraints {
            $0.top.equalTo(openButton.snp.bottom).offset(40)
            $0.leading.equalTo(contentView).offset(20)
            $0.width.equalTo((view.bounds.width - 40) * 0.33)
            $0.height.equalTo(60)
        }
        rateTitleLabel.snp.makeConstraints {
            $0.top.equalTo(ratingView)
            $0.centerX.equalTo(ratingView)
        }
        rateLabel.snp.makeConstraints {
            $0.centerX.equalTo(rateTitleLabel)
            $0.centerY.equalTo(ratingView)
        }
        // TODO: 평점 별 추가 (stackView)
        rateStarView.snp.makeConstraints {
            $0.centerX.equalTo(rateTitleLabel)
            $0.bottom.equalTo(ratingView)
            $0.width.height.equalTo(12)
        }
        
        awardView.snp.makeConstraints {
            $0.top.equalTo(ratingView)
            $0.centerX.equalTo(contentView)
            $0.width.equalTo((view.bounds.width - 40) * 0.33)
            $0.height.equalTo(60)
        }
        awardTitleLabel.snp.makeConstraints {
            $0.top.equalTo(awardView)
            $0.centerX.equalTo(awardView)
        }
        awardImageview.snp.makeConstraints {
            $0.centerX.centerY.equalTo(awardView)
            $0.width.height.equalTo(20)
        }
        awardCateLabel.snp.makeConstraints {
            $0.centerX.equalTo(awardView)
            $0.bottom.equalTo(awardView)
        }
        
        ageView.snp.makeConstraints {
            $0.top.equalTo(ratingView)
            $0.trailing.equalTo(contentView).offset(-20)
            $0.width.equalTo((view.bounds.width - 40) * 0.33)
            $0.height.equalTo(60)
        }
        ageTitleLabel.snp.makeConstraints {
            $0.top.equalTo(ageView)
            $0.centerX.equalTo(ageView)
        }
        ageLabel.snp.makeConstraints {
            $0.centerX.equalTo(ageTitleLabel)
            $0.centerY.equalTo(ageView)
        }
        ageStandardLabel.snp.makeConstraints {
            $0.centerX.equalTo(ageTitleLabel)
            $0.bottom.equalTo(ageView)
        }
        
        
        
    }
}

#Preview {
    AppStoreViewController()
}
