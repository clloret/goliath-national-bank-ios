//
//  ProductListInteractor.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

final class ProductListInteractor {
    private let service: ServiceProtocol
    private let findMissingRates: FindMissingRatesProtocol

    init(service: ServiceProtocol, findMissingRates: FindMissingRatesProtocol) {
        self.service = service
        self.findMissingRates = findMissingRates
    }

    private func getAllCurrencies(from transactions: [Transaction]) -> [String] {
        return transactions.unique { $0.currency }.map { $0.currency }
    }

    private func findMissingRates(from transactions: [Transaction], and rates: [Rate]) {
        let currencies = getAllCurrencies(from: transactions)
        findMissingRates.setRates(rates: rates)
        let allRates = findMissingRates.checkMissingRates(from: currencies)
        CurrencyRates.shared.setRates(rates: allRates)
    }

    private func extractProducts(from transactions: [Transaction], and rates: [Rate]) -> [Product] {
        findMissingRates(from: transactions, and: rates)

        let productDict = Dictionary(grouping: transactions, by: { $0.sku })
        return productDict.map {
            Product(sku: $0.key, transactions: $0.value)
        }
    }
}

// MARK: - ProductListInteractorProtocol -

extension ProductListInteractor: ProductListInteractorProtocol {
    func getProductsAndRates(completion: @escaping (Result<[Product], ServiceError>) -> Void) {
        service.getTransactions { result in
            switch result {
            case .success(let transactions):
                self.service.getRates { result in
                    switch result {
                    case .success(let rates):
                        let items = self.extractProducts(from: transactions, and: rates)
                        completion(.success(items))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
