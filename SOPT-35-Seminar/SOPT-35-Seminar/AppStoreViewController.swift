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
        $0.backgroundColor = .white
    }
    private let contentView = UIView()
    
    // MARK: APP Details
    let IconImageView = UIImageView().then {
        $0.image = UIImage(named: "tossIcon")
        $0.layer.borderWidth = 0.3
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 20
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
    
    // MARK: - APP Description
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
    
    // MARK: - APP news
    private let newsView = UIView()
    // TODO: > 버튼 추가
    private lazy var newsButton = UIButton().then {
        $0.invalidateIntrinsicContentSize()
        $0.setTitle("새로운 소식", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.titleLabel?.textAlignment = .left
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(newsButtonTapped), for: .touchUpInside)
    }
    
    let versionLabel = UILabel().then {
        $0.text = "버전 5.186.0"
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .left
        $0.textColor = .gray
    }
    
    let timeLabel = UILabel().then {
        $0.text = "23시간 전"
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    let newsLabel = UILabel().then {
        $0.text = "• 구석구석 숨어있던 버그들을 잡았어요."
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    //MARK: - App Preview
    private let previewView = UIView()
    
    let previewLabel = UILabel().then {
        $0.text = "미리 보기"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let previewImageView = UIImageView().then {
        $0.image = UIImage(named: "tossPreview")
    }
    
//    private let infoView = UIView()
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
        newsView.addSubviews(newsButton, versionLabel, timeLabel, newsLabel)
        previewView.addSubviews(previewLabel, previewImageView)
        contentView.addSubviews(IconImageView, titleLabel, subtitleLabel, openButton, shareButton, ratingView, awardView, ageView, newsView, previewView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(2000)
        }
        //MARK: APP Details Layout
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
        //MARK: APP Description Layout
        ratingView.snp.makeConstraints {
            $0.top.equalTo(openButton.snp.bottom).offset(30)
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
        //MARK: APP News Layout
        newsView.snp.makeConstraints {
            $0.top.equalTo(ratingView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
            $0.height.greaterThanOrEqualTo(80)
        }
        newsButton.snp.makeConstraints {
            $0.top.equalTo(newsView)
            $0.leading.equalTo(newsView).offset(20)
            $0.height.equalTo(20)
        }
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(newsButton.snp.bottom).offset(10)
            $0.leading.equalTo(newsButton)
            $0.width.equalTo(80)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel)
            $0.trailing.equalTo(newsView).offset(-20)
        }
        newsLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(10)
            $0.leading.equalTo(newsButton)
        }
        //MARK: APP Preview Image Layout
        previewView.snp.makeConstraints {
            $0.top.equalTo(newsView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
        }
        previewLabel.snp.makeConstraints {
            $0.top.equalTo(previewView)
            $0.leading.equalTo(previewView).offset(20)
        }
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewLabel.snp.bottom).offset(10)
            $0.leading.equalTo(previewView).offset(20)
            $0.trailing.equalTo(previewView).offset(-20)
            $0.height.equalTo(previewImageView.snp.width).multipliedBy(16.0/9.0)
        }
        
        
    }
    
    // MARK: 버전기록페이지 이동
    @objc func newsButtonTapped() {
        let nextViewController = versionRecordViewController()
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

#Preview {
    AppStoreViewController()
}
