//
//  ProductListPresenterTests.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ProductListPresenterTests: XCTestCase {
    private var sut: ProductListPresenter!
    private let view = ProductListViewMock()
    private let interactor = ProductListInteractorMock()
    private let wireframe = ProductListWireframeMock()

    override func setUp() {
        super.setUp()
        sut = ProductListPresenter(view: view, interactor: interactor, wireframe: wireframe)
        sut.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_viewReloadData_isCalledOnce() {
        XCTAssertEqual(view.reloadDataCallCount, 1)
    }

    func test_viewSetLoaderVisible_isCalledFirstWithTrueAndThenWithFalse() {
        XCTAssertEqual(view.setLoadingVisibleCallCount[true], 1)
        XCTAssertEqual(view.setLoadingVisibleCallCount[false], 1)
    }

    func test_numberOfItems_isOne() {
        let result = sut.numberOfItems(in: 1)

        XCTAssertEqual(result, 1)
    }

    func test_itemAtIndexPath_returnCorrectValue() {
        let indexPath = IndexPath(row: 0, section: 0)
        let result = sut.item(at: indexPath)

        XCTAssertEqual(result, TestData.product)
    }

    func test_didSelectItem_navigateToProductDetails() {
        let indexPath = IndexPath(row: 0, section: 0)
        sut.didSelectItem(at: indexPath)

        XCTAssertEqual(wireframe.navigateCallCount[.productDetails(TestData.product)], 1)
    }

    func test_viewDidLoad_showError_whenGetProductsFailure() {
        interactor.resultSuccess = false
        sut.viewDidLoad()

        XCTAssertEqual(wireframe.showErrorCallCount["No se han podido obtener los datos del servidor."], 1)
    }
}
