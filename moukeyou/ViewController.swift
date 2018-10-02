//
//  ViewController.swift
//  moukeyou
//
//  Created by tcs14049 on 2018/09/27.
//  Copyright © 2018年 tcs14048. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSound(sender: AnyObject) {
        // 再生する音声ファイルを指定する
        let soundURL = Bundle.mainBundle.ForResource("sound", withExtension: "mp3")
        do {
            // 効果音を鳴らす
            player = try AVAudioPlayer(contentsOfURL: soundURL!)
            player?.play()
        } catch {
            print("error...")
        }
    }
}
