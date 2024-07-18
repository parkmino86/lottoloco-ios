//
//  LottoNumberGeneratorView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import ComposableArchitecture
import ConfettiSwiftUI
import SwiftUI

struct LottoNumberGeneratorView: View {
    let store: StoreOf<LottoNumberGeneratorCore>

    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: { $0 }) { viewStore in
                VStack {
                    Spacer()
                    headerView()
                    confettiView(viewStore: viewStore)
                    lottoNumbersView(lottoNumbers: viewStore.lottoNumbers)
                    Spacer()
                    generateButton(viewStore: viewStore)
                }
                .safeAreaPadding()
                .navigationTitle("오늘의 행운 번호")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    @ViewBuilder
    private func headerView() -> some View {
        Text("🎲 행운의 로또 번호를 생성하세요!")
            .font(.headline)
            .padding()
    }

    @ViewBuilder
    private func confettiView(viewStore: ViewStore<LottoNumberGeneratorCore.State, LottoNumberGeneratorCore.Action>) -> some View {
        ConfettiCannon(
            counter: viewStore.binding(
                get: \.counter,
                send: LottoNumberGeneratorCore.Action.updateCounter
            ),
            num: 50,
            confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴"), .shape(.circle), .shape(.triangle)],
            colors: [.blue, .red, .green, .yellow, .pink, .purple, .orange, .cyan],
            confettiSize: 20,
            rainHeight: 800,
            fadesOut: true,
            opacity: 0.8,
            openingAngle: .degrees(30),
            closingAngle: .degrees(150),
            radius: 350
        )
    }

    @ViewBuilder
    private func lottoNumbersView(lottoNumbers: [Int]) -> some View {
        HStack {
            ForEach(lottoNumbers, id: \.self) { number in
                Text("\(number)")
                    .font(.title)
                    .padding()
                    .background(Circle().fill(Color.blue))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private func generateButton(viewStore: ViewStore<LottoNumberGeneratorCore.State, LottoNumberGeneratorCore.Action>) -> some View {
        Button(action: {
            viewStore.send(.generateNumbersButtonTapped)
            viewStore.send(.updateCounter(viewStore.counter + 1))
        }) {
            Text("번호 생성 🚀")
                .font(.system(size: 16, weight: .bold))
                .frame(maxWidth: .infinity)
                .padding()
        }
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

struct LottoNumberGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        LottoNumberGeneratorView(
            store: Store(
                initialState: LottoNumberGeneratorCore.State(),
                reducer: { LottoNumberGeneratorCore() },
                withDependencies: {
                    $0.lottoNumberGeneratorClient = .dummyValue
                }
            )
        )
    }
}
