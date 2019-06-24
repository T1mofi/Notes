import UIKit

func calcLetters(str: String) -> [Character: Int] {
    var lettersStorage = [Character: Int]()

    for letter in str {
        if let numberOFLetters = lettersStorage[letter] {
            lettersStorage[letter]  = numberOFLetters + 1
        } else {
            lettersStorage[letter] = 1
        }
    }
    
    return lettersStorage
}

