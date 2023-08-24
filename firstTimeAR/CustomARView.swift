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
    
    private var cityAlreadyPlaced : Bool
    
    
    required init (frame frameRect: CGRect){
        self.cityAlreadyPlaced = false
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init (coder:) has not been implemented yet")
    }
    
    // the init actually used
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        subscribeToActionStream()
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    func subscribeToActionStream() {
        ARManager.shared
            .actionStream
            .sink{[weak self] action in
                switch action{
                case .placeCity:
                    self?.placeCity()
                case .removeCity:
                    self?.removeCity()
                }
            }
            .store(in: &cancellables)
    }
    

    
    func placeCity(){
        
        if(cityAlreadyPlaced == true){
            removeCity()
        }
        // Load the city from FirstTryExperience, force try not recommended
        let cityAnchor = try! FirstTryExperience.loadCity()
        
        // Add the firstTryExperience anchor to the scene
        scene.addAnchor(cityAnchor)
        cityAlreadyPlaced = true
    }
    
    func removeCity(){
        scene.anchors.removeAll()
        cityAlreadyPlaced = false
    }
}
