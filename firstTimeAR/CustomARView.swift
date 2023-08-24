//
//  CustomARView.swift
//  firstTimeAR
//
//  Created by Pablo Fernandez Gonzalez on 24/8/23.
//

import ARKit
import Combine
import SwiftUI
import RealityKit

class CustomARView: ARView {
    required init (frame frameRect: CGRect){
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init (coder:) has not been implemented yet")
    }
    
    // the init actually used
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        
        placeCity()
    }
    
    
    func placeCity(){
        // Load the city from FirstTryExperience, force try not recommended
        let cityAnchor = try! FirstTryExperience.loadCity()
        
        // Add the firstTryExperience anchor to the scene
        scene.addAnchor(cityAnchor)
    }
}
