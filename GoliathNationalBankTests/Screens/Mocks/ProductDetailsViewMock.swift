//
//  ProductDetailsViewMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ProductDetailsViewMock: ProductDetailsViewProtocol {
    private(set) var showDataTotal = ""

    func showData(total: String) {
        showDataTotal = total
    }
}
