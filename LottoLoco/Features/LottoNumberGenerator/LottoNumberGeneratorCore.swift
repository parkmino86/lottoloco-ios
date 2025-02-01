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
        var isHeaderVisible: Bool = true
    }

    enum Action: Equatable {
        case generateNumbersButtonTapped
        case hideHeader
    }

    @Dependency(\.lottoNumberGeneratorClient) var lottoNumberGeneratorClient

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .generateNumbersButtonTapped:
                state.numbers = lottoNumberGeneratorClient.generateNumbers()
                return .send(.hideHeader)

            case .hideHeader:
                state.isHeaderVisible = false
                return .none
            }
        }
    }
}
