//
//  ProductListPresenterMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ProductListPresenterMock: ProductListPresenterProtocol {
    var viewDidLoadCallCount: Int = 0
    var didSelectItemCalledCount: Int = 0

    func numberOfItems(in section: Int) -> Int {
        0
    }

    func item(at indexPath: IndexPath) -> Product {
        TestData.product
    }

    func viewDidLoad() {
        viewDidLoadCallCount += 1
    }

    func didSelectItem(at indexPath: IndexPath) {
        didSelectItemCalledCount += 1
    }
}
