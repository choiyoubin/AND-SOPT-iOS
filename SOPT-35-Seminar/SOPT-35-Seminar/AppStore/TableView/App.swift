//
//  App.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/26/24.
//

import UIKit

struct App {
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subtitle: String
    let category: String // TODO: AppCategory 추후 수정
    let downloadState: DownloadState
}

extension App {
    static let sampleApps: [App] = [
        App(
            iconImage: .icon5,
            ranking: 1,
            title: "YouTube",
            subtitle: "동영상과 음악을 스트리밍하세요",
            category: "엔터테인먼트",
            downloadState: .installed
        ),
        App(
            iconImage: .icon6,
            ranking: 2,
            title: "Netflix",
            subtitle: "영화와 TV 프로그램 시청",
            category: "엔터테인먼트",
            downloadState: .update
        ),
        App(
            iconImage: .icon7,
            ranking: 3,
            title: "카카오톡",
            subtitle: "무료 메시징과 통화",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: .icon8,
            ranking: 4,
            title: "Instagram",
            subtitle: "사진과 동영상 공유",
            category: "소셜 네트워킹",
            downloadState: .download
        ),
        App(
            iconImage: .icon9,
            ranking: 5,
            title: "Twitter",
            subtitle: "실시간 뉴스와 대화",
            category: "소셜 네트워킹",
            downloadState: .redownload
        ),
        App(
            iconImage: .icon10,
            ranking: 6,
            title: "Spotify",
            subtitle: "음악 스트리밍 서비스",
            category: "음악",
            downloadState: .download
        ),
        App(
            iconImage: .icon11,
            ranking: 7,
            title: "쿠팡",
            subtitle: "로켓배송",
            category: "쇼핑",
            downloadState: .update
        ),
        App(
            iconImage: .icon12,
            ranking: 8,
            title: "네이버",
            subtitle: "검색과 뉴스",
            category: "유틸리티",
            downloadState: .installed
        ),
        App(
            iconImage: .tossIcon,
            ranking: 9,
            title: "토스",
            subtitle: "간편 송금과 결제",
            category: "금융",
            downloadState: .redownload
        ),
        App(
            iconImage: .icon13,
            ranking: 10,
            title: "배달의민족",
            subtitle: "음식 배달 서비스",
            category: "푸드",
            downloadState: .installed
        ),
        App(
            iconImage: .icon14,
            ranking: 11,
            title: "Discord",
            subtitle: "게이머를 위한 채팅",
            category: "소셜 네트워킹",
            downloadState: .download
        ),
        App(
            iconImage: .icon15,
            ranking: 12,
            title: "Google",
            subtitle: "검색과 클라우드 서비스",
            category: "유틸리티",
            downloadState: .update
        ),
        App(
            iconImage: .icon16,
            ranking: 13,
            title: "Facebook",
            subtitle: "친구와 소통하기",
            category: "소셜 네트워킹",
            downloadState: .redownload
        ),
        App(
            iconImage: .icon17,
            ranking: 14,
            title: "LINE",
            subtitle: "무료 메시지와 통화",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: .icon18,
            ranking: 15,
            title: "Outlook",
            subtitle: "이메일과 캘린더",
            category: "생산성",
            downloadState: .download
        )
    ]
}
