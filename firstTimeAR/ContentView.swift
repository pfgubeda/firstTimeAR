//
//  ContentView.swift
//  firstTimeAR
//
//  Created by Pablo Fernandez Gonzalez on 24/8/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    var body: some View {
        CustomARViewRepresentable()
            .ignoresSafeArea()
            .overlay(alignment: .bottom){
                ScrollView(.horizontal){
                    HStack {
                        Button {
                            ARManager.shared.actionStream.send(.removeCity)
                        }label: {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                        }
                        Button {
                            ARManager.shared.actionStream.send(.placeCity)
                        }label: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                        }
                    }
                }
            }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
