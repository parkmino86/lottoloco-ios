//
//  LottoNumberGeneratorView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import ComposableArchitecture
import SwiftUI

struct LottoNumberGeneratorView: View {
    // MARK: - Properties
    let store: StoreOf<LottoNumberGeneratorCore>

    // MARK: - Body
    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: { $0 }) { viewStore in
                VStack {
                    Spacer()

                    HStack {
                        ForEach(viewStore.lottoNumbers, id: \.self) { number in
                            LottoNumberView(number: number)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()

                    Button(action: {
                        viewStore.send(.generateNumbersButtonTapped)
                    }) {
                        Text("새 번호 뽑기")
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .safeAreaPadding()
                .navigationTitle("오늘의 행운 번호")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct LottoNumberGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        LottoNumberGeneratorView(
            store: Store(
                initialState: LottoNumberGeneratorCore.State(),
                reducer: { LottoNumberGeneratorCore() },
                withDependencies: {
                    $0.lottoNumberGeneratorClient = .dummyValue
                }
            )
        )
    }
}
