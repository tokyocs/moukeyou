//
//  GameViewController.swift
//  moukeyou
//
//  Created by tcs14048 on 2018/09/21.
//  Copyright © 2018年 tcs14048. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        label.font = UIFont(name: "HiraMinProN-W3", size: 25)
        label.sizeToFit()
        label.frame.size = CGSize(width: 300, height: 45)
        label.center = self.view.center
        self.view.addSubview(label)
        for family in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: family) {
                print(fontName)
            }
        }
        label.backgroundColor = UIColor.white // 背景を白に変更
        label.textColor = UIColor.red // 文字色を赤に変更
        
        label.center = CGPoint(x: 160, y: 30) // UILabelの中央座標を (150, 100) にする
        label.text = "所持金:0\n2行目"
        //数値を加算
        print(1 + 1) //2
        
        let label2 = UILabel()
        label2.text = "score"
        label2.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        label2.font = UIFont(name: "HiraMinProN-W3", size: 25)
        label2.sizeToFit()
        label2.frame.size = CGSize(width: 300, height: 45)
        label2.center = self.view.center
        self.view.addSubview(label2)
        for family in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: family) {
                print(fontName)
            }
        }
        label2.backgroundColor = UIColor.white // 背景を白に変更
        label2.textColor = UIColor.blue // 文字色を青に変更
        
        label2.center = CGPoint(x: 875, y: 30) // UILabelの中央座標を (150, 100) にする
        
        label2.text = "所持金:0\n2行目"
        label2.numberOfLines = 0
        
            if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
