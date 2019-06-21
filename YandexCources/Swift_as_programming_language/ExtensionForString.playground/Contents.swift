import UIKit

extension String {
    static func random(length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        
        let symbols:NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
        var generatedString = ""
        
        for _ in 0...length {
            let randomIndex:Int = Int.random(in: 3...symbols.length)
            var character = symbols.character(at: randomIndex)
            
            generatedString += NSString(characters: &character, length: 1) as String
        }
        
        return generatedString
    }
}
