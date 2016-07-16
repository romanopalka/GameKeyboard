//
//  GameScene.swift
//  GameKeyboard
//
//  Created by Roman on 7/16/16.
//  Copyright (c) 2016 Roman. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var keyboardHeight : CGFloat!
    var spriteSquare: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        
        let screenSize = UIScreen.mainScreen().bounds.size
        let location = CGPointMake(screenSize.width / 2.0, (screenSize.height - keyboardHeight) / 2.0 + keyboardHeight)

        spriteSquare = SKSpriteNode(imageNamed:"square")
        
        spriteSquare.position = location
        
        self.addChild(spriteSquare)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func hideSquare()
    {
        spriteSquare.removeFromParent()
    }
    
}
