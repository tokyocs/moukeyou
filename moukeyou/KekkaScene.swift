//
//  KekkaScene.swift
//  moukeyou
//
//  Created by tcs14049 on 2018/10/10.
//  Copyright © 2018年 tcs14048. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class KekkaScene: SKScene,AVAudioPlayerDelegate, SKPhysicsContactDelegate {
    var haikei:SKSpriteNode!
    var haikei2:SKSpriteNode!
    var haikei3:SKSpriteNode!
    var moukeru:SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var scoreLabel2: SKLabelNode!
    //音
    var LastPlayer: AVAudioPlayer!
    var WaoPlayer: AVAudioPlayer!
       //赤
    var score_aka: Int = 0 {
        didSet {
            scoreLabel.text = "所持金: \(score_aka)"
        }
    }
    
    //青
    var score_ao: Int = 0 {
        didSet {
            scoreLabel2.text = "所持金: \(score_ao)"
        }
    }
    // ゲームシーンに戻る関数
    func goToGameScene(){
        // 戻したいゲームシーンを画面の大きさとともに設定する
        let gameScene:GameScene = GameScene(size: (UIScreen.main.bounds.size))
        // ゲームシーンに移る時にどんな画面の変え方をするかを記述する
        let transition = SKTransition.fade(withDuration: 1.0)
        // 画面にフィト（fit）させるか、脇を切る（fill）かを選択する。
        gameScene.scaleMode = SKSceneScaleMode.fill
        // ゲームシーンに戻してもう一度ゲームをプレイする。
        self.view!.presentScene(gameScene, transition: transition)
    }

    
    override func didMove(to view: SKView) {
        //音

        func playLast(name: String) {
            guard let path = Bundle.main.path(forResource: name, ofType: "wav") else {
                print("drum-roll1")
                return
            }
            
            do {
                // AVBGMPlayerのインスタンス化
                LastPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                
                // AVBGMPlayerのデリゲートをセット
                LastPlayer.delegate = self
                
                // 音声の再生
                LastPlayer.play()
            } catch {
            }
        }
        func playWao(name: String) {
            guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
                print("dondonpafupafu1")
                return
            }
            
            do {
                // AVBGMPlayerのインスタンス化
                WaoPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                
                // AVBGMPlayerのデリゲートをセット
                WaoPlayer.delegate = self
                
                // 音声の再生
                WaoPlayer.play()
            } catch {
            }
        }
        
    
        playLast(name: "saigo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
            let ud = UserDefaults.standard
            let score = ud.integer(forKey: "score")
            let score2 = ud.integer(forKey: "score2")
            if score > score2 {
                self.haikei = SKSpriteNode(imageNamed: "akawin")
                self.haikei.xScale = view.frame.size.width/self.haikei.size.width
                self.haikei.yScale = view.frame.size.height/self.haikei.size.height
                self.haikei.position = CGPoint(x: self.size.width * 0.5 , y: self.size.height * 0.5)
                self.addChild(self.haikei)
            }else if score < score2 {
                self.haikei2 = SKSpriteNode(imageNamed: "aowin")
                self.haikei2.xScale = view.frame.size.width/self.haikei2.size.width
                self.haikei2.yScale = view.frame.size.height/self.haikei2.size.height
                self.haikei2.position = CGPoint(x: self.size.width * 0.5 , y: self.size.height * 0.5)
                self.addChild(self.haikei2)
            }else if score == score2 {
                self.haikei3 = SKSpriteNode(imageNamed: "hikiwake")
                self.haikei3.xScale = view.frame.size.width/self.haikei3.size.width
                self.haikei3.yScale = view.frame.size.height/self.haikei3.size.height
                self.haikei3.position = CGPoint(x: self.size.width * 0.5 , y: self.size.height * 0.5)
                self.addChild(self.haikei3)
            }
            self.moukeru = SKSpriteNode(imageNamed: "moukeru")
            self.moukeru.scale(to: CGSize(width: self.frame.width / 5, height: self.frame.width / 5))
            self.moukeru.position = CGPoint(x: self.frame.midX, y: self.frame.midY - view.frame.size.height / 4)
            self.moukeru.zPosition = 100
            self.addChild(self.moukeru)
            
            self.scoreLabel = SKLabelNode(text:"所持金:0" )
            //        scoreLabel.fontName = "HiraMinProN-W3"
            self.scoreLabel.fontName = "Papyrus"
            self.scoreLabel.fontSize = 40
            self.scoreLabel.position = CGPoint(x: self.frame.midX - view.frame.size.width / 3.7, y: self.frame.midY - view.frame.size.height / 8)
            self.scoreLabel.zPosition = 100
            self.scoreLabel.fontColor = UIColor(red: 0, green: 0, blue: 0, alpha:1)
            self.addChild(self.scoreLabel)
            
            //青の得点表
            self.scoreLabel2 = SKLabelNode(text:"所持金:0" )
            //        scoreLabel2.fontName = "HiraMinProN-W3"
            self.scoreLabel2.fontName = "Papyrus"
            self.scoreLabel2.fontSize = 40
            self.scoreLabel2.position = CGPoint(x: self.frame.midX + view.frame.size.width / 3.7, y: self.frame.midY -
                view.frame.size.height / 8)
            self.scoreLabel2.zPosition = 100
            self.scoreLabel2.fontColor = UIColor(red: 0, green: 0, blue: 0, alpha:1)
            
            self.addChild(self.scoreLabel2)
            
            self.score_aka = score
            self.score_ao = score2
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                playWao(name: "dondonpafupafu1")
            }
            
        }
        
    }
        
            //ここまで音
             //音はここまで
        

        //self.haikei.scale(to: CGSize(width: view.frame.size.width, height: view.frame.size.height ))
        
        
        // スコアとハイスコアをユーザデフォルトから取っておく。
//        let ud = NSUserDefaults.standardUserDefaults()
//        var score = ud.integerForKey("score")
//        var hi_score = ud.integerForKey("hi_score")
//        
//        // スコアを表示
//        let scoreLabel = SKLabelNode(fontNamed:"Copperplate")
//        scoreLabel.text = "SCORE:\(score)";
//        scoreLabel.fontSize = 72;
//        scoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        self.addChild(scoreLabel)
//        
//        
//        // スコアがハイスコアを上回ったら、ハイスコアを更新！
//        if score > hi_score {
//            ud.setInteger(score, forKey: "hi_score")
//            hi_score = score
//        }
//        
//        // ハイスコアを表示。
//        let hiLabel = SKLabelNode(fontNamed:"Copperplate")
//        hiLabel.text = "過去最高得点:\(hi_score)";
//        hiLabel.fontSize = 36;
//        hiLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-100);
//        self.addChild(hiLabel)
//        
//        // 戻るための「Back」ラベルを作成。
//        let backLabel = SKLabelNode(fontNamed: "Copperplate")
//        backLabel.text = "Back"
//        backLabel.fontSize = 36
//        backLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: 200)
//        backLabel.name = "Back"
//        self.addChild(backLabel)
        
    
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            if touchNode == moukeru {
                goToGameScene()
            }
            }
        }
    


}

