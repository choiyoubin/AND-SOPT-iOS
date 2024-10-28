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
    
    private let appDetailHeaderView = AppDetailHeaderView()
    
    private let appDescriptionView = AppDescriptionView()
    
    private let appNewsView = AppNewsView()
    
    private let appPreviewView = AppPreviewView()
    
    private let appInfoView = AppInfoView()

    private let appReviewView = AppReviewView()

    let helpfulReviewLabel = UILabel().then {
        $0.text = "가장 도움이 되는 리뷰"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    //MARK: - App Review Detail
    private let reviewDetailView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        $0.layer.shadowRadius = 4
        $0.layer.masksToBounds = false
        $0.backgroundColor = .white
    }
    
    let reviewTitleLabel = UILabel().then {
        $0.text = "안녕하세요 안녕히가세요"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    let detailStarRatingView = StarRatingView(starColor: .black)
    let dateLabel = UILabel().then {
        $0.text = "11월 17일 "
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .lightGray
    }
    let userLabel = UILabel().then {
        $0.text = "• 유비니"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .lightGray
    }
    let reviewInfoLabel = UILabel().then {
        $0.text = "시기다른 래퍼들의 반대편을 바라보던 래퍼들의 배포 그건 백프로 다 개뻥 텐션업을 해야지 제대로"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .lightGray
        $0.numberOfLines = 0
    }
    
    //MARK: - APP Review Write
    private let reviewWriteView = UIView()
    
    let reviewTapLabel = UILabel().then {
        $0.text = "탭하여 평가하기"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    let writeStarRatingView = WriteStarRatingView()
    let reviewWriteButton = UIButton().then {
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
    let appSupportButton = UIButton().then {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        
        setAddTarget()
    }
    
    // MARK: - UI
    func setStyle() {
        self.view.backgroundColor = .white
    }
    
    func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        reviewDetailView.addSubviews(helpfulReviewLabel, reviewTitleLabel, detailStarRatingView, dateLabel, userLabel, reviewInfoLabel)
        reviewWriteView.addSubviews(reviewTapLabel, writeStarRatingView, reviewWriteButton, appSupportButton)
        contentView.addSubviews(appDetailHeaderView, appDescriptionView, appNewsView, appPreviewView, appInfoView, appReviewView, reviewDetailView, reviewWriteView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.bottom.equalTo(reviewWriteView.snp.bottom).offset(30)
        }
        
        appDetailHeaderView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(5)
            $0.leading.trailing.equalToSuperview()
        }
        
        appDescriptionView.snp.makeConstraints {
            $0.top.equalTo(appDetailHeaderView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(contentView).inset(20)
        }
        
        appNewsView.snp.makeConstraints {
            $0.top.equalTo(appDescriptionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        appPreviewView.snp.makeConstraints {
            $0.top.equalTo(appNewsView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        appInfoView.snp.makeConstraints {
            $0.top.equalTo(appPreviewView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        appReviewView.snp.makeConstraints {
            $0.top.equalTo(appInfoView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        helpfulReviewLabel.snp.makeConstraints {
            $0.top.equalTo(appReviewView.snp.bottom).offset(10)
            $0.leading.equalTo(appReviewView).offset(20)
        }
        // MARK: - APP Review Detail Layout
        reviewDetailView.snp.makeConstraints {
            $0.top.equalTo(appReviewView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.bottom.equalTo(reviewInfoLabel).offset(20)
        }
        reviewTitleLabel.snp.makeConstraints {
            $0.top.leading.equalTo(reviewDetailView).offset(20)
        }
        detailStarRatingView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(reviewTitleLabel)
            $0.height.equalTo(12)
            $0.width.equalTo(60)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(detailStarRatingView)
            $0.leading.equalTo(detailStarRatingView.snp.trailing).offset(10)
            $0.centerY.equalTo(detailStarRatingView)
        }
        userLabel.snp.makeConstraints {
            $0.top.equalTo(detailStarRatingView)
            $0.leading.equalTo(dateLabel.snp.trailing)
            $0.centerY.equalTo(detailStarRatingView)
        }
        reviewInfoLabel.snp.makeConstraints {
            $0.top.equalTo(detailStarRatingView.snp.bottom).offset(10)
            $0.leading.equalTo(detailStarRatingView)
            $0.trailing.equalTo(reviewDetailView.snp.trailing).offset(-20)
        }
        // MARK: - APP Review Write Layout
        reviewWriteView.snp.makeConstraints {
            $0.top.equalTo(reviewDetailView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(reviewWriteButton.snp.bottom).offset(20)
        }
        reviewTapLabel.snp.makeConstraints {
            $0.top.equalTo(reviewWriteView)
            $0.centerX.equalTo(contentView)
        }
        writeStarRatingView.snp.makeConstraints {
            $0.top.equalTo(reviewTapLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(contentView)
        }
        reviewWriteButton.snp.makeConstraints {
            $0.top.equalTo(writeStarRatingView.snp.bottom).offset(10)
            $0.leading.equalTo(reviewWriteView).offset(20)
            $0.width.equalTo((view.bounds.width - 50) / 2)
            $0.height.equalTo(50)
        }
        appSupportButton.snp.makeConstraints {
            $0.top.equalTo(reviewWriteButton)
            $0.trailing.equalTo(reviewWriteView).offset(-20)
            $0.width.equalTo((view.bounds.width - 50) / 2)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: 버전기록페이지 이동
    @objc func newsButtonTapped() {
        let nextViewController = versionRecordViewController()
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    // MARK: 리뷰 모두 보기 페이지 이동
    @objc func reviewButtonTapped() {
        let nextViewController = reviewDetailViewController()
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func setAddTarget() {
        appNewsView.newsButton.addTarget(
            self,
            action: #selector(newsButtonTapped),
            for: .touchUpInside
        )
        appReviewView.reviewButton.addTarget(
            self,
            action: #selector(reviewButtonTapped),
            for: .touchUpInside
        )
    }
}

#Preview {
    AppStoreViewController()
}
