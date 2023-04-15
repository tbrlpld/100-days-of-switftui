import Cocoa

// Write a function to compute the integer square root of any integet between 1 and 10_000.

// How do you calculate a square root.
// x * x = x^2
// sqrt(x^2) = x
// sqrt(x * x) = x
// sqrt(x) * sqrt(x) = x
// sqrt(x) = x / sqrt(x)

// No idea. I guess it's easier to just brute force.

enum RootError: Error {
    case outOfBounds
    case noRoot
}

func introot(of number: Int) throws -> Int {
    let lowerLimit = 0
    let upperLimit = 10_000
    if number <= lowerLimit || number > upperLimit {
        throw RootError.outOfBounds
    }
    
    var test: Int = 1
    var square: Int
    repeat {
        square = test * test
        if square == number {
            return test
        }
        test += 1
    } while square < upperLimit
    
    throw RootError.noRoot
}

do {
    try introot(of: 10_001)
    assert(false)
} catch RootError.outOfBounds {
    assert(true)
}
do {
    try introot(of: 0)
    assert(false)
} catch RootError.outOfBounds {
    assert(true)
}
assert(try! introot(of: 9) == 3)
assert(try! introot(of: 25) == 5)
do {
    try introot(of: 5)
    assert(false)
} catch RootError.noRoot {
    assert(true)
}
