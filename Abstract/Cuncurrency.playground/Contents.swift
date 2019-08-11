import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let userQueue1 = DispatchQueue(label: "com.t1mofi.userQueue1", qos: .userInteractive, attributes: .concurrent)

let userQueue2 = DispatchQueue(label: "com.t1mofi.userQueue2", qos: .userInteractive, attributes: .concurrent)

func task(symbol: String) {
    for i in 1...10 {
        print("\(symbol) \(i) priority  = \(qos_class_self().rawValue)")
    }
}

func taskHIGH(symbol: String) {
    print("\(symbol) priority  = \(qos_class_self().rawValue)")
}

let highPriorityItem = DispatchWorkItem(qos: .background) {
    taskHIGH(symbol: "❤️")
}

userQueue1.async {
    task(symbol: "🐊")
}

userQueue1.async(execute: highPriorityItem)

userQueue1.async(execute: highPriorityItem)

task(symbol: "🤡")

userQueue2.sync {
    task(symbol: "🤖")
}


sleep(2)
