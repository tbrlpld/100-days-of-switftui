import Cocoa

// * Create a struct to store informatoinabout a car. Include:
//   * Model
//   * Number of seats
//   * Current grear
// * Add a method to change gears up or down.
// * What variables should be public and private.
// * Don't allow invalid gears - 1..10 seems a fair range

enum ShiftError: Error {
    case gearTooHigh
    case gearTooLow
}

struct Car {
    let model: String
    let seatCount: Int
    static let minGear: Int = 0
    static let maxGear: Int = 10
    // I am using private(set) for gear, becuase the driver needs access to the current gear.
    // But, the changing of the gear needs to go through the shift methdo.
    private(set) var currentGear: Int = 0  // 0 is for neutral
    
    mutating func shift(to newGear: Int) throws {
        if newGear < Car.minGear {
            throw ShiftError.gearTooLow // I imagine these error sounding like trying to put a gear in without having the clutch pressed 😅
        } else if newGear > Car.maxGear {
            throw ShiftError.gearTooHigh
        }
        currentGear = newGear
    }
}

let modelX = Car(model: "X", seatCount: 7)
var q3 = Car(model: "Q3", seatCount: 5)

print(q3.currentGear)
try! q3.shift(to: 1)
print(q3.currentGear)
try! q3.shift(to: 5)
print(q3.currentGear)
try? q3.shift(to: 11)
print(q3.currentGear)
