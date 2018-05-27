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
    
    private var hourGlass : SKShapeNode?
    private var sand : SKShapeNode?
    private var testBlock : SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("contacted")
        
    }
    
    override func sceneDidLoad(){
        
        // set paths for hourglass shape and physics body
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
        //let physicsBodypath = CGPath(
        physicsBodypath.move(to: CGPoint(x: -18.0, y: 30.0))
        physicsBodypath.addLine(to: CGPoint(x: -150.0, y: 300.0))
        physicsBodypath.addLine(to: CGPoint(x: 150.0, y: 300.0))
        physicsBodypath.addLine(to: CGPoint(x: 18.0, y: 30.0))
        physicsBodypath.addLine(to: CGPoint(x: 18.0, y: -30.0))
        physicsBodypath.addLine(to: CGPoint(x: 150.0, y: -300.0))
        physicsBodypath.addLine(to: CGPoint(x: -150.0, y: -300.0))
        physicsBodypath.addLine(to: CGPoint(x: -18.0, y: -30.0))
        physicsBodypath.addLine(to: CGPoint(x: -18.0, y: 30.0))
//        physicsBodypath.addLine(to: CGPoint(x: -150.0, y: 300.0))
//        physicsBodypath.addLine(to: CGPoint(x: 150.0, y: 300.0))
//        physicsBodypath.addLine(to: CGPoint(x: 18.0, y: 30.0))
//        physicsBodypath.addLine(to: CGPoint(x: 18.0, y: -30.0))
//        physicsBodypath.addLine(to: CGPoint(x: 150.0, y: -300.0))
//        physicsBodypath.addLine(to: CGPoint(x: -150.0, y: -300.0))
//        physicsBodypath.addLine(to: CGPoint(x: -18.0, y: -30.0))
        //physicsBodypath.closeSubpath()

        ///////////////////// end setting paths ///////////////////////////

        testBlock = SKShapeNode(rect: CGRect(x: -200, y: -200, width: 500, height: 700))
        testBlock?.lineWidth = 2.0
        testBlock?.strokeColor = UIColor.green
        //testBlock?.alpha = 0
        
        // set hourglass shape
        hourGlass = SKShapeNode.init(path: path)
        
        hourGlass?.lineWidth = 1.0
        hourGlass?.strokeColor = UIColor.red
        //hourGlass?.xScale = 4.0
        //hourGlass?.yScale = 4.0
        hourGlass?.alpha = 0
        
        
        // set sand shape
        let sandRadius = CGFloat(10.0)
        let sandPosition = CGFloat(0)
        sand = SKShapeNode.init(circleOfRadius: sandRadius)
        sand?.position = CGPoint(x: 0, y: 0)
        sand?.lineWidth = 1.0
        sand?.strokeColor = UIColor.purple
        
        // hide sand shape
        sand?.alpha = 0

//        //spawn all the sand
//        for i in 1...10 {
//
//            sandPosition = sandPosition + 22
//            sand = SKShapeNode.init(circleOfRadius: sandRadius)
//            sand?.position = CGPoint(x: sandPosition, y: 250)
//            sand?.lineWidth = 1.0
//            sand?.strokeColor = UIColor.purple
//
//            sand?.physicsBody = SKPhysicsBody(circleOfRadius: sandRadius)
//
//            //            sand?.physicsBody?.affectedByGravity = false
//
//            self.addChild(sand!)
//
//        }
        
//        var sandPositionRow2 = CGFloat(-108.0)
//
//        for i in 1...8 {
//
//            sandPositionRow2 = sandPositionRow2 + 22
//            sand = SKShapeNode.init(circleOfRadius: sandRadius)
//            sand?.position = CGPoint(x: sandPositionRow2, y: 228)
//            sand?.lineWidth = 1.0
//            sand?.strokeColor = UIColor.purple
//
//            sand?.physicsBody = SKPhysicsBody(circleOfRadius: sandRadius)
//
//            //            sand?.physicsBody?.affectedByGravity = false
//
//            self.addChild(sand!)
//
//        }
//
//        var sandPositionRow3 = CGFloat(-80.0)
//
//        for i in 1...6 {
//
//            sandPositionRow3 = sandPositionRow3 + 22
//            sand = SKShapeNode.init(circleOfRadius: sandRadius)
//            sand?.position = CGPoint(x: sandPositionRow3, y: 200)
//            sand?.lineWidth = 1.0
//            sand?.strokeColor = UIColor.purple
//
//            sand?.physicsBody = SKPhysicsBody(circleOfRadius: sandRadius)
//
//            //            sand?.physicsBody?.affectedByGravity = false
//
//            self.addChild(sand!)
//
//        }
//
//        var sandPositionRow4 = CGFloat(-58.0)
//
//        for i in 1...4 {
//
//            sandPositionRow4 = sandPositionRow4 + 22
//            sand = SKShapeNode.init(circleOfRadius: sandRadius)
//            sand?.position = CGPoint(x: sandPositionRow4, y: 178)
//            sand?.lineWidth = 1.0
//            sand?.strokeColor = UIColor.purple
//
//            sand?.physicsBody = SKPhysicsBody(circleOfRadius: sandRadius)
//
//            //            sand?.physicsBody?.affectedByGravity = false
//            self.addChild(sand!)
//
//        }
    ///////////////////////// end sand spawning ///////////////////////////////
        
        
        // set hourglass physics body
        hourGlass?.physicsBody = SKPhysicsBody(edgeChainFrom: physicsBodypath)
        //hourGlass?.physicsBody = SKPhysicsBody(polygonFrom: path)
        hourGlass?.physicsBody?.categoryBitMask = hourGlassCategory
        hourGlass?.physicsBody?.collisionBitMask = sandCategory
        //hourGlass?.physicsBody = SKPhysicsBody(edgeChainFrom: physicsBodypath)
        hourGlass?.physicsBody?.isDynamic = false
        //hourGlass?.physicsBody?.affectedByGravity = false
        

        // set sand physics body
        sand?.physicsBody = SKPhysicsBody(circleOfRadius: sandRadius)
        sand?.physicsBody?.isDynamic = true
        sand?.physicsBody?.categoryBitMask = sandCategory
        //sand?.physicsBody?.contactTestBitMask = hourGlassCategory | sandCategory
        sand?.physicsBody?.collisionBitMask = 3
        sand?.physicsBody?.usesPreciseCollisionDetection = true

        
        //testBlock?.physicsBody = SKPhysicsBody(rectangleOf: testBlock., center: CGPoint(x: 0, y: 0))
        testBlock?.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -200, y: -200, width: 500, height: 700))
        testBlock?.physicsBody?.categoryBitMask = 3
        testBlock?.physicsBody?.collisionBitMask = sandCategory
        testBlock?.physicsBody?.isDynamic = false
        
        // add hourglass and sand nodes to scene
        //self.addChild(hourGlass!)
        self.addChild(sand!)
        self.addChild(testBlock!)

        
        // fade in hourglass
        //hourGlass?.run(SKAction.fadeIn(withDuration: 1.5))
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
        
        if let testBlock = self.testBlock{
            testBlock.run(SKAction.rotate(byAngle: CGFloat(Float.pi), duration: 3.5))
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
