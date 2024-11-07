//
//  versionRecordViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/25/24.
//

import UIKit
import Then
import SnapKit

class versionRecordViewController: UIViewController {

    let titleLabel = UILabel().then {
        $0.text = "버전 기록 페이지"
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.textColor = .tintColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    func setStyle() {
        self.view.backgroundColor = .white
    }
    
    func setUI() {
        self.view.addSubview(titleLabel)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
