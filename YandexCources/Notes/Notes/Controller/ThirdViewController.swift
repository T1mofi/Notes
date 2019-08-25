//
//  ThirdViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/23/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let notebook = FileNotebook()
    
    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifier = "NoteCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let note1:Note = Note(
                uid: "0",
                title: "First note title",
                content: """
                            First note
                            long
                            content
                            """,
                color: UIColor.yellow,
                importance: .important,
                selfDestructionDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()))

            let note2:Note = Note(
                uid: "1",
                title: "Second note title",
                content: "Second note content",
                color: UIColor.yellow,
                importance: .important,
                selfDestructionDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()))

            notebook.add(note1)
            notebook.add(note2)
        
        tableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ThirdViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notebook.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NoteTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Notes"
    }
    
}
