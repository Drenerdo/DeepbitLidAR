//
//  ViewController.swift
//  DeepbitLidAR
//
//  Created by Deepbit Labs on 2/22/21.
//

import UIKit
import RealityKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        arView.environment.sceneUnderstanding.options = []
        
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        
        arView.environment.sceneUnderstanding.options.insert(.physics)
        
        arView.debugOptions.insert(.showSceneUnderstanding)
        
        arView.automaticallyConfigureSession = false
        let configuration = ARWorldTrackingConfiguration()
        configuration.sceneReconstruction = .meshWithClassification
        
        configuration.environmentTexturing = .automatic
        arView.session.run(configuration)
        
        
    }
}
