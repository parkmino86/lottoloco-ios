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
        var lottoNumbers: [Int] = []
        var counter: Int = 0
        var isHeaderVisible: Bool = true
    }

    enum Action: Equatable {
        case generateNumbersButtonTapped
        case updateCounter(Int)
        case hideHeader
    }

    @Dependency(\.lottoNumberGeneratorClient) var lottoNumberGeneratorClient

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .generateNumbersButtonTapped:
                state.lottoNumbers = lottoNumberGeneratorClient.generateNumbers()
                return .none

            case let .updateCounter(newCounter):
                state.counter = newCounter
                return .none

            case .hideHeader:
                state.isHeaderVisible = false
                return .none
            }
        }
    }
}
