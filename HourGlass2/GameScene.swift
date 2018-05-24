//
//  GameScene.swift
//  HourGlass2
//
//  Created by Jake Johnson on 5/24/18.
//  Copyright © 2018 Jake Johnson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
//    private var lastUpdateTime : TimeInterval = 0
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
      private var hourGlass : SKShapeNode?
    
    
    override func sceneDidLoad(){

//        self.lastUpdateTime = 0
//
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        
        self.hourGlass = self.childNode(withName: "//hourGlass") as? SKShapeNode
        
//        self.hourGlass?.physicsBody = SKPhysicsBody(circleOfRadius: max(hourGlass?. / 2,
//                                                                        hourGlass.size.height / 2))
        //self.hourGlass?.physicsBody = SKPhysicsBody(
        
        self.hourGlass?.isHidden = true
        
        let triangle = SKShapeNode()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 50.0, y: 50.0))
        path.addLine(to: CGPoint(x: -50.0, y: 50.0))
        path.addLine(to: CGPoint(x: 0.0, y: 0.0))
        triangle.path = path
        triangle.lineWidth = 1.0
        triangle.strokeColor = UIColor.green
        
//        let physicsBodyPath = CGMutablePath()
//        physicsBodyPath.move(to: CGPoint(x: 0.0, y: -100.0))
//        physicsBodyPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
//        physicsBodyPath.addLine(to: CGPoint(x: -100.0, y: 100.0))
//        physicsBodyPath.addLine(to: CGPoint(x: 0.0, y: -100.0))
        
        triangle.physicsBody = SKPhysicsBody(polygonFrom: path)
//        triangle.physicsBody = SKPhysicsBody(
        //triangle.physicsBody = SKPhysicsBody(circleOfRadius: 300)
        
//        let physicsBodyPath = CGMutablePath()
//        physicsBodyPath.addLines(between: [CGPoint(x: -5, y: 37), CGPoint(x: 5, y: 37), CGPoint(x: 10, y: 20),
//                                CGPoint(x: 56, y: -5), CGPoint(x: 37, y: -35), CGPoint(x: 15, y: -30),
//                                CGPoint(x: 12, y: -37), CGPoint(x: -12, y: -37), CGPoint(x: -15, y: -30),
//                                CGPoint(x: -37, y: -35), CGPoint(x: -56, y: -5), CGPoint(x: -10, y: 20),
//                                CGPoint(x: -5, y: 37)])
//        physicsBodyPath.closeSubpath()
//        triangle.physicsBody = SKPhysicsBody(polygonFrom: physicsBodyPath)
        
        
        triangle.physicsBody?.affectedByGravity = true
        
        
        self.addChild(triangle)
          
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
        
        
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
        
        if let hourGlass = self.hourGlass {
            hourGlass.run(SKAction.init(named: "Spin")!)
        }
//
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//
//        // Initialize _lastUpdateTime if it has not already been
//        if (self.lastUpdateTime == 0) {
//            self.lastUpdateTime = currentTime
//        }
//
//        // Calculate time since last update
//        let dt = currentTime - self.lastUpdateTime
//
//        // Update entities
//        for entity in self.entities {
//            entity.update(deltaTime: dt)
//        }
//
//        self.lastUpdateTime = currentTime
    }
}
