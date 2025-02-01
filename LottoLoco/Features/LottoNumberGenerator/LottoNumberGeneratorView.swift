//
//  LottoNumberGeneratorView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import Combine
import ComposableArchitecture
import SwiftUI

struct LottoNumberGeneratorView: View {
    let store: StoreOf<LottoNumberGeneratorCore>

    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: { $0 }) { viewStore in
                VStack(spacing: 20) {
                    Spacer()
                    
                    switch viewStore.viewState {
                    case .appear:
                        Text("🎲 행운의 로또 번호를 생성하세요!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .shimmer()

                    case .generating:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(.white)
                            .padding()

                    case .completed:
                        Text("🎉 당신의 행운 번호!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        HStack {
                            ForEach(viewStore.numbers, id: \.self) { number in
                                LottoNumberView(number: number)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }

                    Spacer()

                    Button {
                        viewStore.send(.generateNumbersButtonTapped)
                    } label: {
                        Text(viewStore.buttonTitle)
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(LinearGradient(
                                        colors: [.blue, .purple],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    ))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    .contentShape(Rectangle())
                    .disabled(viewStore.isButtonDisabled)
                }
                .safeAreaPadding()
                .background(Color.black)
                .navigationTitle("오늘의 행운 번호")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.black, for: .navigationBar)
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
