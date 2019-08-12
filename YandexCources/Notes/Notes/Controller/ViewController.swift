//
//  ViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/20/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func showScreenButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ShowSecondScreen", sender: nil)
    }
    
    @IBAction func unwindToSrartScreen(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SecondViewController,
        segue.identifier == "ShowSecondScreen" {
            controller.text = "Super Mega Text"
        }
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

