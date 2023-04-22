import Cocoa

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

print(type(of: peachOpposite))


func square(number: Int){
    number * number
}

let number: Int? = nil

// This does not work, because the number is optional.
//print(square(number: number))

if let unwrappedNumber = number {
    print("The number is something")
    print(square(number: unwrappedNumber))
} else {
    print("The number is nothing")
}


// What happens if I just use if?
if number == nil {
    print("Nothing")
}


var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

enum ValueError: Error {
    case noValue
}

guard let unwrappedWithGuard = myVar else {
    print("Run if myVar doesn't have a value inside")
    throw ValueError.noValue
}

// Because we used guard to unwrap, the constant is available here.
print(unwrappedWithGuard)


let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
print(new)


let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased()
if let chosen = chosen {
    print("Next in line: \(chosen)")
}


enum UserError: Error {
    case badID
    case networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 1) {
    print("We got the user: \(user)")
}

let user = (try? getUser(id: 1)) ?? "Anonymous"
