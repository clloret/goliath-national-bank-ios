//
//  StringExtensionsTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class StringExtensionsTests: XCTestCase {
    func test_decimalValueOrZero_whenCorrectNumber_shouldReturnCorrectValue() {
        let sut = "9999.99"

        let result = sut.decimalValueOrZero

        XCTAssertEqual(result, 9999.99)
    }

    func test_decimalValueOrZero_whenEmptyString_shouldReturnZero() {
        let sut = ""

        let result = sut.decimalValueOrZero

        XCTAssertTrue(result.isZero)
    }
}
