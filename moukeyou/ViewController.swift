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
        
        let sound_data = NSURL(fileURLWithPath:Bundle.mainBundle().pathForResource("sumple", ofType: "mp3")!)
        var audioPlayer: AVAudioPlayer = AVAudioPlayer(contentsOfURL: sound_data, error: nil)
        audioPlayer.play()
    }
}


