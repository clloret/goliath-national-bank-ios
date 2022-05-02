//
//  Rate.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

struct Rate: Decodable, Equatable {
    let from: String
    let to: String
    let rate: String
}
