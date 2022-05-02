//
//  TestHelpers.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import UIKit

func cellForRow(in tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
    tableView.dataSource?.tableView(
        tableView, cellForRowAt: IndexPath(row: row, section: section)
    )
}
