//
//  ProductListViewMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ProductListViewMock: ProductListViewProtocol {
    private(set) var reloadDataCallCount = 0
    private(set) var setLoadingVisibleCallCount: [Bool: Int] = [:]

    func reloadData() {
        reloadDataCallCount += 1
    }

    func setLoadingVisible(_ visible: Bool) {
        let count = setLoadingVisibleCallCount[visible] ?? 0
        setLoadingVisibleCallCount[visible] = count + 1
    }
}
