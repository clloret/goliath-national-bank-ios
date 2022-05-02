//
//  Service.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Alamofire
import Foundation

class Service: ServiceProtocol {
    private let session: Alamofire.Session

    init(session: Alamofire.Session) {
        self.session = session
    }

    func getRates(completion: @escaping (Result<[Rate], ServiceError>) -> Void) {
        session.request(AppConstants.Url.ratesUrl)
            .validate(contentType: ["application/json"])
            .validate()
            .responseDecodable(of: [Rate].self) { response in
                switch response.result {
                case .success(let data):
                    completion(Swift.Result.success(data))
                case .failure(let error):
                    print("Error: \(error)")
                    completion(Swift.Result.failure(ServiceError.requestError)
                    )
                }
            }
    }

    func getTransactions(completion: @escaping (Result<[Transaction], ServiceError>) -> Void) {
        session.request(AppConstants.Url.transactionsUrl)
            .validate(contentType: ["application/json"])
            .validate()
            .responseDecodable(of: [Transaction].self) { response in
                switch response.result {
                case .success(let data):
                    completion(Swift.Result.success(data))
                case .failure(let error):
                    print("Error: \(error)")
                    completion(Swift.Result.failure(ServiceError.requestError)
                    )
                }
            }
    }
}
