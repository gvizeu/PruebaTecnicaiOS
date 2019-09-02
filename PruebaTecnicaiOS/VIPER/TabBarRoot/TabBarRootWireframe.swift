//
//  TabBarRootWireframe.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Javier Vizeu on 26/06/2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit

class TabBarRootWireframe: NSObject
{
    var window: UIWindow!
    var tabBarWireframe: TabBarWireframeProtocol?
    
    init(window: UIWindow)
    {
        super.init()
        self.window = window
        
        // custom initialization
    }
    
    func installViewIntoRootViewController(){
        
        var wireframes = [TabBarViewProtocol]()
        
        //Add views to TabBar
        
        let allAccountsWireframe : AllAccountsWireframeProtocol = AllAccountsWireframe()
        wireframes.append(allAccountsWireframe as! TabBarViewProtocol)
        
        let visibleAccountsWireframe: VisibleAccountsWireframeProtocol = VisibleAccountsWireframe()
        wireframes.append(visibleAccountsWireframe as! TabBarViewProtocol)
        
        
        self.tabBarWireframe = TabBarWireframe.installIntoWindow(rootWireFrame: self, window: self.window, wireFrames: wireframes)
    }
}
