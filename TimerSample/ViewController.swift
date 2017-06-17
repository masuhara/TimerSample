//
//  ViewController.swift
//  TimerSample
//
//  Created by Masuhara on 2017/06/17.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer: Timer!
    var isStarted = false
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTimer() {
        if isStarted == false {
            // スタートしている状態で押した場合
            
            if timer != nil {
                // タイマーがすでに走っていた場合はタイマーを破棄
                timer.invalidate()
            }
            
            // タイマーを走らせる
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            
            isStarted = true
            startButton.setTitle("ストップ", for: .normal)
            
        } else {
            // スタートしている状態で押した場合
            timer.invalidate()
            isStarted = false
            startButton.setTitle("スタート", for: .normal)
        }
        
    }

    func update() {
        counter = counter + 0.01
        print(counter)
        timerLabel.text = String(format: "%.2f", counter)
    }

}

