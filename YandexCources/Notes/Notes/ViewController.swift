//
//  ViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/20/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var gameTimeLeft: TimeInterval = 0
    private var gameTimer: Timer?
    private var moveGameObjectTimer: Timer?
    
    @IBOutlet weak var gameControlView: GameControlView!
    @IBOutlet weak var gameFieldView: GameFieldView!
//    @IBOutlet weak var timerLabel: UILabel!
//    @IBOutlet weak var scoreLabel: UILabel!
//    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var startStopButton: UIButton!
    
    private var isGameActive: Bool = false
    private var isGamePaused: Bool = false
    
    private var gameScore: Int = 0
    
//    @IBAction func stepperChanged(_ sender: UIStepper) {
//        timerLabel.text = String("Game time \(Int(sender.value)) sec")
//        gameTimeLeft = sender.value
//    }
    
    //One button have different usage scenarios
    @IBAction func startStopButtonClicked(_ sender: Any) {
        if isGameActive == true {
            pauseGame()
        } else {
            if isGamePaused == true {
                resumeGame()
            } else {
                startGame()
            }
        }
    }
    
    func gameObjectTapped() {
        guard isGameActive else { return }
        
        gameScore += 1
        moveGameObjectWithTimer()
    }
    
    func updateUI() {
        gameControlView.stepper.isEnabled = !isGameActive
        gameFieldView.isObjectHidden = !isGameActive
        gameControlView.scoreLabel.text = String(gameScore)
        
        if isGameActive == true {
            startStopButton.setTitle("Pause", for: .normal)
        } else {
            if isGamePaused == true {
                startStopButton.setTitle("Resume", for: .normal)
            } else {
                gameTimeLeft = gameControlView.stepper.value
                gameControlView.gameTimeLabel.text =  "Game time \(Int(gameTimeLeft)) sec"
                gameControlView.scoreLabel.text = "0"
                startStopButton.setTitle("Start", for: .normal)
            }
        }
    }
    
    
    func startGame() {
        gameTimeLeft = gameControlView.stepper.value
        isGameActive = true
        
        //Configurate main game timer
        gameTimer?.invalidate()
        runGameTimer()

        //start moving object
        moveGameObjectWithTimer()

        gameScore = 0
        
        updateUI()
    }
    
    private func pauseGame() {
        isGamePaused = true
        isGameActive = false
        
        gameTimer?.invalidate()
        moveGameObjectTimer?.invalidate()
    
        updateUI()
    }
    
    private func resumeGame() {
        isGameActive = true
        isGamePaused = false
        
        runGameTimer()
        runMoveGameObjectTimer()
        moveGameObjectTimer?.fire()

        updateUI()
    }
    
    private func stopGame() {
        isGameActive = false
        isGamePaused = false
        
        gameTimer?.invalidate()
        moveGameObjectTimer?.invalidate()
        gameTimeLeft = 0
        
        updateUI()
    }

    //Configurate timer for move object with certain Time
    func moveGameObjectWithTimer() {
        moveGameObjectTimer?.invalidate()
        runMoveGameObjectTimer()
        moveGameObjectTimer?.fire()

//        gameScore += 1
        gameControlView.scoreLabel.text = String(gameScore)
    }

    ///////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameFieldView.layer.borderWidth = 1
        gameFieldView.layer.cornerRadius = 5
        gameFieldView.layer.borderColor = UIColor.black.cgColor
        
        gameFieldView.objectHitHandler = { [weak self] in self?.gameObjectTapped()}
        
        updateUI()
        
        // Do any additional setup after loading the view.

//        let note:Note = Note(
//            title: "MyTitle",
//            content: "MyContent",
//            color: UIColor.yellow,
//            importance: .important,
//            selfDestructionDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()))
//
//        let note2:Note = Note(
//            title: "MyTitle",
//            content: "MyContent",
//            color: UIColor.yellow,
//            importance: .important,
//            selfDestructionDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()))
//
//
//        print(note.json)
//        print("Note json\n")
//
//        let noteFromJSON = Note.parse(json: note.json)
//        print(noteFromJSON?.json ?? "nil")
//        print("noteFromJSON json\n")
//
//
//        let notebook = FileNotebook()
//
//        notebook.add(note)
//        notebook.add(note2)
//
//        notebook.saveToFile()
//
//        for key in notebook.notes.keys {
//            notebook.remove(with: key)
//        }
//
//        notebook.loadFromFile()
    }
}

extension ViewController {
    private func runGameTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(gameTimerTick),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    private func runMoveGameObjectTimer() {
        moveGameObjectTimer = Timer.scheduledTimer(timeInterval: 2,
                                                   target: self,
                                                   selector: #selector(moveGameObject),
                                                   userInfo: nil,
                                                   repeats: true)
    }

    //Update left time, or end game
    @objc private func gameTimerTick() {
        gameTimeLeft -= 1
        
        if gameTimeLeft > 0 {
        gameControlView.gameTimeLabel.text = "\(Int(gameTimeLeft)) sec left"
        } else {
            stopGame()
        }
    }
    
    //Move game object within the field
    @objc private func moveGameObject() {
        print("run changeObjectPosition")
        gameFieldView.changeObjectPosition()
    }
    
}

