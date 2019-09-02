//
//  MoveViewsInteractor.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol MoveViewsInteractorOutputProtocol: class
{

}

protocol MoveViewsInteractorInputProtocol: class
{
    var presenter: MoveViewsInteractorOutputProtocol? { get set }
}

class MoveViewsInteractor: NSObject ,  MoveViewsInteractorInputProtocol{
    
    var presenter: MoveViewsInteractorOutputProtocol?
    
    

}
