//
//  ShimmerModifier.swift
//  LottoLoco
//
//  Created by minoh.park on 7/23/24.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var gradientLocation: CGFloat = -1.0

    private let duration: Double
    private let gradientColors: [Color]

    init(duration: Double = 2.0, gradientColors: [Color] = [Color.clear, Color.blue.opacity(0.7), Color.purple.opacity(0.7), Color.clear]) {
        self.duration = duration
        self.gradientColors = gradientColors
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(colors: gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geometry.size.width * 2)
                    .offset(x: gradientLocation * geometry.size.width - geometry.size.width)
                }
                .mask(content)
            )
            .onAppear {
                withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                    gradientLocation = 2.0
                }
            }
            .onDisappear {
                gradientLocation = -1.0
            }
    }
}

extension View {
    func shimmer(duration: Double = 2.0, gradientColors: [Color] = [Color.clear, Color.blue.opacity(0.7), Color.purple.opacity(0.7), Color.clear]) -> some View {
        self.modifier(ShimmerModifier(duration: duration, gradientColors: gradientColors))
    }
}
