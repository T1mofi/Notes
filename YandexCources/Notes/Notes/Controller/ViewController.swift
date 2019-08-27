//
//  ViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/20/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func switchToggled(_ sender: Any) {
        datePicker.isHidden.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

