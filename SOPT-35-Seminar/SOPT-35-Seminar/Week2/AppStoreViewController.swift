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

    private let appHelpfulReviewView = AppHelpfulReviewView()

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
        reviewWriteView.addSubviews(reviewTapLabel, writeStarRatingView, reviewWriteButton, appSupportButton)
        contentView.addSubviews(appDetailHeaderView, appDescriptionView, appNewsView, appPreviewView, appInfoView, appReviewView, appHelpfulReviewView, reviewWriteView)
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
        
        appHelpfulReviewView.snp.makeConstraints {
            $0.top.equalTo(appReviewView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }

        // MARK: - APP Review Write Layout
        reviewWriteView.snp.makeConstraints {
            $0.top.equalTo(appHelpfulReviewView.snp.bottom).offset(20)
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
