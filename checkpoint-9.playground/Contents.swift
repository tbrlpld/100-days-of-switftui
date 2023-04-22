import Cocoa

// Your challenge is this:
// write a function that accepts an optional array of integers,
// and returns one randomly.
// If the array is missing
// or empty, return a random number in the range 1 through 100.
//
// If that sounds easy, it’s because I haven’t explained the catch yet:
// I want you to write your function in a single line of code.
// No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.


func getRandomInt(_ array: [Int]?) -> Int {
    array?.randomElement() ?? getRandomInt(Array(1...100))
}

print(getRandomInt(nil))
print(getRandomInt([]))
print(getRandomInt([1, 2, 3]))


func getRandomInt2(_ array: [Int?]?) -> Int {
    if let array = array {
        if let elem = array.randomElement() {
            // .randomElement returns an optional. If the array is empty, it's nil.
            // But even if the array is not empty, the element may be nil, because that is a possible value for elements of the array.
            // Therefore, we need to unwrap the element again.
            if let elem = elem {
                return elem
            }
        }
    }
    return getRandomInt(Array(1...100))
}

print(getRandomInt2(nil))
print(getRandomInt2([]))
print(getRandomInt2([nil, nil]))
print(getRandomInt2([1, 2, 3]))
