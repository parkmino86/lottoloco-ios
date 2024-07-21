//
//  Date+Extensions.swift
//  LottoLoco
//
//  Created by minoh.park on 7/21/24.
//

import Foundation

extension Date {
    /// 요일을 문자열로 반환합니다.
    ///
    /// `ko_KR` 로케일을 사용하여 요일의 전체 이름을 반환합니다 (예: "월요일", "화요일").
    ///
    /// - Returns: 요일을 나타내는 문자열.
    var dayOfWeekString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
