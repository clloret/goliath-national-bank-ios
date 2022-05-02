//
//  ProductListWireframeTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

@testable import GoliathNationalBank
import Swinject
import XCTest

class ProductListWireframeTests: XCTestCase {
    private var sut: ProductListWireframe!
    private var productDetailswireframe: ProductDetailsWireframe!
    private var navigationController: UINavigationControllerMock!
    private var container: Container!

    override func setUp() {
        super.setUp()

        registerDependencies()
        sut = ProductListWireframe(resolver: container)

        navigationController = UINavigationControllerMock()
        sut.navigationControllerProtocol = navigationController
    }

    override func tearDown() {
        sut = nil
        productDetailswireframe = nil
        navigationController = nil
        container = nil

        super.tearDown()
    }

    private func registerDependencies() {
        container = Container()
        container.register(ProductListPresenterProtocol.self) { _ in ProductListPresenterMock() }
        container.register(ProductDetailsWireframeProtocol.self) { (resolver, product: Product) in
            self.productDetailswireframe = ProductDetailsWireframe(resolver: AppResolverWrapper(resolver), product: product)
            return self.productDetailswireframe
        }
    }

    func test_navigateToProductDetails_pushWireframe() {
        sut.navigate(to: .productDetails(TestData.product))

        XCTAssertEqual(navigationController.pushWireframeCallCount[productDetailswireframe], 1)
    }
}
