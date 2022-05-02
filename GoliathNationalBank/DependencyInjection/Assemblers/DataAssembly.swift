//
//  DataAssembly.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Alamofire
import Foundation
import Swinject

class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Alamofire.Session.self) { _ in
            Session.default
        }
        .inObjectScope(.container)

        container.register(ServiceProtocol.self) { r in
            let session = r.resolve(Alamofire.Session.self)!
            return Service(session: session)
        }
        .inObjectScope(.container)
    }
}
