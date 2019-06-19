import UIKit

enum MoveDirection {
    case forward
    case backward
    case left
    case right
}

struct Coordinate {
    var x: Int
    var y: Int
    
    init(x:Int = 0, y:Int = 0) {
        self.x = x
        self.y = y
    }
}

struct Go {
    let moveDirection:MoveDirection
    let distance:Int
}

class Car {
    let mark:String
    let model:String
    let power:Int
    var coordinate:Coordinate
    
    init(mark:String, model:String, power:Int, coordinate:Coordinate) {
        self.mark = mark
        self.model = model
        self.power = power
        self.coordinate = coordinate
    }
    
    func execute(go:Go) {
        switch go.moveDirection {
        case .forward:
            moveForward(distance: go.distance)
        case .backward:
            moveBackward(distance: go.distance)
        case .left:
            moveLeft(distance: go.distance)
        case .right:
            moveRight(distance: go.distance)
        }
    }
    
    func moveLeft(distance:Int) {
        coordinate.x -= distance
    }
    
    func moveRight(distance:Int) {
        coordinate.x += distance
    }
    
    func moveForward(distance:Int) {
        coordinate.y += distance
    }
    
    func moveBackward(distance:Int) {
        coordinate.y -= distance
    }
}

var car = Car(mark: "BMW", model: "e53", power: 250, coordinate: Coordinate(y: 5))
    
car.execute(go: Go(moveDirection: .right, distance: 17))

