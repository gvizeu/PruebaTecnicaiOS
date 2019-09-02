//
//  MoveViewsPresenter.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol MoveViewsPresenterProtocol: class
{
    var view: MoveViewsViewControllerProtocol? { get set }
    var interactor: MoveViewsInteractorInputProtocol? { get set }
    var wireFrame: MoveViewsWireframeProtocol? { get set }
    
    
}

class MoveViewsPresenter: NSObject, MoveViewsPresenterProtocol, MoveViewsInteractorOutputProtocol {
    
    var view: MoveViewsViewControllerProtocol?
    var interactor: MoveViewsInteractorInputProtocol?
    var wireFrame: MoveViewsWireframeProtocol?
    

}
