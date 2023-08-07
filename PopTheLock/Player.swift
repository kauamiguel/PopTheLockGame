//
//  Player.swift
//  PopTheLock
//
//  Created by Kaua Miguel on 10/07/23.
//

import SpriteKit

enum ColisionType:UInt32{
    case player = 1
    case collectible = 2
}

class Player:SKNode{
    
    let ticker:SKSpriteNode!
    var ready = false
    var velocity = CGFloat(-1)
    
    override init() {
        
        let texture = SKTexture(imageNamed: "Lock_Player")
        ticker = SKSpriteNode(texture: texture, color: .white, size: texture.size())
        ticker.position = CGPoint(x: 0, y: 150)
        ticker.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ticker.setScale(0.80)
        ticker.zPosition = 2
        ticker.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        //IsDynamic é um boleano que diz se um corpo é afetado pela simulação fisica
        ticker.physicsBody?.isDynamic = true
        ticker.physicsBody?.affectedByGravity = false
        ticker.physicsBody?.categoryBitMask = ColisionType.player.rawValue
        ticker.physicsBody?.collisionBitMask = 0
        ticker.physicsBody?.contactTestBitMask = ColisionType.collectible.rawValue
        
        super.init()
        
        addChild(ticker)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


