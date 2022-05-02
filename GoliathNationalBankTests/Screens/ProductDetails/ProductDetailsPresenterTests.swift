//
//  ProductDetailsPresenterTests.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ProductDetailsPresenterTests: XCTestCase {
    private var view: ProductDetailsViewMock!
    private var interactor: ProductDetailsInteractorProtocol!
    private var wireframe: ProductDetailsWireframeProtocol!
    private var sut: ProductDetailsPresenter!

    override func setUp() {
        super.setUp()

        view = ProductDetailsViewMock()
        interactor = ProductDetailsInteractorMock()
        wireframe = ProductDetailsWireframeMock()
        let product = TestData.product
        sut = ProductDetailsPresenter(view: view, interactor: interactor, wireframe: wireframe, product: product)
        sut.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        view = nil
        interactor = nil
        wireframe = nil

        super.tearDown()
    }

    func test_viewShowDataTotal_isCorrect() {
        XCTAssertEqual(view.showDataTotal, "9.999,99 €")
    }

    func test_numberOfItems_isCorrect() {
        let result = sut.numberOfItems(in: 1)

        XCTAssertEqual(result, 2)
    }

    func test_itemAtIndexPath_isCorrect() {
        let indexPath = IndexPath(row: 0, section: 0)
        let result = sut.item(at: indexPath)

        XCTAssertEqual(result, TestData.product.transactions.first)
    }
}
