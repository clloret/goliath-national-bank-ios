//
//  ProductListViewController.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import SVProgressHUD
import UIKit

final class ProductListViewController: UIViewController {
    @IBOutlet private(set) var tableView: UITableView!

    private enum Constants {
        static let cellReuseIndentifier = "DefaultCell"
    }

    var presenter: ProductListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter.viewDidLoad()
    }

    private func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellReuseIndentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - ProductListViewProtocol -

extension ProductListViewController: ProductListViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }

    func setLoadingVisible(_ visible: Bool) {
        if visible {
            SVProgressHUD.show(withStatus: "Cargando...")
        } else {
            SVProgressHUD.dismiss()
        }
    }
}

// MARK: - UITableViewDataSource -

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIndentifier, for: indexPath)
        let item = presenter.item(at: indexPath)
        cell.textLabel?.text = item.sku
        return cell
    }
}

// MARK: - UITableViewDelegate -

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
}
