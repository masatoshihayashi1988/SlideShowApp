//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 林将智 on 2020/06/15.
//  Copyright © 2020 林将智. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var backImage: UIButton!
    @IBOutlet weak var startStop: UIButton!
    
    //表示している画像の番号
    var displayImageNo = 0
        //画像の名前の配列
    let imageNameArray = ["image01","image02","image03"]
  
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初期画面の設定
        let image = UIImage (named: "image01")
        
        //上段の定数をimage viewに移行
        imageView.image = image
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のSecondViewControllerを取得する(定型文）
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        // 遷移先のsecondViewControllerで宣言しているresultに値を代入して渡す
        secondViewController.result = displayImageNo
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextImage.isEnabled = true
            backImage.isEnabled = true
        }
    }
    //表示している画像の番号を元に画像を表示する　関数
    func displayImage(){
        
        //表示している画像の番号から名前を取り出す
        let name = imageNameArray[displayImageNo]
        
        //画像の読み込み
        let image = UIImage(named: name)
        
        //imageViewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    @IBAction func nextImagetap(_ sender: Any) {
        //条件
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    @IBAction func backImagetap(_ sender: Any) {
        
        if displayImageNo != 0 {
            // 表示している画像の番号を1減らす
            displayImageNo -= 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }  else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
 
    }
    
    @IBAction func startStoptap(_ sender: Any) {
       
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoPlay(_:)), userInfo: nil, repeats: true)
    
            //ボタンを使用不可にする
            nextImage.isEnabled = false
            backImage.isEnabled = false
        //ボタンの文字の変更
        startStop.setTitle("停止", for: .normal)
        
        
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextImage.isEnabled = true
            backImage.isEnabled = true
            //ボタンの文字の変更
            startStop.setTitle("再生", for: .normal)        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        startStop.setTitle("再生/停止", for: .normal)
        
    }
    
    @objc func autoPlay(_ timer: Timer) {
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
            
        }
    }

}

