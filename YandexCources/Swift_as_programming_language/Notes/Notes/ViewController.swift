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
        
        let note:Note = Note(
            uid: "uid",
            title: "MyTitle",
            content: "MyContent",
            color: UIColor.black,
            importance: .important,
            selfDistractionDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()))
        
    
        print(note.json)
        
        let noteFromJSON = Note.parse(json: note.json)
        
        print("noteFromJSON JSON \(noteFromJSON?.json)")

    
        
        
    }


}

