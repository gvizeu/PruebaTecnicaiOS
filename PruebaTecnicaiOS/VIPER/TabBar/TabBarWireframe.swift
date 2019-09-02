//
//  TabBarRootWireframe.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 25/06/2019.
//  Copyright © 2019. All rights reserved.
//

import UIKit

protocol TabBarWireframeProtocol: class
{
    static func installIntoWindow(rootWireFrame: TabBarRootWireframe, window: UIWindow, wireFrames:[TabBarViewProtocol]) -> TabBarWireframeProtocol
        var rootWireframe: TabBarRootWireframe? { get set }
    static func installIntoView(todayViewController: TodayViewController, vc: UIViewController, wireFrames:[TabBarViewProtocol]) -> (TabBarWireframeProtocol)
    var today: TodayViewController? { get set }
}

class TabBarWireframe: TabBarWireframeProtocol {

    var rootWireframe: TabBarRootWireframe?
    var today: TodayViewController?
    
    static func installIntoWindow(rootWireFrame: TabBarRootWireframe, window: UIWindow, wireFrames:[TabBarViewProtocol]) -> TabBarWireframeProtocol{
        
        
         let view = TabBarController(nibName:"TabBarControllerView", bundle: nil)
        
        let presenter: TabBarPresenterProtocol & TabBarInteractorOutputProtocol = TabBarPresenter()
        let interactor: TabBarInteractorInputProtocol = TabBarInteractor()
        let wireFrame: TabBarWireframeProtocol = TabBarWireframe()
        
        wireFrame.rootWireframe = rootWireFrame
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        
        var viewControllers = [UIViewController]()
        
        for wireFrame in wireFrames {
            
            let tabBarItem = UITabBarItem()
            tabBarItem.image = wireFrame.tabIcon
            tabBarItem.title = wireFrame.tabTitle
            let viewController = wireFrame.configuredViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = tabBarItem
            navigationController.setNavigationBarHidden(false, animated: false)
            navigationController.title = wireFrame.tabTitle
            viewControllers.append(navigationController)
        }
        
        //installing tabBarController into window
        //rest interactions can be done VIPER way
        let tabBarController = view as UITabBarController
        tabBarController.viewControllers = viewControllers
        tabBarController.navigationController?.isNavigationBarHidden = true;
        window.rootViewController = tabBarController
        
        return wireFrame
    }
    
    static func installIntoView(todayViewController: TodayViewController, vc: UIViewController, wireFrames:[TabBarViewProtocol]) -> (TabBarWireframeProtocol){
        
        
        let view = TabBarController(nibName:"TabBarControllerView", bundle: nil)
        
        let presenter: TabBarPresenterProtocol & TabBarInteractorOutputProtocol = TabBarPresenter()
        let interactor: TabBarInteractorInputProtocol = TabBarInteractor()
        let wireFrame: TabBarWireframeProtocol = TabBarWireframe()
        
        wireFrame.today = todayViewController
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        
        var viewControllers = [UIViewController]()
        
        for wireFrame in wireFrames {
            
            let tabBarItem = UITabBarItem()
            tabBarItem.image = wireFrame.tabIcon
            tabBarItem.title = wireFrame.tabTitle
            let viewController = wireFrame.configuredViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = tabBarItem
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.title = wireFrame.tabTitle
            viewControllers.append(navigationController)

        }
        
        //installing tabBarController into window
        //rest interactions can be done VIPER way
        let tabBarController = view as UITabBarController
        tabBarController.viewControllers = viewControllers
        tabBarController.navigationController?.isNavigationBarHidden = true;
        vc.view.addSubview(tabBarController.view)
        
        return wireFrame
    }
}
