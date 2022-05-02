//
//  ProductDetailsPresenter.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

final class ProductDetailsPresenter {
    private unowned let view: ProductDetailsViewProtocol
    private let interactor: ProductDetailsInteractorProtocol
    private let wireframe: ProductDetailsWireframeProtocol

    private var product: Product

    init(
        view: ProductDetailsViewProtocol,
        interactor: ProductDetailsInteractorProtocol,
        wireframe: ProductDetailsWireframeProtocol,
        product: Product)
    {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.product = product
    }

    private func calcTotalAmount() -> String {
        let total = interactor.calcTotalAmount(product: product)
        return total.formatAsCurrency(currencyCode: AppConstants.currency)
    }
}

// MARK: - ProductDetailsPresenterProtocol -

extension ProductDetailsPresenter: ProductDetailsPresenterProtocol {
    func viewDidLoad() {
        view.showData(total: calcTotalAmount())
    }

    func numberOfItems(in section: Int) -> Int {
        return product.transactions.count
    }

    func item(at indexPath: IndexPath) -> Transaction {
        return product.transactions[indexPath.row]
    }
}
