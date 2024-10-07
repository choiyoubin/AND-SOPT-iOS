//
//  UIView+.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/7/24.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = true
            // translatesAutoresizingMaskIntoConstaraints = false로 설정 시, CGRect로 설정한 좌표값 인지하지 못하여 정렬 어긋난다.
        }
    }
    
}
