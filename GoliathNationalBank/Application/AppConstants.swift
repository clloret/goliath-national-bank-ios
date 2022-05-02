//
//  AppConstants.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Alamofire
import Foundation

struct AppConstants {
    static let currency = "EUR"

    enum Url {
        private static let scheme = "https"
        static let host = "quiet-stone-2094.herokuapp.com"
        private static let rates = "/rates"
        private static let transactions = "/transactions"

        private static var baseUrl: URL {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            return components.url!
        }

        static var ratesUrl: URL {
            return baseUrl.appendingPathComponent(rates)
        }

        static var transactionsUrl: URL {
            return baseUrl.appendingPathComponent(transactions)
        }
    }
}
