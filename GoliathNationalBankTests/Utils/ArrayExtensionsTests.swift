//
//  ArrayExtensionsTests.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class ArrayExtensionsTests: XCTestCase {
    func test_unique_whithNonUniqueValues_shouldReturnOnlyUniqueValues() {
        let sut = ["One", "Two", "Three", "One"]

        let result = sut.unique { $0 }

        XCTAssertEqual(result.count, 3)
    }
}
