//
//  ReadingChatSzene.swift
//  Sleeppot
//
//  Created by Felix Parey on 20/10/23.
//

import Foundation
import SpriteKit

class ReadingChatSzene: SKScene {
    override func didMove(to view: SKView) {

        //Sets the Background Color to clear
        backgroundColor = .clear

        //creating Dimensions
        let desiredWidth: CGFloat = 185// Set your desired width
        let desiredHeight = desiredWidth
        
        //Creating the TextureAtlas
        let textureAtlas = SKTextureAtlas(named: "ChatReadingAnimation")
        
        // Create an array of textures from the Texture Atlas
        var framesArray: [SKTexture] = []
        for i in 240...(textureAtlas.textureNames.count)+239 {
            let textureName = "chat\(i)"
            framesArray.append(textureAtlas.textureNamed(textureName))
        }
        
        // Load the first frame
        let spriteNode = SKSpriteNode(texture: framesArray[0], size: CGSize(width: desiredWidth, height: desiredHeight))
        spriteNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(spriteNode)
        
        //Animate the SKNode
        let animation = SKAction.animate(with: framesArray, timePerFrame: 0.05)
        spriteNode.run(SKAction.repeatForever(animation))

    }
    
}
