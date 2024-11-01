//
//  MainModel.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit

struct MainModel {
    let mainImage: UIImage
    let sort: String
    let title: String
    let subTitle: String
    let logoImage: UIImage
    let miniTitle: String
    let info: String
    let inApp: String
}

extension MainModel {
    static func getData() -> [MainModel] {
        return [
            MainModel(
                mainImage: .mainImage6,
                sort: "새로운 경험",
                title: "Swift",
                subTitle: "Swift 배너입니다.",
                logoImage: .icon1,
                miniTitle: "Swift",
                info: "Swift 배너 1입니다.",
                inApp: "앱 내 구입"
            ),
            MainModel(
                mainImage: .mainImage7,
                sort: "추천",
                title: "전화",
                subTitle: "전화 배너입니다.",
                logoImage: .icon2,
                miniTitle: "전화",
                info: "전화 배너 2입니다.",
                inApp: "앱 내 구입"
            ),
            MainModel(
                mainImage: .mainImage8,
                sort: "새로운 앱",
                title: "메세지",
                subTitle: "메세지 배너입니다.",
                logoImage: .icon3,
                miniTitle: "메세지",
                info: "메세지 배너 3입니다.",
                inApp: "앱 내 구입"
            ),
            MainModel(
                mainImage: .mainImage9,
                sort: "추천",
                title: "FaceTime",
                subTitle: "FaceTime 배너입니다.",
                logoImage: .icon4,
                miniTitle: "FaceTime",
                info: "FaceTime 배너 4입니다.",
                inApp: "앱 내 구입"
            )
        ]
    }
    
    static func getTitleLists() -> [String] {
        return [
            "필수 금융 앱 ",
            "유료 순위 ",
            "무료 순위 "
        ]
    }
}
