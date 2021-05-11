//
//  ResultViewController.swift
//  GachaTech
//
//  Created by 安念　玉希 on 2021/05/11.
//  Copyright © 2021 安念　玉希. All rights reserved.
//

import UIKit

import AVFoundation

class ResultViewController: UIViewController {

     let symbalSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "symbal")!.data)
    
    @IBOutlet var haikeiImageView: UIImageView!
    
    @IBOutlet var monsterImageView: UIImageView!
    
    @IBOutlet var monsterName : UILabel!
    
    var monsterArry:[UIImage]!
    
    var monsterNameArry:[String] = ["１号", "２号", "３号", "４号", "５号", "６号", "７号", "８号", "９号", "１０号",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number = Int.random(in: 0..<10)
        
        monsterArry = [UIImage(named:"monster001.png")!,
                       UIImage(named:"monster002.png")!,
                       UIImage(named:"monster003.png")!,
                       UIImage(named:"monster004.png")!,
                       UIImage(named:"monster005.png")!,
                       UIImage(named:"monster006.png")!,
                       UIImage(named:"monster007.png")!,
                       UIImage(named:"monster008.png")!,
                       UIImage(named:"monster009.png")!,
                       UIImage(named:"monster010.png")!,]
    
        monsterImageView.image = monsterArry[number]
        
       monsterName.text = monsterNameArry[number]
        
        if number == 9{
            haikeiImageView.image = UIImage(named:  "bg_gold.png")
            
        } else if number > 6 {
             haikeiImageView.image = UIImage(named:  "bg_red.png")
        } else {
             haikeiImageView.image = UIImage(named:  "bg_blue.png")
        }
        
        symbalSoundPlayer.play()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let animation = CABasicAnimation(keyPath:"transform")
        animation.fromValue = NSNumber(value: 0)
        animation.toValue = NSNumber(value: 2 * Double.pi)
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        animation.duration = 5
        animation.repeatCount = Float.infinity
        haikeiImageView.layer.add(animation, forKey: nil)
    }
    
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
