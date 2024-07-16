//
//  LottoLocoApp.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct LottoLocoApp: App {
    var body: some Scene {
        WindowGroup {
            LottoNumberGeneratorView(
                store: Store(
                    initialState: LottoNumberGeneratorCore.State(),
                    reducer: {LottoNumberGeneratorCore() }
                ))
        }
    }
}
