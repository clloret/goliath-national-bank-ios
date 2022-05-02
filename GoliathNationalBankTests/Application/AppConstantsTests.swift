//
//  AppConstantsTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class AppConstantsTests: XCTestCase {
    func test_ratesUrl_isCorrect() {
        XCTAssertEqual(AppConstants.Url.ratesUrl.absoluteString, "https://quiet-stone-2094.herokuapp.com/rates")
    }

    func test_transactionsUrl_isCorrect() {
        XCTAssertEqual(AppConstants.Url.transactionsUrl.absoluteString, "https://quiet-stone-2094.herokuapp.com/transactions")
    }
}
