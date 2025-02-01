//
//  LottoNumberGeneratorCore.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import ComposableArchitecture
import Combine
import Foundation

@Reducer
struct LottoNumberGeneratorCore {
    enum ViewState: Equatable {
        case appear
        case generating
        case completed
    }

    struct State: Equatable {
        var numbers: [Int] = []
        var viewState: ViewState = .appear
        var buttonTitle: String = "번호 생성 🚀"
        var isButtonDisabled: Bool = false
    }

    enum Action: Equatable {
        case generateNumbersButtonTapped
        case numbersGenerated([Int])
    }

    @Dependency(\.lottoNumberGeneratorClient) var lottoNumberGeneratorClient

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .generateNumbersButtonTapped:
                state.viewState = .generating
                state.buttonTitle = "생성 중..."
                state.isButtonDisabled = true
                
                return .publisher {
                    Just(lottoNumberGeneratorClient.generateNumbers())
                        .delay(for: .seconds(1), scheduler: DispatchQueue.main)
                        .map(Action.numbersGenerated)
                        .eraseToAnyPublisher()
                }

            case let .numbersGenerated(numbers):
                state.numbers = numbers
                state.viewState = .completed
                state.buttonTitle = "다시 생성 🔄"
                state.isButtonDisabled = false
                return .none
            }
        }
    }
}
