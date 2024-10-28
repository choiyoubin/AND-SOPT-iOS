//
//  toPreview.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/23/24.
//

import SwiftUI

// MARK: SwiftUI Preview 적용
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
