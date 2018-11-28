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

class GameScene: SKScene,AVAudioPlayerDelegate, SKPhysicsContactDelegate {
    // 人を降らせる
    var timer: Timer?
    //残りの時間
    var timer2: Timer?
    //残りの時間の表示用
    var timer3: Int = 80 {
        didSet {
            timerLabel.text = "残り時間: \(timer3)"
        }
    }
    // 矢印
    var ao_ue:SKSpriteNode!
    var ao_sita:SKSpriteNode!
    var ao_hidari:SKSpriteNode!
    var ao_migi:SKSpriteNode!
    var aka_ue:SKSpriteNode!
    var aka_sita:SKSpriteNode!
    var aka_hidari:SKSpriteNode!
    var aka_migi:SKSpriteNode!
    
    // マイナスの人
    var minustenyen:SKSpriteNode!
    var minushyakuyen:SKSpriteNode!
    var minusgohyakuyen:SKSpriteNode!
    
    // プラスの人
    var goyen:SKSpriteNode!
    var tenyen:SKSpriteNode!
    var gojyuuyen:SKSpriteNode!
    var hyakuyen:SKSpriteNode!
    var gohyakuyen:SKSpriteNode!

    //赤
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "所持金: \(score)"
        }
    }
    
    //青
    var score2: Int = 0 {
        didSet {
            scoreLabel2.text = "所持金: \(score2)"
        }
    }

    //長押し
    var aka_yazirushi:Int = 0
    var ao_yazirushi:Int = 0

    //音
    var audioPlayer: AVAudioPlayer!
    var BGMPlayer: AVAudioPlayer!
    
    // 店
    var aka_ie:SKSpriteNode!
    var ao_ie:SKSpriteNode!
    
    var aka_ie_texture:SKTexture!
    var circular_aka_ie:SKSpriteNode!
    var ao_ie_texture:SKTexture!
    var circular_ao_ie:SKSpriteNode!
    //タイマー
    var nokorijikan:Int = 80
    var timerLabel: SKLabelNode!
    
    let aka_ieCategory: UInt32 = 0b00001
    let ao_ieCategory: UInt32 = 0b00010
    let okaneCategory: UInt32 = 0b00011
    let bigCategory: UInt32 = 0b00100
    let gohyakuenCategory: UInt32 = 0b00101
    let gojyuuyenCategory: UInt32 = 0b00110
    let hyakuyenCategory: UInt32 = 0b00111
    let goyenCategory: UInt32 = 0b01000
    let minusgohyakuyenCategory: UInt32 = 0b01001
    let minushyakuyenCategory: UInt32 = 0b01010
    let minustenyenCategory: UInt32 = 0b01011
    let tenyenCategory: UInt32 = 0b01111
    let ie_bigCategory: UInt32 = 0b10000
    let ie_smallCategory: UInt32 = 0b10001
    
    var scoreLabel: SKLabelNode!
    var scoreLabel2: SKLabelNode!
    
    func addAsteroid() {
        let names = ["gohyakuyen","gojyuuyen","hyakuyen","goyen","minusgohyakuyen","minushyakuyen","minustenyen","tenyen","ie_big","ie_small","ie_big","ie_big","gohyakuyen","gojyuuyen","minushyakuyen",]
        let index = Int(arc4random_uniform(UInt32(names.count)))
        let name = names[index]
        let okane = SKSpriteNode(imageNamed: name)
        let random = CGFloat(arc4random_uniform(UINT32_MAX)) / CGFloat(UINT32_MAX)
        let positionX = frame.width * (random - 0.5)
        okane.position = CGPoint(x: positionX, y: frame.height / 2 + okane.frame.height)
        okane.scale(to: CGSize(width: 70, height: 70))
        okane.physicsBody = SKPhysicsBody(circleOfRadius: okane.frame.width)
        if(name == "gohyakuyen"){
        okane.physicsBody?.categoryBitMask = gohyakuenCategory
        }
        if(name == "gojyuuyen"){
            okane.physicsBody?.categoryBitMask = gojyuuyenCategory
        }
        if(name == "hyakuyen"){
            okane.physicsBody?.categoryBitMask = hyakuyenCategory
        }
        if(name == "goyen"){
            okane.physicsBody?.categoryBitMask = goyenCategory
        }
        if(name == "minusgohyakuyen"){
            okane.physicsBody?.categoryBitMask = minusgohyakuyenCategory
        }
        if(name == "minushyakuyen"){
            okane.physicsBody?.categoryBitMask = minushyakuyenCategory
        }
        if(name == "minustenyen"){
            okane.physicsBody?.categoryBitMask = minustenyenCategory
        }
        if(name == "tenyen"){
            okane.physicsBody?.categoryBitMask = tenyenCategory
        }
        if(name == "ie_big"){
            okane.physicsBody?.categoryBitMask = ie_bigCategory
        }
        if(name == "ie_small"){
            okane.physicsBody?.categoryBitMask = ie_smallCategory
        }
        okane.physicsBody?.contactTestBitMask = ao_ieCategory|aka_ieCategory
        okane.physicsBody?.collisionBitMask = 0
        addChild(okane)
        let move = SKAction.moveTo(y: -frame.height / 2 - okane.frame.height, duration: 20.0)
        let remove = SKAction.removeFromParent()
        okane.run(SKAction.sequence([move, remove]))
        
    
    
    
    }
    func didBegin(_ contact: SKPhysicsContact) {
        var okane: SKPhysicsBody
        var target: SKPhysicsBody
        if contact.bodyA.categoryBitMask == okaneCategory {
            okane = contact.bodyA
            target = contact.bodyB
        } else {
            okane = contact.bodyB
            target = contact.bodyA
        }
        guard let okaneNode = okane.node else { return }
        guard target.node != nil else { return }
        guard target.node != nil else { return }
        if target.categoryBitMask == aka_ieCategory {
            print(okane)
            
            if okane.categoryBitMask == gohyakuenCategory {
                score += 500
            }
            if okane.categoryBitMask == hyakuyenCategory {
                score += 100
            }
            if okane.categoryBitMask == goyenCategory {
                score += 5
            }
            if okane.categoryBitMask == gojyuuyenCategory {
                score += 50
            }
            if okane.categoryBitMask == minusgohyakuyenCategory {
                score -= 500
            }
            if okane.categoryBitMask == minushyakuyenCategory {
                score -= 100
            }
            if okane.categoryBitMask == minustenyenCategory {
                score -= 10
            }
            if okane.categoryBitMask == tenyenCategory {
                score += 10
            }
            if okane.categoryBitMask == ie_bigCategory {
                self.aka_ie.scale(to: CGSize(width: self.aka_ie.size.width*1.2 ,height:self.aka_ie.size.height*1.2 ))
                 self.aka_ie.physicsBody = SKPhysicsBody(texture: aka_ie_texture,size: CGSize(width: circular_aka_ie.size.width,height: circular_aka_ie.size.height))
                self.aka_ie.physicsBody?.categoryBitMask = aka_ieCategory
                self.aka_ie.physicsBody?.contactTestBitMask = aka_ieCategory
                self.aka_ie.physicsBody?.collisionBitMask = 0
            }
            if okane.categoryBitMask == ie_smallCategory {
                self.aka_ie.scale(to: CGSize(width: self.aka_ie.size.width/1.2 ,height:self.aka_ie.size.height/1.2 ))
                 self.aka_ie.physicsBody = SKPhysicsBody(texture: aka_ie_texture,size: CGSize(width: circular_aka_ie.size.width,height: circular_aka_ie.size.height))
                self.aka_ie.physicsBody?.categoryBitMask = aka_ieCategory
                self.aka_ie.physicsBody?.contactTestBitMask = aka_ieCategory
                self.aka_ie.physicsBody?.collisionBitMask = 0
            }
            playSound(name: "reji sound")
        }
        if target.categoryBitMask == ao_ieCategory {
           print(okane)
            if okane.categoryBitMask == gohyakuenCategory {
                score2 += 500
            }
            if okane.categoryBitMask == hyakuyenCategory {
                score2 += 100
            }
            if okane.categoryBitMask == goyenCategory {
                score2 += 5
            }
            if okane.categoryBitMask == gojyuuyenCategory {
                score2 += 50
            }
            if okane.categoryBitMask == minusgohyakuyenCategory {
                score2 -= 500
            }
            if okane.categoryBitMask == minushyakuyenCategory {
                score2 -= 100
            }
            if okane.categoryBitMask == minustenyenCategory {
                score2 -= 10
            }
            if okane.categoryBitMask == tenyenCategory {
                score2 += 10
            }
            if okane.categoryBitMask == ie_bigCategory {
                self.ao_ie.scale(to: CGSize(width:self.ao_ie.size.width*1.2 ,height:self.ao_ie.size.height*1.2 ))
                 self.ao_ie.physicsBody = SKPhysicsBody(texture: ao_ie_texture,size: CGSize(width: circular_ao_ie.size.width,height: circular_ao_ie.size.height))
                self.ao_ie.physicsBody?.categoryBitMask = ao_ieCategory
                self.ao_ie.physicsBody?.contactTestBitMask = ao_ieCategory
                self.ao_ie.physicsBody?.collisionBitMask = 0
                
            }
            if okane.categoryBitMask == ie_smallCategory {
                self.ao_ie.scale(to: CGSize(width: self.ao_ie.size.width/1.2 ,height:self.ao_ie.size.height/1.2 ))
                 self.ao_ie.physicsBody = SKPhysicsBody(texture: ao_ie_texture,size: CGSize(width: circular_ao_ie.size.width,height: circular_ao_ie.size.height))
                self.ao_ie.physicsBody?.categoryBitMask = ao_ieCategory
                self.ao_ie.physicsBody?.contactTestBitMask = ao_ieCategory
                self.ao_ie.physicsBody?.collisionBitMask = 0
                
            }
            playSound(name: "reji sound")
        }
        okaneNode.removeFromParent()
       
        
        
    }
    
    
    
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
        playSound(name: "reji sound")
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.addAsteroid()
        })
        
        //残りの時間を減らす
        timer2 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.timer3 = self.timer3 - 1
            if(self.timer3 == 20){
                    self.scoreLabel.removeFromParent()
                    self.scoreLabel2.removeFromParent()
            }
            //0秒になったらゲームオーバー
            if(self.timer3 <= 0) {
                self.gameOver()
            }
        })
        
        
        //ゲーム画面の背景色を薄緑にする
        self.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 0.5, alpha:1.0)
        
        //　お店の表示
        self.aka_ie_texture = SKTexture(imageNamed: "aka_ie")
        self.circular_aka_ie = SKSpriteNode(texture: aka_ie_texture)
        self.aka_ie = SKSpriteNode(texture: aka_ie_texture)
        self.aka_ie.scale(to: CGSize(width: frame.width / 6, height: frame.width / 6))
        self.aka_ie.position = CGPoint(x: frame.midX - view.frame.size.width / 2.5, y: frame.midY + view.frame.size.height / 3)
        self.aka_ie.physicsBody = SKPhysicsBody(texture: aka_ie_texture,size: CGSize(width: circular_aka_ie.size.width,height: circular_aka_ie.size.height))
        self.aka_ie.physicsBody?.categoryBitMask = aka_ieCategory
        self.aka_ie.physicsBody?.contactTestBitMask = aka_ieCategory
        self.aka_ie.physicsBody?.collisionBitMask = 0
        addChild(self.aka_ie)
        
        
        self.ao_ie_texture = SKTexture(imageNamed: "ao_ie")
        self.circular_ao_ie = SKSpriteNode(texture: ao_ie_texture)
        self.ao_ie = SKSpriteNode(texture: ao_ie_texture)
        self.ao_ie.scale(to: CGSize(width: frame.width / 6, height: frame.width / 6))
        self.ao_ie.position = CGPoint(x: frame.midX + view.frame.size.width / 2.5, y: frame.midY + view.frame.size.height / 3)
        self.ao_ie.physicsBody = SKPhysicsBody(texture: ao_ie_texture,size: CGSize(width: circular_ao_ie.size.width,height: circular_ao_ie.size.height))
        self.ao_ie.physicsBody?.categoryBitMask = ao_ieCategory
        self.ao_ie.physicsBody?.contactTestBitMask = ao_ieCategory
        self.ao_ie.physicsBody?.collisionBitMask = 0
        addChild(self.ao_ie)
        
        //矢印各種の配置と表示
        self.ao_ue = SKSpriteNode(imageNamed: "ao_ue")
        self.ao_ue.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.ao_ue.position = CGPoint(x: frame.midX + view.frame.size.width / 2.5, y: frame.midY - view.frame.size.height / 3.7)
        addChild(self.ao_ue)
        
        self.ao_sita = SKSpriteNode(imageNamed: "ao_sita")
        self.ao_sita.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.ao_sita.position = CGPoint(x: frame.midX + view.frame.size.width / 2.5, y: frame.midY - view.frame.size.height / 2.25)
        addChild(self.ao_sita)
        
        self.ao_hidari = SKSpriteNode(imageNamed: "ao_hidari")
        self.ao_hidari.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.ao_hidari.position = CGPoint(x: frame.midX + view.frame.size.width / 3, y: frame.midY - view.frame.size.height / 2.8)
        addChild(self.ao_hidari)
        
        self.ao_migi = SKSpriteNode(imageNamed: "ao_migi")
        self.ao_migi.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.ao_migi.position = CGPoint(x: frame.midX + view.frame.size.width / 2.15, y: frame.midY - view.frame.size.height / 2.8)
        addChild(self.ao_migi)
        
        self.aka_ue = SKSpriteNode(imageNamed: "aka_ue")
        self.aka_ue.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.aka_ue.position = CGPoint(x: frame.midX - view.frame.size.width / 2.5, y: frame.midY - view.frame.size.height / 3.7)
        addChild(self.aka_ue)
        
        self.aka_sita = SKSpriteNode(imageNamed: "aka_sita")
        self.aka_sita.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.aka_sita.position = CGPoint(x: frame.midX - view.frame.size.width / 2.5, y: frame.midY - view.frame.size.height / 2.25)
        addChild(self.aka_sita)
        
        self.aka_hidari = SKSpriteNode(imageNamed: "aka_hidari")
        self.aka_hidari.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.aka_hidari.position = CGPoint(x: frame.midX - view.frame.size.width / 2.15, y: frame.midY - view.frame.size.height / 2.8)
        addChild(self.aka_hidari)
        
        self.aka_migi = SKSpriteNode(imageNamed: "aka_migi")
        self.aka_migi.scale(to: CGSize(width: frame.width / 15, height: frame.width / 15))
        self.aka_migi.position = CGPoint(x: frame.midX - view.frame.size.width / 3, y: frame.midY - view.frame.size.height / 2.8)
        addChild(self.aka_migi)
        
        //お客さん各種を表示
//        self.minustenyen = SKSpriteNode(imageNamed: "minustenyen")
//        self.minustenyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.minustenyen.position = CGPoint(x: -190, y: 0)
//        addChild(self.minustenyen)
//        
//
//        self.minushyakuyen = SKSpriteNode(imageNamed: "minushyakuyen")
//        self.minushyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.minushyakuyen.position = CGPoint(x: -140, y: 0)
//        addChild(self.minushyakuyen)
//        self.minusgohyakuyen = SKSpriteNode(imageNamed: "minusgohyakuyen")
//        self.minusgohyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.minusgohyakuyen.position = CGPoint(x: -90, y: 0)
//        addChild(self.minusgohyakuyen)
//        
//        self.goyen = SKSpriteNode(imageNamed: "goyen")
//        self.goyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.goyen.position = CGPoint(x: -40, y: 0)
//        addChild(self.goyen)
//
//        self.tenyen = SKSpriteNode(imageNamed: "tenyen")
//        self.tenyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.tenyen.position = CGPoint(x: 160, y: 0)
//        addChild(self.tenyen)
//        self.gojyuuyen = SKSpriteNode(imageNamed: "gojyuuyen")
//        self.gojyuuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.gojyuuyen.position = CGPoint(x: 110, y: 0)
//        addChild(self.gojyuuyen)
//
//        self.hyakuyen = SKSpriteNode(imageNamed: "hyakuyen")
//        self.hyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.hyakuyen.position = CGPoint(x: 60, y: 0)
//        addChild(self.hyakuyen)
//        
//        self.gohyakuyen = SKSpriteNode(imageNamed: "gohyakuyen")
//        self.gohyakuyen.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
//        self.gohyakuyen.position = CGPoint(x: 10, y: 0)
//        addChild(self.gohyakuyen)

        //赤の得点表
        scoreLabel = SKLabelNode(text:"所持金:0" )
        //        scoreLabel.fontName = "HiraMinProN-W3"
        scoreLabel.fontName = "Papyrus"
        scoreLabel.fontSize = 35
        scoreLabel.position = CGPoint(x: frame.midX - view.frame.size.width / 2.5, y: frame.midY - view.frame.size.height / 8)
        scoreLabel.fontColor = UIColor(red: 0, green: 0, blue: 0, alpha:1)
        addChild(scoreLabel)

        //青の得点表
        scoreLabel2 = SKLabelNode(text:"所持金:0" )
//        scoreLabel2.fontName = "HiraMinProN-W3"
        scoreLabel2.fontName = "Papyrus"
        scoreLabel2.fontSize = 35
        scoreLabel2.position = CGPoint(x: frame.midX + view.frame.size.width / 2.5, y: frame.midY -
            view.frame.size.height / 8)
        scoreLabel2.fontColor = UIColor(red: 0, green: 0, blue: 0, alpha:1)

        addChild(scoreLabel2)

    
//      制限時間
        
        timerLabel = SKLabelNode(text: "残り時間:80")
        timerLabel.fontColor = UIColor(red: 0, green: 0, blue: 0, alpha:1)
        timerLabel.fontName = "Papyrus"
        timerLabel.fontSize = 45
        timerLabel.position = CGPoint(x: frame.midX, y: frame.midY + view.frame.size.height / 2.3)
        addChild(timerLabel)

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    //矢印で店を動かす
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            if touchNode == aka_ue {
                aka_yazirushi = 1
            }else if touchNode == aka_migi {
                aka_yazirushi = 2
            }else if touchNode == aka_sita {
                aka_yazirushi = 3
            }else if touchNode == aka_hidari {
                aka_yazirushi = 4
            }else if touchNode == ao_ue {
                ao_yazirushi = 1
            }else if touchNode == ao_migi {
                ao_yazirushi = 2
            }else if touchNode == ao_sita {
                ao_yazirushi = 3
            }else if touchNode == ao_hidari {
                ao_yazirushi = 4
            }
        }
        
        
        
        //        if isPaused { return }
        //
        //        // タッチされているオブジェクトから、
        //        for touch: AnyObject in touches {
        //            // タッチした場所を取得する。
        //            let location = touch.location(in: self)
        //            // タッチされたノードを選択して、ボタンと触れたかを判定する。
        //            let touchNode = self.atPoint(location)
        //            // 右のボタンが押されたら右に30px動かす。
        //            if touchNode == aka_migi {
        //                // 右に動く動きを指定する。
        //                let moveToRight = SKAction.moveTo(x: self.aka_ie.position.x + 30, duration: 0.2)
        //                // 右に動かす。
        //                aka_ie.run(moveToRight)
        //                // 左のボタンが押されたら左に30px動かす。
        //            }else if touchNode == aka_hidari {
        //                // 左に動く動きを指定する。
        //                let moveToLeft = SKAction.moveTo(x: self.aka_ie.position.x - 30, duration: 0.2)
        //                // 左に動く動きを指定する。
        //                aka_ie.run(moveToLeft)
        //
        //            }else if touchNode == aka_ue {
        //                // 上に動く動きを指定する。
        //                let moveToTop = SKAction.moveTo(y: self.aka_ie.position.y + 30, duration: 0.2)
        //                // 上に動かす。
        //                aka_ie.run(moveToTop)
        //                // 下のボタンが押されたら左に30px動かす。
        //            }else if touchNode == aka_sita {
        //                // 下に動く動きを指定する。
        //                let moveToDown = SKAction.moveTo(y: self.aka_ie.position.y - 30, duration: 0.2)
        //                // 下に動く動きを指定する。
        //                aka_ie.run(moveToDown)
        //
        //            }else if touchNode == ao_migi {
        //                // 右に動く動きを指定する。
        //                let moveToRight = SKAction.moveTo(x: self.ao_ie.position.x + 30, duration: 0.2)
        //                // 右に動かす。
        //                ao_ie.run(moveToRight)
        //                // 左のボタンが押されたら左に30px動かす。
        //            }else if touchNode == ao_hidari {
        //                // 左に動く動きを指定する。
        //                let moveToLeft = SKAction.moveTo(x: self.ao_ie.position.x - 30, duration: 0.2)
        //                // 左に動く動きを指定する。
        //                ao_ie.run(moveToLeft)
        //
        //            }else if touchNode == ao_ue {
        //                // 上に動く動きを指定する。
        //                let moveToTop = SKAction.moveTo(y: self.ao_ie.position.y + 30, duration: 0.2)
        //                // 上に動かす。
        //                ao_ie.run(moveToTop)
        //                // 下のボタンが押されたら左に30px動かす。
        //            }else if touchNode == ao_sita {
        //                // 下に動く動きを指定する。
        //                let moveToDown = SKAction.moveTo(y: self.ao_ie.position.y - 30, duration: 0.2)
        //                // 下に動く動きを指定する。
        //                ao_ie.run(moveToDown)
        //
        //            }
        //        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            if touchNode == aka_ue {
                aka_yazirushi = 0
            }else if touchNode == aka_migi {
                aka_yazirushi = 0
            }else if touchNode == aka_sita {
                aka_yazirushi = 0
            }else if touchNode == aka_hidari {
                aka_yazirushi = 0
            }
            if touchNode == ao_ue {
                ao_yazirushi = 0
            }else if touchNode == ao_migi {
                ao_yazirushi = 0
            }else if touchNode == ao_sita {
                ao_yazirushi = 0
            }else if touchNode == ao_hidari {
                ao_yazirushi = 0
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if aka_yazirushi == 1{
            let moveToTop = SKAction.moveTo(y: self.aka_ie.position.y + 30, duration: 0.2)
            aka_ie.run(moveToTop)
            
        }else if aka_yazirushi == 2{
            let moveToRight = SKAction.moveTo(x: self.aka_ie.position.x + 30, duration: 0.2)
            aka_ie.run(moveToRight)
            
        }else if aka_yazirushi == 3{
            let moveToDown = SKAction.moveTo(y: self.aka_ie.position.y - 30, duration: 0.2)
            aka_ie.run(moveToDown)
            
        }else if aka_yazirushi == 4{
            let moveToLeft = SKAction.moveTo(x: self.aka_ie.position.x - 30, duration: 0.2)
            aka_ie.run(moveToLeft)
        }
        if ao_yazirushi == 1{
            let moveToTop = SKAction.moveTo(y: self.ao_ie.position.y + 30, duration: 0.2)
            ao_ie.run(moveToTop)
            
        }else if ao_yazirushi == 2{
            let moveToRight = SKAction.moveTo(x: self.ao_ie.position.x + 30, duration: 0.2)
            ao_ie.run(moveToRight)
            
        }else if ao_yazirushi == 3{
            let moveToDown = SKAction.moveTo(y: self.ao_ie.position.y - 30, duration: 0.2)
            ao_ie.run(moveToDown)
            
        }else if ao_yazirushi == 4{
            let moveToLeft = SKAction.moveTo(x: self.ao_ie.position.x - 30, duration: 0.2)
            ao_ie.run(moveToLeft)
        }
    }
    func gameOver() {
        //ゲームを中断
        isPaused = true
        //タイマーを止める
        timer?.invalidate()
        timer2?.invalidate()
        //音を止める
        //FIXME
        
        //得点を保存する
        //FIXME
        //1秒後に画面を移動する
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            // 結果シーンに遷移させる。
            let ud = UserDefaults.standard
            ud.set(self.score, forKey: "score")
            ud.set(self.score2, forKey: "score2")
            
            let newScene = KekkaScene(size: (self.scene?.size)!)
            newScene.scaleMode = SKSceneScaleMode.aspectFill
            self.view?.presentScene(newScene)
        }
    }
}
