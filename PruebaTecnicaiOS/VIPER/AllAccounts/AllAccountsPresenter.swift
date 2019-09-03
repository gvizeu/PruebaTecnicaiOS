//
//  AllAccountsPresenter.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol AllAccountsPresenterProtocol: class {
    var view: AllAccountsViewControllerProtocol? { get set }
    var interactor: AllAccountsInteractorInputProtocol? { get set }
    var wireFrame: AllAccountsWireframeProtocol? { get set }

    var accounts: [Account]? { get set }

    func getData()

    func goToMoveViews()
}

class AllAccountsPresenter: NSObject, AllAccountsPresenterProtocol, AllAccountsInteractorOutputProtocol {

    var view: AllAccountsViewControllerProtocol?
    var interactor: AllAccountsInteractorInputProtocol?
    var wireFrame: AllAccountsWireframeProtocol?

    var accounts: [Account]?

    func getData() {
        self.getDataAction()
    }

    func dataRecived(model: DataAccounts) {
        self.dataRecivedAction(model: model)
    }

    func goToMoveViews() {
        self.goToMoveViewsAction()
    }

    internal func getDataAction() {
        //request data
        self.interactor?.getAllAccountsDataAction(profile: "accounts", success: { model in
            print(model!)
        }, failure: {_ in
            print(Error.self)
        })
    }

    internal func dataRecivedAction(model: DataAccounts) {

        self.accounts = model.accounts
    }

    private func goToMoveViewsAction() {
        self.wireFrame?.goToMoveViews()
    }

}
