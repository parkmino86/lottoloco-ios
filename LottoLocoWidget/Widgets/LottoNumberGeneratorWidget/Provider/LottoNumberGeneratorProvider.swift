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
        let entry = LottoNumberGeneratorEntry(date: Date(), numbers: LottoNumberGenerator.generateNumbers())
        return Timeline(entries: [entry], policy: .never)
    }
}
