import UIKit

var numbers = [13,35,2]

numbers.map({ (number:Int) -> Int in
    let result = 3 * number
    return result
})

func counterFunc() -> (Int) -> Int {
    var counter = 0
    
    func innerFunc(i:Int) -> Int {
        counter += i
        return counter
    }
    
    return innerFunc
}

let closure = counterFunc()

var numberius = closure(10)
numberius += 1

closure(4)


