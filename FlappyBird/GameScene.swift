//
//  GameScene.swift
//  FlappyBird
//
//  Created by macpc on 2016/07/21.
//  Copyright © 2016年 hiroshi.ohara. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var scrollNode:SKNode!
    
    override func didMoveToView(view: SKView) {
        // 背景
        backgroundColor = UIColor(colorLiteralRed: 0.15, green: 0.75, blue: 0.90, alpha: 1)
        
        // 親ノード？
        scrollNode = SKNode()
        addChild(scrollNode)
        
        setupGround()
    }
    
    func setupGround() {
        // 地面
        let groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        // 必要枚数
        let needNumber = 2.0 + (frame.size.width / groundTexture.size().width)
        
        // 左にスクロール
        let moveGround = SKAction.moveByX(-groundTexture.size().width, y: 0, duration: 5.0)
        // 元に戻す
        let resetGround = SKAction.moveByX(groundTexture.size().width, y: 0, duration: 0.0)
        // 繰り返す
        let repeatScrollGround = SKAction.repeatActionForever(SKAction.sequence([moveGround, resetGround]))
        

        // スプライトを配置
        for i:CGFloat in CGFloat(0).stride(to:needNumber, by: 1.0) { // to: or through:
            // 位置表示
            let sprite = SKSpriteNode(texture: groundTexture)
            //groundSprite.position = CGPoint(x: size.width / 2, y: groundTexture.size().height / 2)
            sprite.position = CGPoint(x: i * sprite.size.width, y: groundTexture.size().height / 2)
            
            // アクションを設定
            sprite.runAction(repeatScrollGround)
            //addChild(groundSprite)
            scrollNode.addChild(sprite)
        }
    }
    
    
}
