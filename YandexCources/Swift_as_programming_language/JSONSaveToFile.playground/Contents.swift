import Foundation
import UIKit



func saveToJsonFile() {
    // Get the url of Persons.json in document directory
    guard let documentDirectoryUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
    let fileUrl = documentDirectoryUrl.appendingPathComponent("Persons.json")
    
    let personArray =  ["uid": 3, "uid2": 4.2]
    
    // Transform array into data and save it into file
    
    do {
        let data = try JSONSerialization.data(withJSONObject: personArray, options: [])
        try data.write(to: fileUrl, options: [])
    } catch {
        print(error)
    }
    
    let personArray2 =  ["uid": 5, "uid2": 17.2]
    
    // Transform array into data and save it into file
    
    do {
        let data = try JSONSerialization.data(withJSONObject: personArray2, options: [])
        try data.write(to: fileUrl, options: [])
    } catch {
        print(error)
    }
}

func retrieveFromJsonFile() {
    guard let documentsDirectoryUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
    let fileUrl = documentsDirectoryUrl.appendingPathComponent("Persons.json")
  
    do {
        let data = try Data(contentsOf: fileUrl, options: [])
        guard let personArray = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
        print(personArray)
    } catch {
        print(error)
    }

}

saveToJsonFile()
retrieveFromJsonFile()


