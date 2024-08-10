//
//  LottoNumberGeneratorCore.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import ComposableArchitecture

@Reducer
struct LottoNumberGeneratorCore {
    struct State: Equatable {
        var numbers: [Int] = []
        var generationCount: Int = 0
        var isHeaderVisible: Bool = true
    }

    enum Action: Equatable {
        case generateNumbersButtonTapped
        case updateGenerationCount(Int)
        case hideHeader
    }

    @Dependency(\.lottoNumberGeneratorClient) var lottoNumberGeneratorClient

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .generateNumbersButtonTapped:
                state.numbers = lottoNumberGeneratorClient.generateNumbers()
                return .merge(
                    .send(.updateGenerationCount(state.generationCount + 1)),
                    .send(.hideHeader)
                )

            case let .updateGenerationCount(newCounter):
                state.generationCount = newCounter
                return .none

            case .hideHeader:
                state.isHeaderVisible = false
                return .none
            }
        }
    }
}
