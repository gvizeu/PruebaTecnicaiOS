//
//  VisibleAccountsViewController.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit
protocol VisibleAccountsControllerProtocol: class {
    var presenter: VisibleAccountsPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

class VisibleAccountsViewController: UIViewController, VisibleAccountsControllerProtocol {

    var presenter: VisibleAccountsPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getData()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}

extension VisibleAccountsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.accounts?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier = VisibleAccountsTableViewCell.reuseIdentified()
        var cell: VisibleAccountsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? VisibleAccountsTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "VisibleAccountsTableViewCell", bundle: nil),
                               forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? VisibleAccountsTableViewCell
        }
        let account = self.presenter?.accounts?[indexPath.row]
        cell.configureCell(accountName: account?.accountName,
                           iban: account?.iban,
                           balance: account!.accountBalanceInCents!)
        return cell
    }

}
