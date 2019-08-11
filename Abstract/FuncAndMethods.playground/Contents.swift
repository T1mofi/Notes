import UIKit

var number: Int = 5

print(number)

@discardableResult
func changeNumber(number: inout Int ) -> String {
    
    number += 1
    
    return "Congratulate!"
    
}

changeNumber(number: &number)

print(number)



//high level functions

func greeting() -> String {
    return "Hello"
}

func parting() -> String {
    return "Good bye"
}

type(of: greeting())
type(of: parting())

var function: () -> String = greeting

print(function())

function = parting

print(function())

class IntHandler {
    
    private var number:Int = 0
    
    func getNumber() -> Int {
        return number
    }
    
    func setNumber(number:Int) {
        self.number = number
    }
}

var num:IntHandler = IntHandler()

print(num.getNumber())

num.setNumber(number: 5)

print(num.getNumber())


