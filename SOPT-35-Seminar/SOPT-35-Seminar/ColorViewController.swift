//
//  AppStoreViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/12/24.
//

import UIKit
import Then
import SnapKit

class ColorViewController: UIViewController {

    // MARK: - Component 구성
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView()
    
    private let redView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private let orangeView = UIView().then {
        $0.backgroundColor = .orange
    }
    
    private let yellowView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    private let greenView = UIView().then {
        $0.backgroundColor = .green
    }
    
    // MARK: - UI
    func setStyle() {
        view.self.backgroundColor = .white
    }
    
    func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(greenView, orangeView, redView, yellowView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            // 수직 스크롤 위해서는 width 설정, 수평 스크롤은 height 설정
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        greenView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        orangeView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(400)
        }
        redView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(400)
        }
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(400)
            $0.bottom.equalTo(contentView)
            // 맨 밑에 있기 떄문에 bottom 설정
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
    }

}
