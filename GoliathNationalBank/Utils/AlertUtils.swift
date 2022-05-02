//
//  AlertUtils.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import UIKit

final class AlertUtils: AlertUtilsProtocol {
    func showError(in viewController: ViewControllerProtocol, with message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "Aceptar", style: .default)
        )
        viewController.present(alert, animated: true, completion: nil)
    }
}
