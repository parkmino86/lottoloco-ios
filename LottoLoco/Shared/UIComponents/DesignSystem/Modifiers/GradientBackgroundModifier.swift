//
//  GradientBackgroundModifier.swift
//  LottoLoco
//
//  Created by minoh.park on 7/21/24.
//

import SwiftUI

struct GradientBackgroundModifier: ViewModifier {
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            )
    }
}

extension View {
    private func gradientBackground(colors: [Color], startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) -> some View {
        modifier(GradientBackgroundModifier(colors: colors, startPoint: startPoint, endPoint: endPoint))
    }
}

extension View {
    func applyBluePurpleGradientBackground() -> some View {
        gradientBackground(colors: [Color.blue, Color.purple])
    }
    
    func applyRedYellowGradientBackground() -> some View {
        gradientBackground(colors: [Color.red, Color.yellow])
    }
    
    func applyGreenBlueGradientBackground() -> some View {
        gradientBackground(colors: [Color.green, Color.blue])
    }
}
