//
//  DecimalExtensionsTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class DecimalExtensionsTests: XCTestCase {
    func test_doubleValue_shouldReturnCorrectValue() {
        let sut: Decimal = 9999.99

        let result = sut.doubleValue

        XCTAssertEqual(result, 9999.99)
    }

    func test_formatAsCurrency_shouldReturnCorrectValue() {
        let sut: Decimal = 9999.99

        let result = sut.formatAsCurrency(currencyCode: "EUR")

        XCTAssertEqual(result, "9.999,99 €")
    }

    func test_formatAsNumber_shouldReturnCorrectValue() {
        let sut: Decimal = 9999.99

        let result = sut.formatAsNumber()

        XCTAssertEqual(result, "9.999,99")
    }
}
