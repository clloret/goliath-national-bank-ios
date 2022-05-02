//
//  ProductDetailsViewController.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import UIKit

final class ProductDetailsViewController: UIViewController {
    @IBOutlet private(set) var tableView: UITableView!
    @IBOutlet private(set) var totalLabel: UILabel!

    private enum Constants {
        static let cellReuseIndentifier = "DefaultCell"
    }

    var presenter: ProductDetailsPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter.viewDidLoad()
    }

    private func setupView() {
        tableView.dataSource = self
    }
}

// MARK: - ProductDetailsViewProtocol -

extension ProductDetailsViewController: ProductDetailsViewProtocol {
    func showData(total: String) {
        totalLabel.text = "Total: \(total)"
    }
}

// MARK: - UITableViewDataSource -

extension ProductDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIndentifier, for: indexPath)
            as! ProductDetailsCell
        let item = presenter.item(at: indexPath)
        cell.setup(with: item)
        return cell
    }
}
