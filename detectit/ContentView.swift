//
//  ContentView.swift
//  detectit
//
//  Created by Larry Bonnette on 3/13/23.
//

import SwiftUI

struct ContentView : View {
    
    @State var planeDetected = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            ARViewContainer(planeDetected: $planeDetected)
            
            Text(planeDetected ? "Plane detected" : "No plane detected")
                .padding()
                .background(Color.black.opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(10)
            
        }
    }
}

