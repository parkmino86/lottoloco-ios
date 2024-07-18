//
//  LottoNumberView.swift
//  LottoLoco
//
//  Created by minoh.park on 7/1/24.
//

import SwiftUI

struct LottoNumberView: View {
    let number: Int

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

    var body: some View {
        Text("\(number)")
            .font(.title2)
            .fontWeight(.bold)
            .frame(width: 48, height: 48)
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
