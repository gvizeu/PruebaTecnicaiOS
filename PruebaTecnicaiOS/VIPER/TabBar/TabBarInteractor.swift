//
//  TabBarRootInteractor.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol TabBarInteractorOutputProtocol: class
{
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol TabBarInteractorInputProtocol: class
{
    var presenter: TabBarInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}

class TabBarInteractor: TabBarInteractorInputProtocol {
    var presenter: TabBarInteractorOutputProtocol?
    

}
