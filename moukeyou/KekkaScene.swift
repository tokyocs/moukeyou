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

class KekkaScene: SKScene,AVAudioPlayerDelegate, SKPhysicsContactDelegate {
    var haikei:SKSpriteNode!
    var tokutenLabel:SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        self.haikei = SKSpriteNode(imageNamed: "aka_kati")
        self.haikei.scale(to: view.frame.size)
//        self.haikei.scale(to: CGSize(width: view.frame.size.width, height: view.frame.size.height ))
//        self.haikei.scale(to: CGSize(width: view.frame.size.width, height: view.frame.size.height ))
        self.haikei.position = CGPoint(x: size.width*0.5 , y: size.height*0.5)
        addChild(self.haikei)
        
        tokutenLabel = SKLabelNode(text: "得点:0")
        tokutenLabel.fontColor = UIColor(red: 0, green: 0, blue: 0, alpha:1)
        tokutenLabel.fontName = "Papyrus"
        tokutenLabel.fontSize = 30
        tokutenLabel.position = CGPoint(x:0, y: 245)
        addChild(tokutenLabel)
        
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
        
    }

}