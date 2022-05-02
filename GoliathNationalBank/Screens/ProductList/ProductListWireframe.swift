//
//  ProductListWireframe.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Alamofire
import UIKit

final class ProductListWireframe: BaseWireframe {
    private let resolver: AppResolver
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    init(resolver: AppResolver) {
        self.resolver = resolver

        let moduleViewController = storyboard.instantiateViewController(ofType: ProductListViewController.self)
        super.init(resolver: resolver, viewController: moduleViewController)

        let presenter = resolver.resolve(
            ProductListPresenterProtocol.self,
            arguments: moduleViewController as ProductListViewProtocol, self as ProductListWireframeProtocol
        )
        moduleViewController.presenter = presenter
    }
}

// MARK: - ProductListWireframeProtocol -

extension ProductListWireframe: ProductListWireframeProtocol {
    func navigate(to option: ProductListNavigationOption) {
        switch option {
        case .productDetails(let product):
            showProductDetails(product: product)
        }
    }

    private func showProductDetails(product: Product) {
        let wireframe = resolver.resolve(ProductDetailsWireframeProtocol.self, argument: product) as! BaseWireframe
        navigationController?.pushWireframe(wireframe, animated: true)
    }
}
