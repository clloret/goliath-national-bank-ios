//
//  ProductDetailsCellTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ProductDetailsCellTests: XCTestCase {
    private var viewController: ProductDetailsViewController!
    private var presenter: ProductDetailsPresenterProtocol!
    private var sut: ProductDetailsCell!

    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        viewController = sb.instantiateViewController(ofType: ProductDetailsViewController.self)

        presenter = ProductDetailsPresenterMock()
        viewController.presenter = presenter
        viewController.loadViewIfNeeded()

        sut = cellForRow(in: viewController.tableView, row: 0) as? ProductDetailsCell
    }

    override func tearDown() {
        sut = nil
        viewController = nil
        presenter = nil
        super.tearDown()
    }

    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.currencyLabel, "currencyLabel")
        XCTAssertNotNil(sut.amountLabel, "amountLabel")
    }

    func test_setup_shouldSetValues() {
        XCTAssertEqual(sut.currencyLabel?.text, "CAD", "currencyLabel")
        XCTAssertEqual(sut.amountLabel?.text, "100,00", "amountLabel")
    }
}
