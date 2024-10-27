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
    // MARK: - APP news
    private let newsView = UIView()
    
    private lazy var newsButton = UIButton().then {
        $0.invalidateIntrinsicContentSize()
        $0.setTitle("새로운 소식", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.contentHorizontalAlignment = .center
        $0.contentVerticalAlignment = .center
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.titleLabel?.textAlignment = .left
        $0.setTitleColor(.black, for: .normal)
        $0.setImageTintColor(UIColor.gray)
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
    
    // MARK: - APP Info
    private let infoView = UIView()
    
    let infoTitle = UILabel().then {
        $0.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다."
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
    }
    let developerNameLabel = UILabel().then {
        $0.text = "Viva Republica"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .tintColor
    }
    let developerLabel = UILabel().then {
        $0.text = "개발자"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .lightGray
    }
    let developerInfoButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .gray
    }
    
    //MARK: - App Review
    private let reviewView = UIView()
    
    private lazy var reviewButton = UIButton().then {
        $0.invalidateIntrinsicContentSize()
        $0.setTitle("평가 및 리뷰", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.contentHorizontalAlignment = .center
        $0.contentVerticalAlignment = .center
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.titleLabel?.textAlignment = .left
        $0.setTitleColor(.black, for: .normal)
        $0.setImageTintColor(UIColor.gray)
        $0.addTarget(self, action: #selector(reviewButtonTapped), for: .touchUpInside)
    }
    let reviewRateLabel = UILabel().then {
        $0.text = "4.4"
        $0.font = .systemFont(ofSize: 40, weight: .bold)
        $0.textColor = .black
    }
    let reviewNumberLabel = UILabel().then {
        $0.text = "8.4만개의 평가"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .darkGray
    }
    let starRatingView = StarRatingView(starColor: .black)
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
    }
    
    // MARK: - UI
    func setStyle() {
        self.view.backgroundColor = .white
    }
    
    func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        newsView.addSubviews(newsButton, versionLabel, timeLabel, newsLabel)
        previewView.addSubviews(previewLabel, previewImageView)
        infoView.addSubviews(infoTitle, developerLabel, developerNameLabel, developerInfoButton)
        reviewView.addSubviews(reviewButton, reviewRateLabel, reviewNumberLabel, starRatingView, helpfulReviewLabel)
        reviewDetailView.addSubviews(reviewTitleLabel, detailStarRatingView, dateLabel, userLabel, reviewInfoLabel)
        reviewWriteView.addSubviews(reviewTapLabel, writeStarRatingView, reviewWriteButton, appSupportButton)
        contentView.addSubviews(appDetailHeaderView, appDescriptionView, newsView, previewView, infoView, reviewView, reviewDetailView, reviewWriteView)
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
        //MARK: - APP News Layout
        newsView.snp.makeConstraints {
            $0.top.equalTo(appDescriptionView.snp.bottom).offset(20)
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
        //MARK: - APP Preview Image Layout
        previewView.snp.makeConstraints {
            $0.top.equalTo(newsView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(previewImageView).offset(10)
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
        // MARK: - APP Info Layout
        infoView.snp.makeConstraints {
            $0.top.equalTo(previewView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(developerLabel)
        }
        infoTitle.snp.makeConstraints {
            $0.top.equalTo(infoView)
            $0.leading.trailing.equalTo(infoView).inset(20)
        }
        developerNameLabel.snp.makeConstraints {
            $0.top.equalTo(infoTitle.snp.bottom).offset(10)
            $0.leading.equalTo(infoTitle)
        }
        developerLabel.snp.makeConstraints {
            $0.top.equalTo(developerNameLabel.snp.bottom)
            $0.leading.equalTo(infoTitle)
        }
        developerInfoButton.snp.makeConstraints {
            $0.top.equalTo(developerNameLabel)
            $0.trailing.equalTo(infoView).inset(20)
        }
        //MARK: - App Review Layout
        reviewView.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(helpfulReviewLabel)
        }
        reviewButton.snp.makeConstraints {
            $0.top.equalTo(reviewView)
            $0.leading.equalTo(reviewView).offset(20)
        }
        reviewRateLabel.snp.makeConstraints {
            $0.top.equalTo(reviewButton.snp.bottom)
            $0.leading.equalTo(reviewButton)
        }
        reviewNumberLabel.snp.makeConstraints {
            $0.bottom.equalTo(reviewRateLabel.snp.bottom)
            $0.trailing.equalTo(reviewView).offset(-20)
        }
        starRatingView.snp.makeConstraints {
            $0.bottom.equalTo(reviewNumberLabel.snp.top)
            $0.trailing.equalTo(reviewNumberLabel)
        }
        helpfulReviewLabel.snp.makeConstraints {
            $0.top.equalTo(reviewRateLabel.snp.bottom).offset(10)
            $0.leading.equalTo(reviewButton)
        }
        // MARK: - APP Review Detail Layout
        reviewDetailView.snp.makeConstraints {
            $0.top.equalTo(reviewView.snp.bottom).offset(20)
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
}

#Preview {
    AppStoreViewController()
}
