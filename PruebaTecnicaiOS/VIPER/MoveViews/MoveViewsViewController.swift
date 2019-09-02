//
//  AllAcountsViewController.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit
protocol MoveViewsViewControllerProtocol: class
{
    var presenter: MoveViewsPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

class MoveViewsViewController: UIViewController, MoveViewsViewControllerProtocol{
    
    var presenter: MoveViewsPresenterProtocol?
    var changed: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
