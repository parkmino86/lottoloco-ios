//
//  LottoNumberGeneratorClient.swift
//  LottoLoco
//
//  Created by minoh.park on 7/16/24.
//

import ComposableArchitecture

struct LottoNumberGeneratorClient {
    var generateNumbers: () -> [Int]
}

extension LottoNumberGeneratorClient: DependencyKey {
    static let liveValue = LottoNumberGeneratorClient {
        (1 ... 45).shuffled().prefix(6).sorted()
    }

    static let dummyValue = LottoNumberGeneratorClient {
        [1, 2, 3, 4, 5, 6]
    }
}

extension DependencyValues {
    var lottoNumberGeneratorClient: LottoNumberGeneratorClient {
        get { self[LottoNumberGeneratorClient.self] }
        set { self[LottoNumberGeneratorClient.self] = newValue }
    }
}
