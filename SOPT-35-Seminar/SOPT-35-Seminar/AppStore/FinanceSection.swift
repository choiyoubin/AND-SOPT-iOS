//
//  FinanceSection.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import Foundation

enum FinanceSection: Int, CaseIterable {
    case main = 0
    case essetial
    case paid
    case free
    
    var numberOfItemsInSection: Int {
        switch self {
        case .main:
            return 4
        default:
            return 3
        }
    }
}
