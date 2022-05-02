//
//  ProductDetailsWireframe.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import UIKit

final class ProductDetailsWireframe: BaseWireframe {
    private let resolver: AppResolver
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    init(resolver: AppResolver, product: Product) {
        self.resolver = resolver

        let moduleViewController = storyboard.instantiateViewController(ofType: ProductDetailsViewController.self)
        super.init(resolver: resolver, viewController: moduleViewController)

        let presenter = resolver.resolve(
            ProductDetailsPresenterProtocol.self,
            arguments: moduleViewController as ProductDetailsViewProtocol,
            self as ProductDetailsWireframeProtocol,
            product
        )
        moduleViewController.presenter = presenter
    }
}

// MARK: - ProductDetailsWireframeProtocol -

extension ProductDetailsWireframe: ProductDetailsWireframeProtocol {}
