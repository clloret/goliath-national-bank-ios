//
//  ProductDetailsAssembly.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
import Swinject

class ProductDetailsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProductDetailsInteractorProtocol.self) { _ in
            ProductDetailsInteractor()
        }

        container.register(ProductDetailsPresenterProtocol.self) { (resolver,
                                                                     view: ProductDetailsViewProtocol,
                                                                     wireframe: ProductDetailsWireframeProtocol,
                                                                     product: Product) in
                let interactor = resolver.resolve(ProductDetailsInteractorProtocol.self)!
                return ProductDetailsPresenter(view: view, interactor: interactor, wireframe: wireframe, product: product)
        }

        container.register(ProductDetailsWireframeProtocol.self) { (resolver, product: Product) in
            ProductDetailsWireframe(resolver: AppResolverWrapper(resolver), product: product)
        }
    }
}
