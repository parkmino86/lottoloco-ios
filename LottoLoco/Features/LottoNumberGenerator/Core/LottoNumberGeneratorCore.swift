//
//  LottoNumberGeneratorCore.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import ComposableArchitecture

struct LottoNumberGenerator: Reducer {
    struct State: Equatable {
        var lottoNumbers: [Int] = []
    }

    enum Action: Equatable {
        case generateNumbers
        case numbersGenerated([Int])
    }

    struct Environment {
        var numberGenerator: () -> [Int]
    }

    var environment: Environment = Environment {
        (1 ... 45).shuffled().prefix(6).sorted()
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .generateNumbers:
                let numbers = environment.numberGenerator()
                return .send(.numbersGenerated(numbers))

            case let .numbersGenerated(numbers):
                state.lottoNumbers = numbers
                return .none
            }
        }
    }
}
