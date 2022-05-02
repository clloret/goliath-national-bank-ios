//
//  AlertUtilsTests.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class AlertUtilsTests: XCTestCase {
    class ViewControllerMock: ViewControllerProtocol {
        private(set) var presentCallCount = 0

        func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
            presentCallCount += 1
        }
    }

    func test_showError_whenCall_shouldPresentViewController() {
        let sut = AlertUtils()
        let viewController = ViewControllerMock()

        sut.showError(in: viewController, with: "Error!")

        XCTAssertEqual(viewController.presentCallCount, 1)
    }
}
