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
    
    // MARK: - Properties
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

    private let appReviewWriteView = AppReviewWriteView()
    
    // MARK: viewDidLoad()
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
        contentView.addSubviews(appDetailHeaderView, appDescriptionView, appNewsView, appPreviewView, appInfoView, appReviewView, appHelpfulReviewView, appReviewWriteView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.bottom.equalTo(appReviewWriteView.snp.bottom).offset(30)
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

        appReviewWriteView.snp.makeConstraints {
            $0.top.equalTo(appHelpfulReviewView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    // MARK: - Function
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
