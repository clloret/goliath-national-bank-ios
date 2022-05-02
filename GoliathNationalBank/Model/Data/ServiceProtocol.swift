//
//  ServiceProtocol.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

protocol ServiceProtocol {
    func getRates(completion: @escaping (Result<[Rate], ServiceError>) -> Void)
    func getTransactions(completion: @escaping (Result<[Transaction], ServiceError>) -> Void)
}
