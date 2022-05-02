//
//  ProductListWireframeMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ProductListWireframeMock: ProductListWireframeProtocol {
    private(set) var navigateCallCount: [ProductListNavigationOption: Int] = [:]
    private(set) var showErrorCallCount: [String: Int] = [:]

    func showError(_ errorMessage: String) {
        let count = showErrorCallCount[errorMessage] ?? 0
        showErrorCallCount[errorMessage] = count + 1
    }

    func navigate(to option: ProductListNavigationOption) {
        let count = navigateCallCount[option] ?? 0
        navigateCallCount[option] = count + 1
    }
}
