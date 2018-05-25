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
    
    let hourGlassCategory: UInt32 = 0x1 << 0
    let sandCategory: UInt32 = 0x1 << 1
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
//    private var lastUpdateTime : TimeInterval = 0
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
      private var hourGlass : SKShapeNode?
      private var sand : SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("contacted")
        
    }
    
    override func sceneDidLoad(){
        
        
//        let hourGlassTexture = SKTexture(imageNamed: "hourglass-sprite")
//
//        let hourGlass = SKSpriteNode(texture: hourGlassTexture)
//
//        hourGlass.physicsBody = SKPhysicsBody(texture: hourGlassTexture, size: CGSize(width: hourGlass.size.width, height: hourGlass.size.height))
////        texturedSpaceShip.physicsBody = SKPhysicsBody(texture: spaceShipTexture,
////                                                      size: CGSize(width: circularSpaceShip.size.width,
////                                                                   height: circularSpaceShip.size.height))

//        self.addChild(hourGlass)

//        self.lastUpdateTime = 0
//
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        //self.physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        
        //self.hourGlass = self.childNode(withName: "//hourGlass") as? SKShapeNode
        
//        self.hourGlass?.physicsBody = SKPhysicsBody(circleOfRadius: max(hourGlass?. / 2,
//                                                                        hourGlass.size.height / 2))
        //self.hourGlass?.physicsBody = SKPhysicsBody(
        
        //self.hourGlass?.isHidden = true
        
//        let triangle = SKShapeNode()
//        let path = CGMutablePath()
//        path.move(to: CGPoint(x: 0.0, y: 0.0))
//        path.addLine(to: CGPoint(x: 50.0, y: 50.0))
//        path.addLine(to: CGPoint(x: -50.0, y: 50.0))
//        path.addLine(to: CGPoint(x: 0.0, y: 0.0))
//        triangle.path = path
//        triangle.lineWidth = 1.0
//        triangle.strokeColor = UIColor.green
        
//        var testBlock = SKShapeNode.init(rectOf: CGSize.init(width: 50, height: 50), cornerRadius: 50 * 0.3)
//
//        testBlock.lineWidth = 2.0
//
//        testBlock.position = CGPoint(x: 100, y: 100)
//
//        testBlock.alpha = 0
//
//        self.addChild(testBlock)
//
//        testBlock.run(SKAction.fadeIn(withDuration: 5.0))
        
        let sandRadius = CGFloat(10.0)
        
        sand = SKShapeNode.init(circleOfRadius: sandRadius)
        
        sand?.position = CGPoint(x: 30, y: 100)
        sand?.lineWidth = 1.0
        sand?.strokeColor = UIColor.purple
        
        sand?.physicsBody = SKPhysicsBody(circleOfRadius: sandRadius)
        
        self.addChild(sand!)
        
        //sand?.physicsBody?.isDynamic = true
        
        //sand?.physicsBody?.usesPreciseCollisionDetection = true
        //sand?.physicsBody?.categoryBitMask = sandCategory
        sand?.physicsBody?.collisionBitMask = sandCategory
        
        
        //var hourGlass = SKShapeNode()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: -15.0, y: 30.0))
        path.addLine(to: CGPoint(x: -150.0, y: 300.0))
        path.addLine(to: CGPoint(x: 150.0, y: 300.0))
        path.addLine(to: CGPoint(x: 15.0, y: 30.0))
        path.addLine(to: CGPoint(x: 15.0, y: -30.0))
        path.addLine(to: CGPoint(x: 150.0, y: -300.0))
        path.addLine(to: CGPoint(x: -150.0, y: -300.0))
        path.addLine(to: CGPoint(x: -15.0, y: -30.0))
        path.addLine(to: CGPoint(x: -15.0, y: 30.0))
        path.closeSubpath()
        
        let physicsBodypath = CGMutablePath()
        physicsBodypath.move(to: CGPoint(x: -15.0, y: 30.0))
        physicsBodypath.addLine(to: CGPoint(x: -150.0, y: 300.0))
        physicsBodypath.addLine(to: CGPoint(x: 150.0, y: 300.0))
        physicsBodypath.addLine(to: CGPoint(x: 15.0, y: 30.0))
        physicsBodypath.addLine(to: CGPoint(x: 15.0, y: -30.0))
        physicsBodypath.addLine(to: CGPoint(x: 150.0, y: -300.0))
        physicsBodypath.addLine(to: CGPoint(x: -150.0, y: -300.0))
        physicsBodypath.addLine(to: CGPoint(x: -15.0, y: -30.0))
        physicsBodypath.addLine(to: CGPoint(x: -15.0, y: 30.0))
        physicsBodypath.addLine(to: CGPoint(x: -150.0, y: 300.0))

        physicsBodypath.closeSubpath()

        hourGlass = SKShapeNode.init(path: path)

        hourGlass?.physicsBody?.isDynamic = false
        hourGlass?.physicsBody?.usesPreciseCollisionDetection = true
        hourGlass?.physicsBody?.categoryBitMask = sandCategory
        hourGlass?.physicsBody?.contactTestBitMask = hourGlassCategory | sandCategory
        
        hourGlass?.lineWidth = 2.0
        hourGlass?.strokeColor = UIColor.red
        //hourGlass?.xScale = 4.0
        //hourGlass?.yScale = 4.0

        hourGlass?.alpha = 0

        self.addChild(hourGlass!)

        //hourGlass?.run(SKAction.fadeIn(withDuration: 1.5))
        
        //hourGlass?.physicsBody = SKPhysicsBody(polygonFrom: path)
        hourGlass?.physicsBody = SKPhysicsBody(edgeChainFrom: physicsBodypath)
        
        hourGlass?.physicsBody?.affectedByGravity = false
        

        //hourGlass.run(SKAction.rotate(byAngle: 90.0, duration: 3.0))
        
        //self.hourGlass?.run(SKAction.fadeIn(withDuration: 3))
        
//        let physicsBodyPath = CGMutablePath()
//        physicsBodyPath.move(to: CGPoint(x: 0.0, y: -100.0))
//        physicsBodyPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
//        physicsBodyPath.addLine(to: CGPoint(x: -100.0, y: 100.0))
//        physicsBodyPath.addLine(to: CGPoint(x: 0.0, y: -100.0))
        
        //triangle.physicsBody = SKPhysicsBody(polygonFrom: path)
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
        
        
        //triangle.physicsBody?.affectedByGravity = true
        
        
        //self.addChild(triangle)
          
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
        
//        if let hourGlass = self.hourGlass {
//            hourGlass.run(SKAction.init(named: "Spin")!)
//        }
        
        //hourGlass?.run(SKAction.init(named: "Spin")!)
        
        //hourGlass?.run(SKAction.rotate(byAngle: 10.0, duration: 3.0))
        
        if let hourGlass = self.hourGlass{
            hourGlass.run(SKAction.rotate(byAngle: CGFloat(Float.pi), duration: 3.5))
        }
        
        
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
