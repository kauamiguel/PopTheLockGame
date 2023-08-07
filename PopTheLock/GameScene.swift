//
//  GameScene.swift
//  PopTheLock
//
//  Created by Kaua Miguel on 10/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var startTime = Date.now
    var endTime = Date.now
    
    var firstContact = Date.now
    var lastFirstContact = 0.0
    var lastEndContact = Date.now
    var lastEndContactTime = 0.0
    
    let lockTop = LockTop()
    let lockBase = LockBase()
    let label = Label()
    let labelBg = LabelBackgorund()
    let player = Player()
    let collectible = Collitble()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        lockBase.addChild(label)
        lockBase.addChild(labelBg)
        lockBase.addChild(player)
        lockBase.addChild(collectible)
        addChild(lockTop)
        addChild(lockBase)
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.zRotation += 0.03 * player.velocity
    }
}

extension GameScene: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        
        lastFirstContact = Date.now.timeIntervalSince(firstContact)
        
        if lastFirstContact < 1 {return}
        
        print("CONTATO")
        
        firstContact = Date.now
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
        lastEndContactTime = Date.now.timeIntervalSince(lastEndContact)
        
        if lastEndContactTime < 1 {return}
        
        player.ready = false
        
        print("CONTATO ACABOU")
        
        lastEndContact = Date.now
        
        
    }
}
