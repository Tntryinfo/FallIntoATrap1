//
//  ViewController.swift
//  testView
//
//  Created by TakumaNishioka on 2018/06/12.
//  Copyright © 2018年 TakumaNishioka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var startTime: Double = 0.0

    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonStart(_ sender: Any) {
        // 開始した時刻の記録
        startTime = Date().timeIntervalSince1970
        print(startTime)
        // ラベルを更新
        labelTimer.text = "00:10"
        // 0.01秒ごとにupdateLabel()を呼び出す
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        button.isEnabled = false
    }
    
    @objc func updateLabel() {
        // 経過した時間を、現在時刻-開始時刻で算出
        let elapsedTime = Date().timeIntervalSince1970 - startTime
        // 小数点以下を切り捨てる
        let flooredErapsedTime = Int(floor(elapsedTime))
        // 残り時間
        let leftTime = 10 - flooredErapsedTime
        // ラベルに表示する残り時間
        let displayString = NSString(format: "00:%02d" , leftTime) as String
        // ラベルを更新
        labelTimer.text = displayString
        print("elapsedTime = \(elapsedTime) flooredErapsedTime = \(flooredErapsedTime) leftTime = \(leftTime) displayString = \(displayString)")
        
        
        // 残り0秒になった時点の処理
        if leftTime == 0 {
            // タイマーを止める
            timer.invalidate()
            // アラートを表示する
            let alert = UIAlertController(title: "完了", message: "10秒経ちました。", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            // buttonを押下できるようにする
            button.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

