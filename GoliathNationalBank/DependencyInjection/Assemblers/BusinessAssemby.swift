//
//  BusinessAssemby.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
import Swinject

class BusinessAssemby: Assembly {
    func assemble(container: Container) {
        container.register(FindMissingRatesProtocol.self) { _ in
            FindMissingRates()
        }
    }
}
