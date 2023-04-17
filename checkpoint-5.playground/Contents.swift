import Cocoa

let luckyNumbers = [7, 14, 38, 21, 16, 15, 12, 33, 31, 49]

let oddLuckyNumbers = luckyNumbers.filter { $0 % 2 != 0 }
let ascendingOddLuckyNumbers = oddLuckyNumbers.sorted()
ascendingOddLuckyNumbers.map { print("\($0) is a lucky number") }

// As a chain
luckyNumbers
    .filter { !$0.isMultiple(of: 2) }
    .sorted()
    .map { print("\($0) is a lucky number") }
