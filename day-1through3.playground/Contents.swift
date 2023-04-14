import Cocoa

var greeting = "Hello, playground"

print(greeting)

let actor = "Denzel Washington"

let result = "⭐️ You win!"

result.count
print(result.uppercased())
print(result)


let number = 120
number.isMultiple(of: 7)

let sum = 0.1 + 0.2
print(sum)

let a = 1
let b = 2.0
let c = Double(a) + b
print(c)
let c2 = a + Int(b)
print(c2)

var gameOver = false
gameOver.toggle()
 
let emptyArray = [String]()

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
print(employee["name"])
print(employee["name", default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille"] = 216
heights["LeBron James"] = 206
print(heights)


let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)

var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")


enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday
// day = Weekday.doesnotexist

day = .wednesday
