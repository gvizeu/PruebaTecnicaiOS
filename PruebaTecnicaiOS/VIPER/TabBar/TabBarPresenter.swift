//
//  TabBarRootPresenter.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol TabBarPresenterProtocol: class {
    var view: TabBarControllerProtocol? { get set }
    var interactor: TabBarInteractorInputProtocol? { get set }
    var wireFrame: TabBarWireframeProtocol? { get set }
}

class TabBarPresenter: TabBarPresenterProtocol, TabBarInteractorOutputProtocol {
    var view: TabBarControllerProtocol?
    
    var interactor: TabBarInteractorInputProtocol?
    
    var wireFrame: TabBarWireframeProtocol?
    

}
