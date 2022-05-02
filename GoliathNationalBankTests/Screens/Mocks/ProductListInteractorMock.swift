//
//  ProductListInteractorMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ProductListInteractorMock: ProductListInteractorProtocol {
    private(set) var getProductsAndRatesCallCount = 0
    var resultSuccess: Bool = true

    func getProductsAndRates(completion: @escaping (Result<[Product], ServiceError>) -> Void) {
        getProductsAndRatesCallCount += 1
        if resultSuccess {
            completion(.success([TestData.product]))
        } else {
            completion(.failure(ServiceError.requestError))
        }
    }
}
