//
//  ViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/20/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var verticalGameObjectLayout: NSLayoutConstraint!
    @IBOutlet weak var horisontalGameObjectLayout: NSLayoutConstraint!
    
    private var isGameActive: Bool = false
    private var isGamePaused: Bool = false
    
    private var gameTimeLeft: TimeInterval = 0
    private var gameTimer: Timer?
    
    private var moveImageTime: TimeInterval = 2
    private var moveGameObjectTimer: Timer?
    
    private var gameScore: Int = 0
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        timerLabel.text = String("Game time \(Int(sender.value)) sec")
    }
    
    //One button have different usage scenarios
    @IBAction func startStopButtonClicked(_ sender: Any) {
//        if isGameActive == true {
//            pauseGame()
//        } else {
//            if isGamePaused == true {
//                resumeGame()
//            } else {
//                startGame()
//            }
//        }
    }
    
    
    @IBAction func gameObjectTapped(_ sender: UITapGestureRecognizer) {
//        moveGameObjectWithTimer()
    }
    
//    func startGame() {
//        gameTimeLeft = stepper.value
//        timerLabel.text = "\(Int(gameTimeLeft)) sec left"
//
//        //Configurate main game timer
//        gameTimer?.invalidate()
//        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(gameTimerTick), userInfo: nil, repeats: true)
//
//        moveGameObjectWithTimer()
//
//        gameScore = 0
//        gameImage.isUserInteractionEnabled = true
//        isGameActive = true
//        stepper.isEnabled = false
//
//        //Rename general button for reuse
//        startStopButton.setTitle("Pause", for: .normal)
//    }
//
//    //Configurate timer for move object with certain Time
//    func moveGameObjectWithTimer() {
//        moveGameObjectTimer?.invalidate()
//        moveGameObjectTimer = Timer.scheduledTimer(timeInterval: moveImageTime, target: self, selector: #selector(moveGameObject), userInfo: nil, repeats: true)
//        moveGameObjectTimer?.fire()
//
//        gameScore += 1
//        scoreLabel.text = String(gameScore)
//    }
//
//    //Update left time, or end game
//    @objc private func gameTimerTick() {
//
//        gameTimeLeft -= 1
//
//        if gameTimeLeft > 0 {
//            timerLabel.text = "\(Int(gameTimeLeft)) sec left"
//        } else {
//            stopGame()
//        }
//    }
//
//    //Move game object within the field
//    @objc private func moveGameObject() {
//        let maxHorisontalOffcet = withImageView.bounds.maxX - gameImage.frame.width
//        let maxVerticalOffcet = withImageView.bounds.maxY - gameImage.frame.height
//
//        horisontalGameObjectLayout.constant = CGFloat(arc4random_uniform(UInt32(maxHorisontalOffcet)))
//        verticalGameObjectLayout.constant = CGFloat(arc4random_uniform(UInt32(maxVerticalOffcet)))
//    }
//
//    private func pauseGame() {
//        gameTimer?.invalidate()
//        moveGameObjectTimer?.invalidate()
//
//        gameImage.isUserInteractionEnabled = false
//        isGamePaused = true
//        isGameActive = false
//
//        //Rename general button for reuse
//        startStopButton.setTitle("Resume", for: .normal)
//    }
//
//    private func resumeGame() {
//        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(gameTimerTick), userInfo: nil, repeats: true)
//        moveGameObjectTimer = Timer.scheduledTimer(timeInterval: moveImageTime, target: self, selector: #selector(moveGameObject), userInfo: nil, repeats: true)
//        moveGameObjectTimer?.fire()
//
//        gameImage.isUserInteractionEnabled = true
//        isGameActive = true
//        isGamePaused = false
//
//        //Rename general button for reuse
//        startStopButton.setTitle("Pause", for: .normal)
//    }
//
//    private func stopGame() {
//        gameTimer?.invalidate()
//        moveGameObjectTimer?.invalidate()
//        gameTimeLeft = 0
//
//        gameImage.isUserInteractionEnabled = false
//        isGameActive = false
//        isGamePaused = false
//
//        stepper.isEnabled = true
//        timerLabel.text = "Time left"
//        startStopButton.setTitle("Restart", for: .normal)
//    }
    
    

    
    
    
    
    
    ///////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let note:Note = Note(
            title: "MyTitle",
            content: "MyContent",
            color: UIColor.yellow,
            importance: .important,
            selfDestructionDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()))
        
        let note2:Note = Note(
            title: "MyTitle",
            content: "MyContent",
            color: UIColor.yellow,
            importance: .important,
            selfDestructionDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()))
        
    
        print(note.json)
        print("Note json\n")
        
        let noteFromJSON = Note.parse(json: note.json)
        print(noteFromJSON?.json ?? "nil")
        print("noteFromJSON json\n")
        
    
        let notebook = FileNotebook()
        
        notebook.add(note)
        notebook.add(note2)
        
        notebook.saveToFile()
        
        for key in notebook.notes.keys {
            notebook.remove(with: key)
        }
        
        notebook.loadFromFile()


    }
}

