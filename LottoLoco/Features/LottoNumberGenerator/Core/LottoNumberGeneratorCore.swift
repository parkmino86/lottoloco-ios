//
//  LottoNumberGeneratorCore.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import ComposableArchitecture

struct LottoNumberGeneratorCore: Reducer {
    
    // MARK: - State
    
    struct State: Equatable {
        var lottoNumbers: [Int] = []
    }
    
    // MARK: - Action
    
    enum Action: Equatable {
        case generateNumbersButtonTapped
    }
    
    // MARK: - Dependency
    
    @Dependency(\.lottoNumberGeneratorClient) var lottoNumberGeneratorClient
    
    // MARK: - Reducer Body
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .generateNumbersButtonTapped:
                state.lottoNumbers = lottoNumberGeneratorClient.generateNumbers()
                return .none
            }
        }
    }
}
