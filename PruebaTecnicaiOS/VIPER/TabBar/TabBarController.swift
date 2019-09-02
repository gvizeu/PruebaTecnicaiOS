//
//  TabBarRootTabBarController.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarViewProtocol {
    
    var tabIcon:UIImage { get }
    var tabTitle:String { get }
    
    func configuredViewController() -> UIViewController
}

protocol TabBarControllerProtocol: class {
    var presenter: TabBarPresenterProtocol? { get set }
}

class TabBarController: UITabBarController, TabBarControllerProtocol {
     var presenter: TabBarPresenterProtocol?
}
