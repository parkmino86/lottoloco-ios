//
//  LottoNumberGenerator.swift
//  LottoLoco
//
//  Created by minoh.park on 7/21/24.
//

import Foundation

enum LottoNumberGenerator {
    static func generateNumbers() -> [Int] {
        return (1 ... 45).shuffled().prefix(6).sorted()
    }
}
