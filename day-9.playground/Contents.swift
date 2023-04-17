import Cocoa



func greetUser() {
    print("Hi there!")
}

greetUser()

// Copy a function
var greetCopy: () -> Void = greetUser
greetCopy()


// Closure expression
let sayHello = {
    print("Hi there!")
}

sayHello()

// Parameter names are forgotten!
let sayName = {(name: String) -> Void in
    print("Hi \(name)")
}

// This causes an error.
//sayName(name: "You!")

// This works
sayName("World!")


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
