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
                mainImage: .mainImage5,
                sort: "새로운 경험",
                title: "메인 배너 1",
                subTitle: "1 매인배너입니다.",
                logoImage: .icon1,
                miniTitle: "매인 배너 1",
                info: "매인 배너 1입니다.",
                inApp: "앱 내 구입"
            ),
            MainModel(
                mainImage: .mainImage5,
                sort: "추천",
                title: "메인 배너 2",
                subTitle: "2 매인배너입니다.",
                logoImage: .icon2,
                miniTitle: "매인 배너 2",
                info: "매인 배너 2입니다.",
                inApp: "앱 내 구입"
            ),
            MainModel(
                mainImage: .mainImage5,
                sort: "새로운 앱",
                title: "메인 배너 3",
                subTitle: "3 매인배너입니다.",
                logoImage: .icon3,
                miniTitle: "매인 배너 3",
                info: "매인 배너 3입니다.",
                inApp: "앱 내 구입"
            ),
            MainModel(
                mainImage: .mainImage5,
                sort: "추천",
                title: "메인 배너 4",
                subTitle: "4 매인배너입니다.",
                logoImage: .icon4,
                miniTitle: "매인 배너 4",
                info: "매인 배너 4입니다.",
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
