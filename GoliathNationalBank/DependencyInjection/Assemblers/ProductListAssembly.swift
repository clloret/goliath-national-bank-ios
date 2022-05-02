//
//  ProductListAssembly.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
import Swinject

class ProductListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProductListInteractorProtocol.self) { resolver in
            let service = resolver.resolve(ServiceProtocol.self)!
            let findMissingRates = resolver.resolve(FindMissingRatesProtocol.self)!
            return ProductListInteractor(service: service, findMissingRates: findMissingRates)
        }

        container.register(ProductListPresenterProtocol.self) { (resolver,
                                                                 view: ProductListViewProtocol,
                                                                 wireframe: ProductListWireframeProtocol) in
                let interactor = resolver.resolve(ProductListInteractorProtocol.self)!
                return ProductListPresenter(view: view, interactor: interactor, wireframe: wireframe)
        }

        container.register(ProductListWireframeProtocol.self) { resolver in
            ProductListWireframe(resolver: AppResolverWrapper(resolver))
        }
    }
}
