//
//  MoveViewsWireframe.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol MoveViewsWireframeProtocol: class {

}
class MoveViewsWireframe: MoveViewsWireframeProtocol {
    // swiftlint:disable force_cast line_length
    static func instantiate() -> MoveViewsViewController {
        return UIStoryboard(name: "MoreViews", bundle: nil).instantiateViewController(withIdentifier: "MoveViewsViewController") as! MoveViewsViewController
    }
    // swiftlint:enable force_cast
     func configuredViewController() -> UIViewController {
        let presenter: MoveViewsPresenterProtocol & MoveViewsInteractorOutputProtocol = MoveViewsPresenter()
        let interactor: MoveViewsInteractorInputProtocol = MoveViewsInteractor()
        let view = MoveViewsWireframe.instantiate()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view as UIViewController
    }
}
