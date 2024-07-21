//
//  LottoNumberGeneratorEntryView.swift
//  LottoLocoWidgetExtension
//
//  Created by minoh.park on 7/21/24.
//

import SwiftUI
import WidgetKit

struct LottoNumberGeneratorEntryView: View {
    var entry: LottoNumberGeneratorProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("\(entry.date.dayOfWeekString)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("오늘의 행운 번호는")
                .font(.headline)
                .fontWeight(.bold)
            HStack(spacing: 4) {
                ForEach(entry.numbers, id: \.self) { number in
                    LottoNumberView(number: number, size: 20)
                }
            }
            Text("입니다.")
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
        }
        .containerBackground(.clear, for: .widget)
    }
}
