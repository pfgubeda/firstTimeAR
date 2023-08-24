//
//  CustomARViewRepresentable.swift
//  firstTimeAR
//
//  Created by Pablo Fernandez Gonzalez on 24/8/23.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    func updateUIView(_ uiView: CustomARView, context: Context) { }
}
