//
//  ViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/20/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var noteColorView: UIView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func autoDeleteSwitchToggled(_ sender: Any) {
        datePicker.isHidden.toggle()
    }
    
    @IBAction func unwindToAddNote(segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ColorPickerViewController,
                                        segue.identifier == "toColorPicker" {
                //setUP colorPickerView
                controller.initialColor = noteColorView.backgroundColor
            
                //callBack for update noteColor
                controller.configureColorCallback { [weak self] color in
                    self?.noteColorView.backgroundColor = color
                }
        }
    }
    
    
    override func viewDidLoad() {
        
        setupKeyboardDissappear()
        
        

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
    func setupKeyboardDissappear() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        
        view.addGestureRecognizer(tap)
        
        //Dissapear keyboard by tapping on screen
        titleTextField.delegate = self
    }
    
    //Dissapear keyboard on text field through RETURN button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        
        return true
    }
}

