//
//  ViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/20/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let note:Note = Note(title: "Visit Shift", content: "some information about shift", color: .black, importance: .important,selfDistractionDate: Date(timeInterval: 86400, since: Date()))
    
        if let distractionDate = note.selfDistractionDate {
            print(distractionDate)
            print(note.importance)
        } else {
            print("There is not self-distraction date")
        }
        
        var someString:String = "exampleStr"
        
    }


}

