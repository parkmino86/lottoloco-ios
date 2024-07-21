//
//  LottoNumberView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import SwiftUI

public struct LottoNumberView: View {
    public let number: Int
    public var size: CGFloat

    private var numberColor: Color {
        switch number {
        case 1 ... 10:
            return .yellow
        case 11 ... 20:
            return .blue
        case 21 ... 30:
            return .red
        case 31 ... 40:
            return .gray
        case 41 ... 45:
            return .green
        default:
            return .white
        }
    }

    public init(number: Int, size: CGFloat = 48) {
        self.number = number
        self.size = size
    }

    public var body: some View {
        Text("\(number)")
            .font(.system(size: size * 0.5))
            .fontWeight(.bold)
            .frame(width: size, height: size)
            .background(numberColor)
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct LottoNumberView_Previews: PreviewProvider {
    static var previews: some View {
        LottoNumberView(number: 1)
    }
}
