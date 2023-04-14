import Cocoa


for i in 1...100 {
    var output: String = ""
    if (i % 3 == 0) {
        output += "Fizz"
    }
    if (i % 5 == 0) {
        output += "Buzz"
    }
    if output == "" {
        output = String(i)
    }
    print(output)
}
