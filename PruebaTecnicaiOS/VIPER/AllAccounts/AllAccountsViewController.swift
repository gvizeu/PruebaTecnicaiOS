//
//  AllAcountsViewController.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit
protocol AllAccountsViewControllerProtocol: class
{
    var presenter: AllAccountsPresenterProtocol? { get set }
    var tableViewDelegate: UITableView? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

class AllAccountsViewController: UIViewController, AllAccountsViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    var tableViewDelegate: UITableView?
    

    
    @IBOutlet weak var mySegmented: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var presenter: AllAccountsPresenterProtocol?
    var changed: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getData()
        self.changed = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableViewDelegate = self.tableView
        
        
        
    }
    
    @IBAction func goToOtherView(_ sender: Any) {
        self.presenter?.goToMoveViews()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.changed! {
            return self.presenter?.accounts?.count ?? 0
        } else {
            let filterAccounts = self.presenter?.accounts!.filter{ $0.isVisible == true }
            
            return filterAccounts?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "TableViewCellAllAccounts"
        var cell: TableViewCellAllAccounts! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableViewCellAllAccounts
        if cell == nil {
            tableView.register(UINib(nibName: "TableViewCellAllAccounts", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableViewCellAllAccounts
        }
        if self.changed! {
            let account = self.presenter?.accounts?[indexPath.row]
            cell.configureCell(accountName: account?.accountName, iban: account?.iban, balance: account!.accountBalanceInCents!)
        } else {
            let filterAccounts = self.presenter?.accounts!.filter{ $0.isVisible == true }
            
            let account = filterAccounts?[indexPath.row]
            cell.configureCell(accountName: account?.accountName, iban: account?.iban, balance: account!.accountBalanceInCents!)
        }
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @IBAction func filterTable(_ sender: Any) {
        if self.changed! {
            self.changed = false
        } else {
            self.changed = true
        }
        
        self.tableView.reloadData()
        
//         self.presenter.accounts = self.presenter.accounts.filter{ $0.isVisible == true }
    }
    
}
