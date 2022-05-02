//
//  Result+Extensions.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

extension Result {
    var isSuccess: Bool {
        { if case .success = self { return true } else { return false } }()
    }

    var isFailure: Bool {
        { if case .failure = self { return true } else { return false } }()
    }
}
