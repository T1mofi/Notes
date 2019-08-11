import UIKit

var counter = 0

let lock = NSLock()

let group = DispatchGroup()

var thread1 = Thread{
    for _ in 1...1000 {
        group.enter()
        lock.lock()
        counter += 1
        lock.unlock()
        group.leave()
    }
    
}

var thread2 = Thread{
    for _ in 1...1000 {
        group.enter()
        lock.lock()
        counter += 1
        lock.unlock()
        group.leave()
    }
    
}

thread1.start()
thread2.start()

group.wait()

print(counter)

