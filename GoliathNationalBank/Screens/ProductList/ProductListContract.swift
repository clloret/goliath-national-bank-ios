//
//  ProductListContract.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

enum ProductListNavigationOption: Equatable {
    case productDetails(Product)
}

extension ProductListNavigationOption: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .productDetails:
            hasher.combine("productDetails")
        }
    }
}

protocol ProductListWireframeProtocol: WireframeProtocol {
    func navigate(to option: ProductListNavigationOption)
}

protocol ProductListViewProtocol: AnyObject {
    func reloadData()
    func setLoadingVisible(_ visible: Bool)
}

protocol ProductListPresenterProtocol: PresenterProtocol {
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Product
    func didSelectItem(at indexPath: IndexPath)
}

protocol ProductListInteractorProtocol {
    func getProductsAndRates(completion: @escaping (Result<[Product], ServiceError>) -> Void)
}
