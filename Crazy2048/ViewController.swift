//
//  ViewController.swift
//  Crazy2048
//
//  Created by mvarxer on 17/3/11.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer! = nil

    @IBOutlet weak var gameBoard: GameBoard!
    
    @IBOutlet weak var highestScore: TitleBlock!
    
    @IBOutlet weak var currentScore: TitleBlock!
    
    @IBOutlet weak var nextTile: NextTile!
    
    @IBAction func setting(_ sender: UIButton) {
    }
    
    @IBAction func restart(_ sender: UIButton) {
        currentScore.setStringValue(string: "0")
        nextTile.setNextNumber(n: 2)
        gameBoard.restart()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        
        let path = Bundle.main.path(forResource: "Pop", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDo(sender:)))
        upSwipe.direction = .up
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDo(sender:)))
        downSwipe.direction = .down
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDo(sender:)))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDo(sender:)))
        rightSwipe.direction = .right
        
        self.gameBoard.addGestureRecognizer(upSwipe)
        self.gameBoard.addGestureRecognizer(downSwipe)
        self.gameBoard.addGestureRecognizer(leftSwipe)
        self.gameBoard.addGestureRecognizer(rightSwipe)
        
        gameBoard.addTarget(self, action: #selector(gameisEnd), for: UIControlEvents.valueChanged)
        
        

    }
    
    func gameisEnd() {
        popEndView()
        currentScore.setStringValue(string: "0")
        nextTile.setNextNumber(n: 2)
        let high = max(highestScore.getValue(), gameBoard.getScore())
        highestScore.setStringValue(string: String(high))
        gameBoard.restart()
    }
    
    func popEndView() {
        let message = "本局得分\(gameBoard.getScore()),希望你下次取得好成绩。"
        let alertController = UIAlertController(title: "游戏结束", message: message, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "重新开始", style: .default, handler: nil)
        alertController.addAction(restartAction)
        self.present(alertController, animated: true, completion: nil)
        
    }


    func swipeToDo(sender:UISwipeGestureRecognizer) {
        
        audioPlayer.play()
        gameBoard.move(gesture: sender)  //计数移动
        nextTile.setNextNumber(n: gameBoard.getNextNumber())  //设置下一个数字
        currentScore.setStringValue(string: String(gameBoard.getScore())) //计数总分
    }
}

