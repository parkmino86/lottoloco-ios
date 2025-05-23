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
                    .foregroundColor(Color.white.opacity(0.7))
            }
            Text("오늘의 행운 번호는")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            HStack(spacing: 4) {
                ForEach(entry.numbers, id: \.self) { number in
                    LottoNumberView(number: number, size: 20)                        
                }
            }
            Text("입니다.")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            HStack {
                Spacer()
                Button(intent: LottoNumberGeneratorIntent()) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .containerBackground(.black, for: .widget)
    }
}
