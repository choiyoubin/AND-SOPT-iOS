//
//  UIView+.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/7/24.
//

import Foundation
import UIKit

// MARK: addSubViews
extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            // 기존 VC제외 다른 VC에 오토레이아웃 적용 위해 UIView+변경 
            // translatesAutoresizingMaskIntoConstaraints = false로 설정 시, CGRect로 설정한 좌표값 인지하지 못하여 정렬 어긋난다.
        }
    }
    
}
