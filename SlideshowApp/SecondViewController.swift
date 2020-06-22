//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 林将智 on 2020/06/15.
//  Copyright © 2020 林将智. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var secondImage: UIImageView!
    
    //画像の名前の配列
    let imageNameArray = ["image01","image02","image03"]
   
    var result:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondImage.image = UIImage(named: imageNameArray[result])
        
//        UIImageView.image = result
        
     
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
