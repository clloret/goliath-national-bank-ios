//
//  ProductListViewControllerTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ProductListViewControllerTests: XCTestCase {
    private var sut: ProductListViewController!
    private var presenter: ProductListPresenterMock!

    override func setUp() {
        super.setUp()

        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(ofType: ProductListViewController.self)

        presenter = ProductListPresenterMock()
        sut.presenter = presenter

        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        presenter = nil

        super.tearDown()
    }

    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView, "tableView")
    }

    func test_tableViewDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView.dataSource, "dataSource")
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
    }

    func test_cellForRowAt_whenFirstRow_shouldSetLabelToFirstProductSku() {
        let cell = cellForRow(in: sut.tableView, row: 0)

        XCTAssertEqual(cell?.textLabel?.text, "X0001")
    }

    func test_tableViewDidSelectRowAt_shouldCallDidSelectRowAt() {
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        XCTAssertEqual(presenter.didSelectItemCalledCount, 1)
    }
}
