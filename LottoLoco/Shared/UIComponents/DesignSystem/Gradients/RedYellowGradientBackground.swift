//
//  RedYellowGradientBackground.swift
//  LottoLoco
//
//  Created by minoh.park on 7/21/24.
//

import SwiftUI

extension View {
    func applyRedYellowGradientBackground() -> some View {
        gradientBackground(colors: [Color.red, Color.yellow])
    }
}
