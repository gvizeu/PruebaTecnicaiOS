//
//  VisibleAccountsPresenter.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol VisibleAccountsPresenterProtocol: class {
    var view: VisibleAccountsControllerProtocol? { get set }
    var interactor: VisibleAccountsInteractorInputProtocol? { get set }
    var wireFrame: VisibleAccountsWireframeProtocol? { get set }
    var accounts: [Account]? { get set }
    func getData()
}

class VisibleAccountsPresenter: VisibleAccountsPresenterProtocol, VisibleAccountsInteractorOutputProtocol {

    var view: VisibleAccountsControllerProtocol?
    var interactor: VisibleAccountsInteractorInputProtocol?
    var wireFrame: VisibleAccountsWireframeProtocol?

    var accounts: [Account]?

    func getData() {
        self.getDataAction()
    }

    func dataRecived(model: DataAccounts) {
        self.dataRecivedAction(model: model)
    }

    internal func getDataAction() {
        //request data
        self.interactor?.getVisibleAccountsDataAction(profile: "accounts", success: { model in
            print(model!)
        }, failure: {_ in
            print(Error.self)
        })
    }

    internal func dataRecivedAction(model: DataAccounts) {
        //filter data recived
        self.accounts = model.accounts.filter { $0.isVisible == true }
    }
}
