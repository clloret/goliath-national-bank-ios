//
//  ProductDetailsCell.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import UIKit

class ProductDetailsCell: UITableViewCell {
    @IBOutlet private(set) var currencyLabel: UILabel?
    @IBOutlet private(set) var amountLabel: UILabel?

    func setup(with transaction: Transaction) {
        currencyLabel?.text = transaction.currency
        amountLabel?.text = transaction.amount.decimalValueOrZero.formatAsNumber()
    }
}
