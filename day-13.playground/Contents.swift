import Cocoa

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}


let twopointzero = 2.0
let two = 2
twopointzero == twopointzero
two == two
// This does not work, because of the different types.
//two == twopointzero


func trim(_ string: String) -> String {
    return string.trimmingCharacters(in: .whitespacesAndNewlines)
}

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() -> Void {
        self = self.trimmed()
    }
}

let quote = "  There is whitespace around.  "

quote.trimmed()
quote

var otherQuote = " There is also whitespace here  "
otherQuote.trim()
otherQuote


protocol SuperHeroMovie {
    func writeScript() -> String
}
extension SuperHeroMovie {
    func makeScript() -> String {
        return """
        Lots of special effects,
        some half-baked jokes,
        and a hint of another
        sequel at the end.
        """
    }
}
