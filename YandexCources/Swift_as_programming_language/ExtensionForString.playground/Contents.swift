import UIKit

extension String {
    static func random(length: Int) -> String? {
        
        guard length > 0 else {
            return nil
        }

        let availableSymbols = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

        var generatedString = ""
        
        for _ in 0...length {
            generatedString += String(availableSymbols.randomElement()!)
        }
        
        return generatedString
    }
}
