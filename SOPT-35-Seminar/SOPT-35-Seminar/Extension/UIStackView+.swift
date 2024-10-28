//
//  UIStackView+.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/27/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {  addArrangedSubview($0) }
    }
}
