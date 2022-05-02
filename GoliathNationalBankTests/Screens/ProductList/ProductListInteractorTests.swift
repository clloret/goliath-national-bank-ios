//
//  ProductListInteractorTests.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ProductListInteractorTests: XCTestCase {
    private var service: ServiceMock!
    private var sut: ProductListInteractor!

    override func setUp() {
        super.setUp()

        service = ServiceMock()
        sut = ProductListInteractor(service: service, findMissingRates: FindMissingRates())
    }

    override func tearDown() {
        sut = nil
        service = nil

        super.tearDown()
    }

    func test_getProductsAndRates_shouldReturnSuccess() {
        let expectation = XCTestExpectation(description: #function)
        var outerResult: Result<[Product], ServiceError>?

        sut.getProductsAndRates { result in
            outerResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(outerResult?.isSuccess, true)
    }

    func test_getProductsAndRates_whenRatesFailure_shouldReturnFailure() {
        service.returnSuccessRates = false

        let expectation = XCTestExpectation(description: #function)
        var outerResult: Result<[Product], ServiceError>?

        sut.getProductsAndRates { result in
            outerResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(outerResult?.isFailure, true)
    }

    func test_getProductsAndRates_whenTransactionsFailure_shouldReturnFailure() {
        service.returnSuccessTransactions = false

        let expectation = XCTestExpectation(description: #function)
        var outerResult: Result<[Product], ServiceError>?

        sut.getProductsAndRates { result in
            outerResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(outerResult?.isFailure, true)
    }
}
