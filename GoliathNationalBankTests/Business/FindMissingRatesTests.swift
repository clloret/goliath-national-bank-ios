//
//  FindMissingRatesTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class FindMissingRatesTests: XCTestCase {
    private var sut: FindMissingRates!

    override func setUp() {
        super.setUp()
        sut = FindMissingRates()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_checkMissingRates_whenRatesFound_shouldContainMissingRates() {
        sut.setRates(rates: TestData.enoughtRates)
        let result = sut.checkMissingRates(from: TestData.currencies)

        let containsAUDtoEUR = result.contains(where: {
            $0.from == "AUD" && $0.to == "EUR" && $0.rate.decimalValueOrZero != 0.0
        })

        let containsUSDtoEUR = result.contains(where: {
            $0.from == "USD" && $0.to == "EUR" && $0.rate.decimalValueOrZero != 0.0
        })

        XCTAssertTrue(containsAUDtoEUR)
        XCTAssertTrue(containsUSDtoEUR)
    }

    func test_checkMissingRates_whenRatesNotFound_shouldNotContainMissingRates() {
        sut.setRates(rates: TestData.insufficientRates)
        let result = sut.checkMissingRates(from: TestData.currencies)

        let containsAUDtoEUR = result.contains(where: {
            $0.from == "AUD" && $0.to == "EUR" && $0.rate.decimalValueOrZero != 0.0
        })

        let containsUSDtoEUR = result.contains(where: {
            $0.from == "USD" && $0.to == "EUR" && $0.rate.decimalValueOrZero != 0.0
        })

        XCTAssertFalse(containsAUDtoEUR)
        XCTAssertFalse(containsUSDtoEUR)
    }
}
