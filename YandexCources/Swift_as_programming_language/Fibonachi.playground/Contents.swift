import UIKit

func fibonachi (n: Int) -> Int? {
    
    var tempNum1 = 1
    var tempNum2 = 1
    var fibonachiNumber = 1
    
    if n <= 0 {
        return nil
    }
    
    if n > 0 && n <= 2 {
        return fibonachiNumber
    }
    
    for _ in 2..<n {
        fibonachiNumber = tempNum1 + tempNum2
        tempNum1 = tempNum2
        tempNum2 = fibonachiNumber
    }
    
    return fibonachiNumber
}

