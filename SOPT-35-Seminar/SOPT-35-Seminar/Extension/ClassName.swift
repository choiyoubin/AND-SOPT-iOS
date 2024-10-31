//
//  ClassName.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import Foundation

extension NSObject {
    public static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    public var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
