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
    @IBOutlet weak var noteColorView: UIView!
    
    @IBAction func autoDeleteSwitchToggled(_ sender: Any) {
        datePicker.isHidden.toggle()
    }
    
    @IBAction func unwindToAddNote(segue: UIStoryboardSegue) {
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ColorPickerViewController,
            segue.identifier == "toColorPicker" {
            controller.initialColor = noteColorView.backgroundColor
            controller.configureColorCallback { [weak self] color in
                self?.noteColorView.backgroundColor = color
            }
        }
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        print("perform sefue")
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

