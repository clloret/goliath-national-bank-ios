//
//  ProductDetailsContract.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

protocol ProductDetailsWireframeProtocol: WireframeProtocol {}

protocol ProductDetailsViewProtocol: AnyObject {
    func showData(total: String)
}

protocol ProductDetailsPresenterProtocol: PresenterProtocol {
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Transaction
}

protocol ProductDetailsInteractorProtocol {
    func calcTotalAmount(product: Product) -> Decimal
}
