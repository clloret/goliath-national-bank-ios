//
//  ProductDetailsInteractorTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ProductDetailsInteractorTests: XCTestCase {
    func test_calcTotalAmount_shouldReturnCorrectValue() {
        let currencyRates = CurrencyRates.shared
        currencyRates.setRates(rates: TestData.enoughtRates)

        let sut = ProductDetailsInteractor()
        let result = sut.calcTotalAmount(product: TestData.product)

        XCTAssertEqual(result, 113.0)
    }
}
