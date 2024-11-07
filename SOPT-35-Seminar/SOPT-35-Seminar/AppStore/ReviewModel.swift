//
//  ReviewModel.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit

struct ReviewModel {
    let title: String
    let user: String
    let date: String
    let info: String
}

extension ReviewModel {
    static func getReview() -> [ReviewModel] {
        return [
            ReviewModel(title: "안녕하세요 안녕히가세요", user: "유비니", date: "11월 17일", info: "시기다른 래퍼들의 반대편을 바라보던 래퍼들의 배포 그건 백프로 다 개뻥 텐션업을 해야지 제대로"),
            ReviewModel(title: "안녕하세요 안녕히가세요", user: "유비니", date: "11월 17일", info: "시기다른 래퍼들의 반대편을 바라보던 래퍼들의 배포 그건 백프로 다 개뻥 텐션업을 해야지 제대로"),
            ReviewModel(title: "안녕하세요 안녕히가세요", user: "유비니", date: "11월 17일", info: "시기다른 래퍼들의 반대편을 바라보던 래퍼들의 배포 그건 백프로 다 개뻥 텐션업을 해야지 제대로"),
            ReviewModel(title: "안녕하세요 안녕히가세요", user: "유비니", date: "11월 17일", info: "시기다른 래퍼들의 반대편을 바라보던 래퍼들의 배포 그건 백프로 다 개뻥 텐션업을 해야지 제대로"),
            ReviewModel(title: "안녕하세요 안녕히가세요", user: "유비니", date: "11월 17일", info: "시기다른 래퍼들의 반대편을 바라보던 래퍼들의 배포 그건 백프로 다 개뻥 텐션업을 해야지 제대로")
        ]
    }

}
