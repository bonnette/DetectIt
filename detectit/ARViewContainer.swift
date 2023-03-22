//
//  ARViewContainer.swift
//  detectit
//
//  Created by Larry Bonnette on 3/13/23.
//

import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var planeDetected: Bool
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        
        arView.session.delegate = context.coordinator
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
            super.init()
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                if anchor is ARPlaneAnchor {
                    // A horizontal plane is detected
                    parent.planeDetected = true
                }
            }
        }
        
        func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
            for anchor in anchors {
                if anchor is ARPlaneAnchor {
                    // A horizontal plane is no longer detected
                    parent.planeDetected = false
                }
            }
        }
    }
}
