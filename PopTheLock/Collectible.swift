//
//  Collectible.swift
//  PopTheLock
//
//  Created by Kaua Miguel on 10/07/23.
//

import SpriteKit


class Collitble:SKSpriteNode{
    
    let spriteRadius: CGFloat!
    let adjustedRadius: CGFloat!
    var lastAngle = CGFloat(270)
    var currentAngle = CGFloat(270)
    
    init(){
        let texture = SKTexture(imageNamed: "Orange")
        spriteRadius = texture.size().width / 2
        adjustedRadius = 200 - 19 - spriteRadius
        
        super.init(texture: texture, color: .white, size: texture.size())
        
        zPosition = 1
        self.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.isDynamic = false
        physicsBody?.allowsRotation = false
        physicsBody?.affectedByGravity = false
        physicsBody?.categoryBitMask = ColisionType.collectible.rawValue
        physicsBody?.collisionBitMask = 0
        physicsBody?.contactTestBitMask = ColisionType.player.rawValue
        randomPosition()
    }
    
    func randomPosition(){
        lastAngle = currentAngle
        currentAngle = CGFloat.random(in: 0...360 )
        let adjustedAngle = currentAngle * .pi / 180
        
        let x  = cos(adjustedAngle) * adjustedRadius
        let y = sin(adjustedAngle) * adjustedRadius
        position = CGPoint(x: x, y: y)
    }
    
    func opositePosition(){
        lastAngle =  currentAngle
        currentAngle = lastAngle + 180
        
        let adjustedAngle = currentAngle * .pi/180
        
        let x = sin(adjustedAngle) * adjustedAngle
        let y = cos(adjustedAngle) * adjustedAngle
        
        
        position = CGPoint(x: x, y: y)
    }
    
    func setClosePosition(playerVelocity:CGFloat){
         lastAngle = currentAngle
        let nextAngle = CGFloat.random(in: 60...180)
        
        
        if playerVelocity == -1{
            //Sentido horario
            currentAngle = lastAngle - nextAngle
        }else{
            //Sentido antiHoraio
            currentAngle = lastAngle +  nextAngle
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


