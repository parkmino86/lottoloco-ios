//
//  LottoNumberGeneratorProvider.swift
//  LottoLocoWidgetExtension
//
//  Created by minoh.park on 7/21/24.
//

import SwiftUI
import WidgetKit

struct LottoNumberGeneratorProvider: AppIntentTimelineProvider {
    func placeholder(in _: Context) -> LottoNumberGeneratorEntry {
        LottoNumberGeneratorEntry(date: Date(), numbers: LottoNumberGenerator.generateNumbers())
    }

    func snapshot(for _: LottoNumberGeneratorIntent, in _: Context) async -> LottoNumberGeneratorEntry {
        LottoNumberGeneratorEntry(date: Date(), numbers: LottoNumberGenerator.generateNumbers())
    }

    func timeline(for _: LottoNumberGeneratorIntent, in _: Context) async -> Timeline<LottoNumberGeneratorEntry> {
        var entries: [LottoNumberGeneratorEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = LottoNumberGeneratorEntry(date: entryDate, numbers: LottoNumberGenerator.generateNumbers())
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}
