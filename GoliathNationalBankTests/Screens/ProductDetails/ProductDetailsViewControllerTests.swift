//
//  ProductDetailsViewControllerTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ProductDetailsViewControllerTests: XCTestCase {
    private var interactor: ProductDetailsInteractorProtocol!
    private var wireframe: ProductDetailsWireframeProtocol!
    private var presenter: ProductDetailsPresenterProtocol!
    private var sut: ProductDetailsViewController!

    override func setUp() {
        super.setUp()

        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(ofType: ProductDetailsViewController.self)

        interactor = ProductDetailsInteractorMock()
        wireframe = ProductDetailsWireframeMock()
        presenter = ProductDetailsPresenter(view: sut, interactor: interactor, wireframe: wireframe,
                                            product: TestData.product)
        sut.presenter = presenter

        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        interactor = nil
        wireframe = nil
        presenter = nil
        super.tearDown()
    }

    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.totalLabel, "totalLabel")
        XCTAssertNotNil(sut.tableView, "tableView")
    }

    func test_tableViewDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView.dataSource, "dataSource")
    }

    func test_totalLabel_shouldDisplayCorrectValue() {
        XCTAssertEqual(sut.totalLabel.text, "Total: 9.999,99 €")
    }

    func test_numberOfRowsInSection_shouldReturnCorrectNumber() {
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
}
