//
//  TossEntryViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/25/24.
//

import UIKit
import Then
import SnapKit

class TossEntryViewController: UIViewController {

    private lazy var entryButton = UIButton().then {
        $0.setTitle("토스 정보 보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(tossEntryTap), for: .touchUpInside)
        $0.backgroundColor = .tintColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(entryButton)
        entryButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
    }
    
    @objc func tossEntryTap() {
        let nextViewController = AppStoreViewController()
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
