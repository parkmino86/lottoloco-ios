//
//  ShimmerModifier.swift
//  LottoLoco
//
//  Created by minoh.park on 7/23/24.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var gradientLocation: CGFloat = -1.0
    
    private let duration: Double = 2.0
    private let gradientColors: [Color] = [Color.clear, Color.blue.opacity(0.4), Color.purple.opacity(0.4), Color.clear]
    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .offset(x: gradientLocation * UIScreen.main.bounds.width)
                .mask(content)
            )
            .onAppear {
                withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                    gradientLocation = 2.0
                }
            }
    }
}

extension View {
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
}
