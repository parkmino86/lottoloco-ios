//
//  ContentView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/17/24.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LottoNumberGeneratorView(
                store: Store(
                    initialState: LottoNumberGeneratorCore.State(),
                    reducer: { LottoNumberGeneratorCore() }
                )
            )
//            .tabItem {
//                Label("", systemImage: "gift")
//            }
//
//            QRCodeScannerView(store: Store(
//                initialState: QRCodeScannerCore.State(),
//                reducer: { QRCodeScannerCore() }
//            ))
//            .tabItem {
//                Label("", systemImage: "qrcode")
//            }
        }
    }
}
