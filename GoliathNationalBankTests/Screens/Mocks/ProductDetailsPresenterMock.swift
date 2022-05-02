//
//  ProductDetailsPresenterMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ProductDetailsPresenterMock: ProductDetailsPresenterProtocol {
    func viewDidLoad() {}

    func numberOfItems(in section: Int) -> Int {
        1
    }

    func item(at indexPath: IndexPath) -> Transaction {
        TestData.product.transactions.first!
    }
}
