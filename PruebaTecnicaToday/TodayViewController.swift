//
//  TodayViewController.swift
//  PruebaTecnicaToday
//
//  Created by Gonzalo Vizeu on 06/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    var window: UIWindow?
    var rootWireframe: TabBarRootWireframe?
    
    
    var tabBarWireframe: TabBarWireframeProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.rootWireframe = TabBarRootWireframe.init(window: self.window!)
        
        
        var wireframes = [TabBarViewProtocol]()
        
        let allAccountsWireframe : AllAccountsWireframeProtocol = AllAccountsWireframe()
        wireframes.append(allAccountsWireframe as! TabBarViewProtocol)
        
        let visibleAccountsWireframe: VisibleAccountsWireframeProtocol = VisibleAccountsWireframe()
        wireframes.append(visibleAccountsWireframe as! TabBarViewProtocol)
        
        self.tabBarWireframe = TabBarWireframe.installIntoView(todayViewController: self, vc: self, wireFrames: wireframes)
        
        //self.view.addSubview((self.tabBarWireframe as! TabBarWireframe).rootWireframe)
        
        
//        self.vc = (self.allAccountsWireframe as! AllAccountsWireframe).configuredViewController()
//        self.view.addSubview(self.rootWireframe)
        // Do any additional setup after loading the view.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
       
        
        
        completionHandler(NCUpdateResult.newData)
    }
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
//        let VC = vc as! AllAccountsViewControllerProtocol
//        var totalheight: CGFloat = 0
//        for cell in VC.tableViewDelegate!.visibleCells {
//            totalheight += cell.bounds.height
//        }
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height:  maxSize.height) : maxSize
        
    }
    
}
