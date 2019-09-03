//
//  VisibleAccountsWireframe.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit
protocol VisibleAccountsWireframeProtocol: class {
    static func presentVisibleAccountsModule(fromView view: AnyObject)

}
class VisibleAccountsWireframe: TabBarViewProtocol, VisibleAccountsWireframeProtocol {
    var tabIcon: UIImage = UIImage(named: "Module2Image")!
    var tabTitle: String = NSLocalizedString("visible_accounts", comment: "visible_accounts")

    func configuredViewController() -> UIViewController {
        let presenter: VisibleAccountsPresenterProtocol & VisibleAccountsInteractorOutputProtocol = VisibleAccountsPresenter()
        let interactor: VisibleAccountsInteractorInputProtocol = VisibleAccountsInteractor()
        let view = VisibleAccountsViewController(nibName: "VisibleAccountsViewController", bundle: nil)

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view as UIViewController
    }

    static func presentVisibleAccountsModule(fromView view: AnyObject) {
        let presenter: VisibleAccountsPresenterProtocol & VisibleAccountsInteractorOutputProtocol = VisibleAccountsPresenter()
        let interactor: VisibleAccountsInteractorInputProtocol = VisibleAccountsInteractor()
        let wireFrame: VisibleAccountsWireframeProtocol = VisibleAccountsWireframe()

        let view = VisibleAccountsViewController(nibName: "VisibleAccountsViewController", bundle: nil)

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
    }

}
