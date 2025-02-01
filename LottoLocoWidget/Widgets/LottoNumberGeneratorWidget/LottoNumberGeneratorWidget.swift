//
//  LottoNumberGeneratorWidget.swift
//  LottoLocoWidget
//
//  Created by minoh.park on 7/21/24.
//

import SwiftUI
import WidgetKit

struct LottoNumberGeneratorWidget: Widget {
    let kind: String = "LottoNumberGeneratorWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: LottoNumberGeneratorIntent.self,
                               provider: LottoNumberGeneratorProvider())
        { entry in
            LottoNumberGeneratorEntryView(entry: entry)
        }
        .configurationDisplayName("행운의 로또 번호")
        .description("행운의 번호로 오늘을 시작하세요!")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    LottoNumberGeneratorWidget()
} timeline: {
    LottoNumberGeneratorEntry(date: .now, numbers: LottoNumberGenerator.generateNumbers())
    LottoNumberGeneratorEntry(date: .now, numbers: LottoNumberGenerator.generateNumbers())
}
