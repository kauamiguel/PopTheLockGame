//
//  Lock.swift
//  PopTheLock
//
//  Created by Kaua Miguel on 10/07/23.
//

import SpriteKit

//Criando um spriteNode pois ele representa um nó imagem ou cor
class LockTop:SKSpriteNode{
    
    init(){
        let texture = SKTexture(imageNamed: "Lock_Top")
        super.init(texture: texture, color: .white, size: texture.size())
        name = "lock_top"
        position = CGPoint(x: 0, y: 100)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setScale(1.5)
        zPosition = -1
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//Criando um Node pois nesse caso, ele pode ser um tipo nó genérico (SHape, imagem, cor)
class LockBase: SKNode {
    let base:SKShapeNode!
    
    override init(){
        //Criando um node do tipo shape Circle
        base = SKShapeNode(circleOfRadius: 200)
        base.strokeColor = .gray
        base.fillColor = SKColor(red: 38.0/255, green: 38.0/255, blue: 38.0/255, alpha: 1.0)
        base.lineWidth = 30
        
        super.init()
        
        position = CGPoint(x: 0, y: -100)
        //Setando ele como 0 na hierarquia de profundidade
        zPosition = 0
        
        //Definir que o shape base é filho do container LockBase, que por sua vez será filho da scene
        addChild(base)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


