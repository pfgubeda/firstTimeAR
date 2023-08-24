//
//  ARManager.swift
//  firstTimeAR
//
//  Created by Pablo Fernandez Gonzalez on 24/8/23.
//

import Combine

class ARManager{
    static let shared = ARManager()
    private init(){}
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}
