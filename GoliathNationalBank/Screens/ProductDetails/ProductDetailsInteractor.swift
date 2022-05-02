//
//  ProductDetailsInteractor.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

final class ProductDetailsInteractor {
    private func getEuroAmount(_ transaction: Transaction) -> Decimal {
        let currencyRates = CurrencyRates.shared

        if transaction.currency != AppConstants.currency {
            let rate = currencyRates.getRateBetween(from: transaction.currency, to: AppConstants.currency)
            return transaction.amount.decimalValueOrZero * rate
        }

        return transaction.amount.decimalValueOrZero
    }
}

// MARK: - ProductDetailsInteractorProtocol -

extension ProductDetailsInteractor: ProductDetailsInteractorProtocol {
    func calcTotalAmount(product: Product) -> Decimal {
        return product.transactions.reduce(0.0) { acc, transaction in
            acc + getEuroAmount(transaction)
        }
    }
}
