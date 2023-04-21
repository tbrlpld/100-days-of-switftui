import Cocoa

// Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
// But there’s more:
// The Animal class should have a legs integer property that tracks how many legs the animal has.
// The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
// The Cat class should have a matching speak() method, again with each subclass printing something different.
// The Cat class should have an isTame Boolean property, provided using an initializer.


class Animal {
    let legsCount: Int
    
    init(legsCount: Int) {
        self.legsCount = legsCount
    }
    
    func speak() {
        print("...")
    }
}


class Dog: Animal {
    init() {
        super.init(legsCount: 4)
    }
    
    override func speak() {
        print("Whoof")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Wau")
    }
}


class Corgi: Dog {
    override func speak() {
        print("Yeap")
    }
}


class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool = false) {
        self.isTame = isTame
        super.init(legsCount: 4)
    }
    
    override func speak() {
        print("Miau")
    }
    
}

class Lion: Cat {
    override func speak() {
        print("Rooar")
    }
}

class Persian: Cat {
    override func speak() {
        print("Miiiiiaaaaauuu")
    }
    
}


let rex = Corgi()
rex.speak()
let bello = Poodle()
bello.speak()

let leo = Lion()
leo.speak()
print(leo.isTame)
let spazz = Persian(isTame: true)
spazz.speak()
print(spazz.isTame)
