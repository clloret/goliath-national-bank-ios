//
//  ServiceTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Alamofire
@testable import GoliathNationalBank
import OHHTTPStubs
import XCTest

class ServiceTests: XCTestCase {
    private let session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.af.default
        HTTPStubs.setEnabled(true, for: configuration)
        return Alamofire.Session(configuration: configuration)
    }()

    private var sut: Service!

    override func setUp() {
        super.setUp()

        setupStubs()
        sut = Service(session: session)
    }

    override func tearDown() {
        HTTPStubs.removeAllStubs()

        super.tearDown()
    }

    private func setupStubs() {}

    private func setupRatesStub() {
        stub(condition: isAbsoluteURLString(AppConstants.Url.ratesUrl.absoluteString)) { _ in
            let stubPath = OHPathForFile("Rates.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }
    }

    private func setupTransactionsStub() {
        stub(condition: isAbsoluteURLString(AppConstants.Url.transactionsUrl.absoluteString)) { _ in
            let stubPath = OHPathForFile("Transactions.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }
    }

    private func setupErrorStub() {
        stub(condition: isHost(AppConstants.Url.host)) { _ in
            let error = NSError(
                domain: "Test",
                code: 500,
                userInfo: [:]
            )
            return HTTPStubsResponse(error: error)
        }
    }

    func test_getRates_whenReceiveCorrectData_shouldReturnSuccess() {
        let expectation = XCTestExpectation(description: #function)
        var outerResult: Result<[Rate], ServiceError>?

        setupRatesStub()

        sut.getRates { result in
            outerResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)

        XCTAssertEqual(outerResult, .success(TestData.enoughtRates))
    }

    func test_getRates_whenReceiveAnError_shouldReturnFailure() {
        let expectation = XCTestExpectation(description: #function)
        var outerResult: Result<[Rate], ServiceError>?

        setupErrorStub()

        sut.getRates { result in
            outerResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)

        XCTAssertEqual(outerResult, .failure(.requestError))
    }

    func test_getTransactions_whenReceiveCorrectData_shouldReturnSuccess() {
        let expectation = XCTestExpectation(description: #function)
        var outerResult: Result<[Transaction], ServiceError>?

        setupTransactionsStub()

        sut.getTransactions { result in
            outerResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)

        XCTAssertEqual(outerResult, .success(TestData.transactions))
    }

    func test_getTransactions_whenReceiveAnError_shouldReturnFailure() {
        let expectation = XCTestExpectation(description: #function)
        var outerResult: Result<[Transaction], ServiceError>?

        setupErrorStub()

        sut.getTransactions { result in
            outerResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)

        XCTAssertEqual(outerResult, .failure(.requestError))
    }
}
