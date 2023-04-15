import Cocoa

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)


enum PasswordError: Error {
    case short
    case obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "1235"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.obvious {
    print("There was an error.")
} catch {
    // This can catch all other errors.
    print("There was an error: \(error)")
}
