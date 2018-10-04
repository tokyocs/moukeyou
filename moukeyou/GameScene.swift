//
//  GameScene.swift
//  moukeyou
//
//  Created by tcs14048 on 2018/09/21.
//  Copyright © 2018年 tcs14048. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene,AVAudioPlayerDelegate {
    var ao_ue:SKSpriteNode!
    var ao_sita:SKSpriteNode!
    var ao_hidari:SKSpriteNode!
    var ao_migi:SKSpriteNode!
    var aka_ue:SKSpriteNode!
    var aka_sita:SKSpriteNode!
    var aka_hidari:SKSpriteNode!
    var aka_migi:SKSpriteNode!
    var minustenyen:SKSpriteNode!
    var minushyakuyen:SKSpriteNode!
    var minusgohyakuyen:SKSpriteNode!
    var goyen:SKSpriteNode!
    var tenyen:SKSpriteNode!
    var gojyuuyen:SKSpriteNode!
    var hyakuyen:SKSpriteNode!
    var gohyakuyen:SKSpriteNode!
 
    var aka_ie:SKSpriteNode!
    var ao_ie:SKSpriteNode!
    
    //音

    var audioPlayer: AVAudioPlayer!
    var BGMPlayer: AVAudioPlayer!

    // これも音
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("rezi")
            return
        }
        
        do {
            // AVBGMPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVBGMPlayerのデリゲートをセット
            audioPlayer.delegate = self
            
            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
    func playBGM(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("nezumi")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            BGMPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            BGMPlayer.delegate = self
            BGMPlayer.numberOfLoops = -1
            
            // 音声の再生
            BGMPlayer.play()
        } catch {
        }
    }
    //音はここまで
    
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    
    override func didMove(to view: SKView) {
        playBGM(name: "nezumi")
        playSound(name: "rezi")
        
        
        
        
        
        //ゲーム画面の背景色を薄緑にする
        self.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 0.5, alpha:1.0)
        //　家の表示
        self.aka_ie = SKSpriteNode(imageNamed: "aka_ie")
        self.aka_ie.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.aka_ie.position = CGPoint(x: frame.midX - view.frame.size.width / 3.5, y: frame.midY + view.frame.size.height / 4)
        addChild(self.aka_ie)
        
        self.ao_ie = SKSpriteNode(imageNamed: "ao_ie")
        self.ao_ie.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
        self.ao_ie.position = CGPoint(x: frame.midX + view.frame.size.width / 3.5, y: frame.midY + view.frame.size.height / 4)
        addChild(self.ao_ie)
        
        
        
        //矢印各種の配置と表示
        self.ao_ue = SKSpriteNode(imageNamed: "ao_ue")
        self.ao_ue.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.ao_ue.position = CGPoint(x: 80, y: frame.maxY + 450)
        addChild(self.ao_ue)
        
        self.ao_sita = SKSpriteNode(imageNamed: "ao_sita")
        self.ao_sita.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.ao_sita.position = CGPoint(x: 90, y: frame.maxY + 450)
        addChild(self.ao_sita)

        self.ao_hidari = SKSpriteNode(imageNamed: "ao_hidari")
        self.ao_hidari.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.ao_hidari.position = CGPoint(x: 85, y:frame.maxY + 425)
        addChild(self.ao_hidari)
        
        self.ao_migi = SKSpriteNode(imageNamed: "ao_migi")
        self.ao_migi.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.ao_migi.position = CGPoint(x: 85, y:frame.maxY + 475)
        addChild(self.ao_migi)
       
        self.aka_ue = SKSpriteNode(imageNamed: "aka_ue")
        self.aka_ue.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.aka_ue.position = CGPoint(x: 80, y:frame.maxY + 50)
        addChild(self.aka_ue)
        
        self.aka_sita = SKSpriteNode(imageNamed: "aka_sita")
        self.aka_sita.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.aka_sita.position = CGPoint(x: 90, y:frame.maxY + 50)
        addChild(self.aka_sita)
        
        self.aka_hidari = SKSpriteNode(imageNamed: "aka_hidari")
        self.aka_hidari.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.aka_hidari.position = CGPoint(x: 85, y:frame.maxY + 25)
        addChild(self.aka_hidari)
        
        self.aka_migi = SKSpriteNode(imageNamed: "aka_migi")
        self.aka_migi.scale(to: CGSize(width: frame.width / 100, height: frame.width / 500))
        self.aka_migi.position = CGPoint(x: 85, y:frame.maxY + 75)
        addChild(self.aka_migi)
        
        //お客さん各種を表示
        self.minustenyen = SKSpriteNode(imageNamed: "minustenyen")
        self.minustenyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.minustenyen.position = CGPoint(x: -40, y: 0)
        addChild(self.minustenyen)
        
        self.minushyakuyen = SKSpriteNode(imageNamed: "minushyakuyen")
        self.minushyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.minushyakuyen.position = CGPoint(x: -30, y: 0)
        addChild(self.minushyakuyen)
        
        self.minusgohyakuyen = SKSpriteNode(imageNamed: "minusgohyakuyen")
        self.minusgohyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.minusgohyakuyen.position = CGPoint(x: -20, y: 0)
        addChild(self.minusgohyakuyen)
        
        self.goyen = SKSpriteNode(imageNamed: "goyen")
        self.goyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.goyen.position = CGPoint(x: -10, y: 0)
        addChild(self.goyen)
        
        self.tenyen = SKSpriteNode(imageNamed: "tenyen")
        self.tenyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.tenyen.position = CGPoint(x: 30, y: 0)
        addChild(self.tenyen)
        
        self.gojyuuyen = SKSpriteNode(imageNamed: "gojyuuyen")
        self.gojyuuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.gojyuuyen.position = CGPoint(x: 20, y: 0)
        addChild(self.gojyuuyen)
        
        self.hyakuyen = SKSpriteNode(imageNamed: "hyakuyen")
        self.hyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.hyakuyen.position = CGPoint(x: 10, y: 0)
        addChild(self.hyakuyen)
        
        self.gohyakuyen = SKSpriteNode(imageNamed: "gohyakuyen")
        self.gohyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.gohyakuyen.position = CGPoint(x: 0, y: 0)
        addChild(self.gohyakuyen)
        
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
