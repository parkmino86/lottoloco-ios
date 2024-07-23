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
    func gradientBackground(colors: [Color], startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) -> some View {
        modifier(GradientBackgroundModifier(colors: colors, startPoint: startPoint, endPoint: endPoint))
    }
}
