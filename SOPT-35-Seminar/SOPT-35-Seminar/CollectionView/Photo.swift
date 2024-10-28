//
//  Photo.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/26/24.
//

import UIKit

struct Photo: Hashable {
    let image: UIImage
    var isLiked: Bool
}

extension Photo {
    static let mockData: [Photo] = [
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false),
        Photo(image: UIImage(systemName: "person")!, isLiked: false)
    ]
}
