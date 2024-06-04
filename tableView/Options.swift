//
//  Options.swift
//  tableView
//
//  Created by ilim on 2024-06-04.
//

import Foundation

enum Options: CaseIterable {
case entire, personal, etc
    
    var sectionTitle: String {
        switch self {
        case .entire:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .etc:
            return "기타"
        }
    }
    
    var cellTitle: [String] {
        switch self {
        case .entire:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .etc:
            return ["고객센터/도움말"]
        }
    }
}

