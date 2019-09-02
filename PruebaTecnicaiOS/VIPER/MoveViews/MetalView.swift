//
//  MetalView.swift
//  PruebaTecnicaiOS
//
//  Created by Gonzalo Vizeu on 07/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import MetalKit

class MetalView: MTKView {
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        // Make sure we are on a device that can run metal!
        guard let defaultDevice = MTLCreateSystemDefaultDevice() else {

            fatalError("Device loading error")
        }
        device = defaultDevice
        colorPixelFormat = .bgra8Unorm
        // Our clear color, can be set to any color
        clearColor = MTLClearColor(red: 0.1, green: 0.57, blue: 0.25, alpha: 1)
        
        createRenderer(device: defaultDevice)
    }
    

    
    func createRenderer(device: MTLDevice){
        renderer = Renderer(device: device)
        delegate = renderer
    }
}
