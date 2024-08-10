//
//  QRCodeScannerCore.swift
//  LottoLoco
//
//  Created by minoh.park on 7/17/24.
//

import ComposableArchitecture

@Reducer
struct QRCodeScannerCore {
    struct State: Equatable {
        var scannedCode: String? = nil
    }

    enum Action: Equatable {}

    @Dependency(\.lottoNumberGeneratorClient) var lottoNumberGeneratorClient

    var body: some ReducerOf<Self> {
        Reduce { _, _ in
            .none
        }
    }
}
