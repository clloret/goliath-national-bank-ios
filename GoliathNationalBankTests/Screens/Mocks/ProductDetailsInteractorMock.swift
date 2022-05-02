//
//  ProductDetailsInteractorMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ProductDetailsInteractorMock: ProductDetailsInteractorProtocol {
    func calcTotalAmount(product: Product) -> Decimal {
        return 9999.99
    }
}
