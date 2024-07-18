//
//  QRCodeScannerView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/17/24.
//

import ComposableArchitecture
import SwiftUI

struct QRCodeScannerView: View {
    let store: StoreOf<QRCodeScannerCore>

    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: { $0 }) { _ in
                VStack {
                    Text("📷 QR 코드를 스캔해주세요")
                        .font(.headline)
                        .padding()
                }
                .safeAreaPadding()
                .navigationTitle("당첨 확인")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    QRCodeScannerView(
        store: Store(
            initialState: QRCodeScannerCore.State(),
            reducer: { QRCodeScannerCore() }
        )
    )
}
