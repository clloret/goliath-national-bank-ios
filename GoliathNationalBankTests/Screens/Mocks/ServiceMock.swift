//
//  ServiceMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class ServiceMock: ServiceProtocol {
    var returnSuccessRates = true
    var returnSuccessTransactions = true

    func getRates(completion: @escaping (Result<[Rate], ServiceError>) -> Void) {
        if returnSuccessRates {
            completion(.success(TestData.enoughtRates))
        } else {
            completion(.failure(.requestError))
        }
    }

    func getTransactions(completion: @escaping (Result<[Transaction], ServiceError>) -> Void) {
        if returnSuccessTransactions {
            completion(.success(TestData.transactions))
        } else {
            completion(.failure(.requestError))
        }
    }
}
