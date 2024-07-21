//
//  LottoNumberGeneratorIntent.swift
//  LottoLocoWidget
//
//  Created by minoh.park on 7/21/24.
//

import AppIntents

struct LottoNumberGeneratorIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "로또 번호 자동 생성"
    static var description = IntentDescription("손쉽게 랜덤 로또 번호를 생성하고, 바로 확인해 보세요!")

    func perform() async throws -> some IntentResult {
        return .result()
    }
}
