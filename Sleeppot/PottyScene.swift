//
//  ReadingChatSzene.swift
//  Sleeppot
//
//  Created by Felix Parey on 20/10/23.
//

import Foundation
import SpriteKit

class PottyScene: SKScene{
    
    
    override func didMove(to view: SKView) {

    ///`Genral Information about the Scene`
        
        //Sets the Background Color to clear
        backgroundColor = .clear

        //creating Dimensions
        let desiredWidth: CGFloat = 300// Set your desired width
        let desiredHeight = desiredWidth

        //Creating the TextureAtlas
        let textureAtlasChatReading = SKTextureAtlas(named: "ChatReadingAnimation")
        
        // Create an array of textures from the Texture Atlas
        var framesArrayChatReading: [SKTexture] = []
        for i in 240...(textureAtlasChatReading.textureNames.count)+239 {
            let textureChatName = "chat\(i)"
            framesArrayChatReading.append(textureAtlasChatReading.textureNamed(textureChatName))
        }
        
        // Load the first frame
        let spriteNodeChatReading = SKSpriteNode(texture: framesArrayChatReading[0], size: CGSize(width: desiredWidth, height: desiredHeight))
        spriteNodeChatReading.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(spriteNodeChatReading)
        
        
        
        //Animate the SKNode
        let animationChatReading = SKAction.animate(with: framesArrayChatReading, timePerFrame: 0.05)
        spriteNodeChatReading.run(SKAction.repeatForever(animationChatReading))
        
    }
}

class PottyIdleScene: SKScene {
    
    
    override func didMove(to view: SKView) {

    ///`Genral Information about the Scene`
        
        //Sets the Background Color to clear
        backgroundColor = .clear
        //creating Dimensions
        let desiredWidth: CGFloat = 300// Set your desired width
        let desiredHeight = desiredWidth

        //Creating the TextureAtlas
        let textureAtlasIdleAnimation = SKTextureAtlas(named: "IdleAnimation")
        textureAtlasIdleAnimation.preload {
            
        }
        
        //fill the array
        var framesArrayIdle: [SKTexture] = []
        for i in 1...(textureAtlasIdleAnimation.textureNames.count)-1 {
            let textureIdleName = "idle\(i)"
            framesArrayIdle.append(textureAtlasIdleAnimation.textureNamed(textureIdleName))
        }
        
        // Load the first frame
        let spriteNodeIdle = SKSpriteNode(texture: framesArrayIdle[0], size: CGSize(width: desiredWidth, height: desiredHeight))
        spriteNodeIdle.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(spriteNodeIdle)
        
        //Animate the SKNode
        let animationIdle = SKAction.animate(with: framesArrayIdle, timePerFrame: 0.05)
        spriteNodeIdle.run(SKAction.repeatForever(animationIdle))
        
        //find a way to stop the animation when other view is presented

    }
}

