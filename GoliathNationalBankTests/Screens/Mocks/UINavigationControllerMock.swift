//
//  UINavigationControllerMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import UIKit

class UINavigationControllerMock: UINavigationControllerProtocol {
    private(set) var pushViewControllerCount: [UIViewController: Int] = [:]
    private(set) var pushWireframeCallCount: [BaseWireframe: Int] = [:]

    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let count = pushViewControllerCount[viewController] ?? 0
        pushViewControllerCount[viewController] = count + 1
    }

    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool) {
        let count = pushWireframeCallCount[wireframe] ?? 0
        pushWireframeCallCount[wireframe] = count + 1
    }
}
