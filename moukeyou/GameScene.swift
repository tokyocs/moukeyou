//
//  GameScene.swift
//  moukeyou
//
//  Created by tcs14048 on 2018/09/21.
//  Copyright © 2018年 tcs14048. All rights reserved.
//

import SpriteKit
import GameplayKit




class GameScene: SKScene {
    var ao_ue:SKSpriteNode!
    var ao_sita:SKSpriteNode!
    var ao_hidari:SKSpriteNode!
    var ao_migi:SKSpriteNode!
    var aka_ue:SKSpriteNode!
    var aka_sita:SKSpriteNode!
    var aka_hidari:SKSpriteNode!
    var aka_migi:SKSpriteNode!
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        //ゲーム画面の背景色を薄緑にする
        self.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 0.5, alpha:1.0)
        self.ao_ue = SKSpriteNode(imageNamed: "ao_ue")
        self.ao_ue.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.ao_ue.position = CGPoint(x: 0, y:frame.maxY + 50)
        addChild(self.ao_ue)
        
        self.ao_sita = SKSpriteNode(imageNamed: "ao_sita")
        self.ao_sita.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.ao_sita.position = CGPoint(x: 0, y: frame.maxY + 50)
        addChild(self.ao_sita)
        
        self.ao_hidari = SKSpriteNode(imageNamed: "ao_hidari")
        self.ao_hidari.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.ao_hidari.position = CGPoint(x: 0, y:frame.maxY + 35)
        addChild(self.ao_hidari)
        
        self.ao_migi = SKSpriteNode(imageNamed: "ao_migi")
        self.ao_migi.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.ao_migi.position = CGPoint(x: 0, y:frame.maxY + 85)
        addChild(self.ao_migi)
        
        self.aka_ue = SKSpriteNode(imageNamed: "aka_ue")
        self.aka_ue.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.aka_ue.position = CGPoint(x: 0, y:frame.maxY + 50)
        addChild(self.aka_ue)
        
        self.aka_sita = SKSpriteNode(imageNamed: "aka_sita")
        self.aka_sita.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.aka_sita.position = CGPoint(x: 0, y:frame.maxY + 50)
        addChild(self.aka_sita)
        
        self.aka_hidari = SKSpriteNode(imageNamed: "aka_hidari")
        self.aka_hidari.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.aka_hidari.position = CGPoint(x: 0, y:frame.maxY + 35)
        addChild(self.aka_hidari)
        
        self.aka_migi = SKSpriteNode(imageNamed: "aka_migi")
        self.aka_migi.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.aka_migi.position = CGPoint(x: 0, y:frame.maxY + 85)
        addChild(self.aka_migi)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
    
}
