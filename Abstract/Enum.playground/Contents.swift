import UIKit

enum Car {
    case bmw, audi, mercedes
}

var car:Car = .audi

switch car {
case .bmw:
    print("bmw")
default:
    print("not bmw")
}

enum ShoesSize {
    
    case rus(Int)
    case us(String)
    case chinice(Int,Float)
    
}

var dcShoesSize = ShoesSize.chinice(4, 2.5)

switch dcShoesSize {
    
    case .rus(_):
        print("rus \(dcShoesSize)")
    case .chinice(3..<5, let floatWidth):
        print("chinice \(floatWidth)")
    case .chinice(_, _):
        print("chinice general size \(dcShoesSize)")
    case .us(_):
        print("size \(dcShoesSize)")
}

enum RawIntEnum:Int {
    case one = 5, two, three
}

var number = RawIntEnum.one

print(number)
print(number.rawValue + 1)
