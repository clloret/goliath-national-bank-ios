//
//  ProductListPresenter.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

final class ProductListPresenter {
    private unowned let view: ProductListViewProtocol
    private let interactor: ProductListInteractorProtocol
    private let wireframe: ProductListWireframeProtocol

    private var items: [Product] = [] {
        didSet {
            view.reloadData()
        }
    }

    private var rates: [Rate] = []

    init(view: ProductListViewProtocol, interactor: ProductListInteractorProtocol, wireframe: ProductListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }

    private func getProducts() {
        view.setLoadingVisible(true)

        interactor.getProductsAndRates { [unowned self] result in
            view.setLoadingVisible(false)

            switch result {
            case .success(let products):
                items = products
            case .failure:
                wireframe.showError("No se han podido obtener los datos del servidor.")
            }
        }
    }
}

// MARK: - ProductListPresenterProtocol -

extension ProductListPresenter: ProductListPresenterProtocol {
    func viewDidLoad() {
        getProducts()
    }

    func numberOfItems(in section: Int) -> Int {
        return items.count
    }

    func item(at indexPath: IndexPath) -> Product {
        return items[indexPath.row]
    }

    func didSelectItem(at indexPath: IndexPath) {
        let item = items[indexPath.row]
        wireframe.navigate(to: .productDetails(item))
    }
}
