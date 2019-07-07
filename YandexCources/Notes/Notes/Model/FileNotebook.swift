//
//  FileNotebook.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/30/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import Foundation

class FileNotebook {
    private(set) var notes = [String: Note]()
    
    public func add(_ note: Note) {
        notes[note.uid] = note
    }
    
    public func remove(with uid: String) {
        notes.removeValue(forKey: uid)
    }
    
    public func saveToFile() {
        guard let documentDirectoryUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("Notes.json")
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
        }
    }
    
    public func loadFromFile() {
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentsDirectoryUrl.appendingPathComponent("Notes.json")

        do {
            let data = try Data(contentsOf: fileUrl, options: [])
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: [String: Any]] else { return }
            retrieveNotesFromJson(json: json)
        } catch {
            print(error)
        }
        
    }
}



extension FileNotebook {
    var json: [String: [String: Any]] {
        var dictJson = [String: [String: Any]]()
        
        for (uid, note) in notes {
            dictJson[uid] = note.json
        }
        
        return dictJson
    }
    
    func retrieveNotesFromJson(json: [String: [String: Any]]) {
        for key in json.keys {
            self.add(Note.parse(json: json[key]!)!)
        }
    }
}
