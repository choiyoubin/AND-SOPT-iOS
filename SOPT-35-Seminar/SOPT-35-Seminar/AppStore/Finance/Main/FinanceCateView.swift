//
//  FInanceCateView.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit
import Then
import SnapKit

class FinanceCateView: UIView {

    let layout = CompositionalLayout.createLayout()
    lazy var appCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        appCollectionView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
        }
    }
    
    func setUI() {
        addSubview(self.appCollectionView)
    }

    func setLayout() {
        appCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
