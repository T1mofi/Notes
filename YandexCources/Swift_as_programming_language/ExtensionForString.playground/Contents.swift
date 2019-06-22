import UIKit

extension String {
    static func random(length: Int) -> String? {
        
        guard length > 0 else {
            return nil
        }
        
        let symbols = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
        var generatedString = ""
        
        for _ in 0...length {
            generatedString += String(symbols.randomElement()!)
        }
        
        return generatedString
    }
}
