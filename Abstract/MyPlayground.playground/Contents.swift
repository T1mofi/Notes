import UIKit

var str = "Hello, playground"



//switch statment
switch str {
case "Hello, playground":
    print("nice")
default:
    print("do not nice")
}



//for loop
print(str)
for index in 1...5 {
    print(str + String(index));
}



//elementary func
func sayHello() {
    print(str)
}

sayHello()



//func with params
func sayHello(_ name:String, _ age:Int) {
    print("Hello \(name), you're \(age) years old.")
}

sayHello("Tim", 18)



//func with return value
func addTwoTo(x:Int) -> Int {
    return x + 2
}

print(addTwoTo(x: 10))



//class
class Car {
    private var fuelLavel:Int = 100
    
    func getFuelLavel() -> Int {
        return fuelLavel
    }
}

var car = Car()
print(car.getFuelLavel())



//subclass
class BMW: Car {
    override func getFuelLavel() -> Int {
        return super.getFuelLavel() + 1
    }
}

var bmw = BMW()
print(bmw.getFuelLavel())



//arrays
var arr = [1,2,3,4]
print(arr[1])
arr.append(5)
print(arr[arr.count - 1])

var arr2 = [String]()
arr2.append("someStr")
arr2 += ["someStr2"]
print(arr2)
arr2.remove(at: 0)
print(arr2)



//optionals
var someInt:Int?
var someString:String? = "notNil"
var car1:Car?

if someString != nil {
    print(someString!)
}

if someString == nil {
    print("someString contain nil")
}

if let tempString = someString {
    print(tempString)
}



//can be nil without optional
var str2:String! = "notOptionalString"

str2 = nil
print(str2)



//dictionary
var myDictionary = ["key":"data", "abc":"value"]
var emptyDictionary = [String:String]()

if let tempString = myDictionary["key"] {
    print(tempString)
} else {
    print("there isn't key")
}

myDictionary["newKey"] = "someNewData"
print(myDictionary["newKey"]!)

myDictionary["key"] = "updateData"
print(myDictionary["key"]!)

myDictionary["key"] = nil




//for
var animalArray = ["Cat","Dog","Rat"]
var animalDictionary = ["Tim":"Cat","Baloon":"Dog","Larisca":"Rat"]

for animal in animalArray {
    print(animal)
}

for (name, animal) in animalDictionary {
    print("\(name) is a \(animal)")
}

for i in 1...10 {
    print(i)
}

for index in 0...animalArray.count - 1 {
    print(animalArray[index])
}

var randomArray = [Int]()

for _ in 1...10 {
    let randomNumber = arc4random_uniform(10)
    randomArray.append(Int(randomNumber))
}

print(randomArray)

randomArray.removeAll()

repeat {
    let randomNumber = arc4random_uniform(10)
    
    if randomArray.contains(Int(randomNumber)) == false {
        randomArray.append(Int(randomNumber))
    }
} while randomArray.count < 10

print(randomArray)



//Protocol
protocol PoliceCodes {
    func nineOhTwo() 
}

class Officer {
    var radio:PoliceCodes?
    
    func callItIn() {
        radio?.nineOhTwo()
    }
}

class Dispatcher: PoliceCodes {
    func nineOhTwo() {
        print("902 received and handled")
    }
}

let officer = Officer()
let dispatcher = Dispatcher()

officer.radio = dispatcher
officer.callItIn()
