import Cocoa

let root = sqrt(193)

print(root)


Set("This")

func containSameLetters(base: String, comparison: String) -> Bool {
    // Return true if the letters in the two strings are the same regarless of the order.
    return base.sorted() == comparison.sorted()
}

containSameLetters(base: "abc", comparison: "bca") == true
containSameLetters(base: "abc", comparison: "bcd") == false
containSameLetters(base: "abc", comparison: "abcd") == false


func getUser() -> (id: Int, name: String) {
    return (2, "left hand")
}
let user = getUser()
print("\(user.id): \(user.name)")

let (theid, thename) = getUser()
print("\(theid): \(thename)")


func isUppercase(_ thestring: String) -> Bool {
    return thestring == thestring.uppercased()
}
print(isUppercase("This is not all upper case"))
print(isUppercase("I AM SCREAMING!"))


func isAlsoUppercase(mystring thestring: String) -> Bool {
    return thestring == thestring.uppercased()
}
print(isAlsoUppercase(mystring: "This is not all upper case"))
print(isAlsoUppercase(mystring: "I AM SCREAMING!"))
