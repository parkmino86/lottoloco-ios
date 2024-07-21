//
//  LottoNumberGeneratorView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import Combine
import ComposableArchitecture
import ConfettiSwiftUI
import SwiftUI

struct LottoNumberGeneratorView: View {
    let store: StoreOf<LottoNumberGeneratorCore>

    struct ViewState: Equatable {
        let isHeaderVisible: Bool
        let numbers: [Int]
        let generationCount: Int

        init(state: LottoNumberGeneratorCore.State) {
            isHeaderVisible = state.isHeaderVisible
            numbers = state.numbers
            generationCount = state.generationCount
        }
    }

    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: ViewState.init) { viewStore in
                VStack {
                    Spacer()
                    if viewStore.isHeaderVisible {
                        headerView()
                    }
                    ZStack {
                        confettiView(viewStore: viewStore)
                        lottoNumbersView(lottoNumbers: viewStore.numbers)
                    }
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
    private func confettiView(viewStore: ViewStore<ViewState, LottoNumberGeneratorCore.Action>) -> some View {
        ConfettiCannon(
            counter: viewStore.binding(
                get: \.generationCount,
                send: LottoNumberGeneratorCore.Action.updateGenerationCount
            ),
            confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴")],
            confettiSize: 20
        )
    }

    @ViewBuilder
    private func lottoNumbersView(lottoNumbers: [Int]) -> some View {
        HStack {
            ForEach(lottoNumbers, id: \.self) { number in
                LottoNumberView(number: number)
            }
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private func generateButton(viewStore: ViewStore<ViewState, LottoNumberGeneratorCore.Action>) -> some View {
        Button(action: {
            viewStore.send(.generateNumbersButtonTapped)
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
