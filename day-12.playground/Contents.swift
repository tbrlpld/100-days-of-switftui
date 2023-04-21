import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
}

class Developer: Employee {
    func work() {
        print("I write code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I got to meetings code for \(hours) hours.")
    }
}

let michaelBolton = Developer(hours: 8)
michaelBolton.work()
let lumbergh = Manager(hours: 5)
lumbergh.work()

class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}


class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}


var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")
