//
//  String+Extensions.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

extension String {
    var decimalValueOrZero: Decimal {
        Decimal(string: self) ?? 0.0
    }
}
