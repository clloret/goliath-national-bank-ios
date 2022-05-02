//
//  ViewControllerProtocol.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import UIKit

protocol ViewControllerProtocol {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

extension UIViewController: ViewControllerProtocol {}
