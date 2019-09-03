//
//  AllAccountsWireframe.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol AllAccountsWireframeProtocol: class {
    static func presentAllAccountsModule(fromView view: AnyObject)

    func goToMoveViews()
}
class AllAccountsWireframe: TabBarViewProtocol, AllAccountsWireframeProtocol {

    var presenter: TabBarPresenterProtocol?

    var view: AllAccountsViewController?

    var tabIcon: UIImage = UIImage(named: "Module1Image")!
    var tabTitle: String = NSLocalizedString("all_accounts", comment: "all_accounts")

    static func presentAllAccountsModule(fromView view: AnyObject) {

        let presenter: AllAccountsPresenterProtocol & AllAccountsInteractorOutputProtocol = AllAccountsPresenter()
        let interactor: AllAccountsInteractorInputProtocol = AllAccountsInteractor()
        let wireFrame: AllAccountsWireframeProtocol = AllAccountsWireframe()

        let view = AllAccountsViewController(nibName: "AllAccountsViewController", bundle: nil)

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter

    }

     func configuredViewController() -> UIViewController {
        let presenter: AllAccountsPresenterProtocol & AllAccountsInteractorOutputProtocol = AllAccountsPresenter()
        let interactor: AllAccountsInteractorInputProtocol = AllAccountsInteractor()
        self.view = AllAccountsViewController(nibName: "AllAccountsViewController", bundle: nil)

        // Connecting
        self.view?.presenter = presenter
        presenter.view = self.view
        presenter.wireFrame = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        return self.view!
    }
    func goToMoveViews() {
        let moveViewsWireframe: MoveViewsWireframeProtocol = MoveViewsWireframe()
        self.view?.navigationController?.pushViewController((moveViewsWireframe as! MoveViewsWireframe).configuredViewController(), animated: false)

    }
}
