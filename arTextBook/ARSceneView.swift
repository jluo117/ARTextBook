//
//  ARSceneView.swift
//  arTextBook
//
//  Created by Max Gillespie on 9/7/19.
//  Copyright © 2019 james luo. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class ARSceneView: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the view's delegate
            sceneView.delegate = self
            
            // Show statistics such as fps and timing information
            sceneView.showsStatistics = true
            
            let sphere = SCNSphere(radius: 0.01)
            
            let hSphere = SCNSphere(radius: 0.007)
            
            let hOneNode = SCNNode(geometry: hSphere)
            hOneNode.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
            
            let hTwoNode = SCNNode(geometry: hSphere)
            hTwoNode.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
            
            let oxygenNode = SCNNode(geometry: sphere)
            oxygenNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            
            
            
            sceneView.session.add(anchor: self.getMainAnchor())
            sceneView.scene.rootNode.addChildNode(oxygenNode)
            oxygenNode.position = SCNVector3(0.0, 0.0, Float(-0.1))
            
            let tube = SCNTube(innerRadius: 0.001, outerRadius: 0.0015, height: 0.05)
            let OHbondOne = SCNNode(geometry: tube)
            OHbondOne.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            let OHbondTwo = SCNNode(geometry: tube)
            OHbondTwo.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            OHbondOne.position = SCNVector3(0.0, 0.025, -0.1)
            OHbondOne.pivot = SCNMatrix4MakeTranslation(0, -0.025, 0)
            OHbondOne.position.y = OHbondOne.position.y - 0.025
            OHbondTwo.position = SCNVector3(0.0, 0.025, -0.1)
            OHbondTwo.pivot = SCNMatrix4MakeTranslation(0, -0.025, 0)
            OHbondTwo.position.y = OHbondTwo.position.y - 0.025
            
            hOneNode.position = SCNVector3(0.0, 0.0, Float(-0.1))
            hTwoNode.position = SCNVector3(0.0, 0.0, Float(-0.1))
            
            sceneView.scene.rootNode.addChildNode(OHbondOne)
            sceneView.scene.rootNode.addChildNode(OHbondTwo)
            sceneView.scene.rootNode.addChildNode(hOneNode)
            sceneView.scene.rootNode.addChildNode(hTwoNode)
            
            let rotateAlongZAxis = SCNAction.rotateBy(x:0 , y: 0, z: -CGFloat(Float.pi/2), duration: 1)
            OHbondOne.runAction(rotateAlongZAxis)
            OHbondTwo.runAction(rotateAlongZAxis)
            
            let rotateOHBondOneAlongYAxis = SCNAction.rotateBy(x:CGFloat(self.degreesToRadians(degrees: 37.755)), y: 0, z: 0, duration: 1)
            let rotateOHBondTwoAlongYAxis = SCNAction.rotateBy(x:CGFloat(self.degreesToRadians(degrees: 142.205)), y: 0, z: 0, duration: 1)
            
            OHbondOne.runAction(rotateOHBondOneAlongYAxis)
            OHbondTwo.runAction(rotateOHBondTwoAlongYAxis)
            
            self.placeHOneAtom(hone: hOneNode)
            self.placeHTwoAtom(htwo: hTwoNode)
            
            
        }
        
        func placeHOneAtom(hone: SCNNode) {
            hone.position.x = hone.position.x - cos(self.degreesToRadians(degrees: 37.755)) * 0.05
            hone.position.z = hone.position.z + sin(self.degreesToRadians(degrees: 37.755)) * 0.05
        }
        
        func placeHTwoAtom(htwo: SCNNode) {
            htwo.position.x = htwo.position.x + cos(self.degreesToRadians(degrees: 37.755)) * 0.05
            htwo.position.z = htwo.position.z + sin(self.degreesToRadians(degrees: 37.755)) * 0.05
        }
        
        func degreesToRadians(degrees: Float) -> Float {
            return (degrees * .pi) / 180.0
        }
        
        func getMainAnchor() -> ARAnchor {
            // Creates an anchor at a distance 0.1m in front of you
            var anchorPosition = matrix_identity_float4x4
            anchorPosition.columns.3.z = -0.1
            let mainAnchor = ARAnchor(transform: anchorPosition)
            return mainAnchor
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()

            // Run the view's session
            sceneView.session.run(configuration)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // Pause the view's session
            sceneView.session.pause()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Release any cached data, images, etc that aren't in use.
        }

        // MARK: - ARSCNViewDelegate
        
    /*
        // Override to create and configure nodes for anchors added to the view's session.
        func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
            let node = SCNNode()
         
            return node
        }
    */
        
        func session(_ session: ARSession, didFailWithError error: Error) {
            // Present an error message to the user
            
        }
        
        func sessionWasInterrupted(_ session: ARSession) {
            // Inform the user that the session has been interrupted, for example, by presenting an overlay
            
        }
        
        func sessionInterruptionEnded(_ session: ARSession) {
            // Reset tracking and/or remove existing anchors if consistent tracking is required
            
        }
}
