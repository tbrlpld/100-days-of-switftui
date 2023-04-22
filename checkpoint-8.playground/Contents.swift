import Cocoa

// Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:
//
// A property storing how many rooms it has.
// A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// A property storing the name of the estate agent responsible for selling the building.
// A method for printing the sales summary of the building, describing what it is along with its other properties.


protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get set }
    var agent: String { get set }
    
    func salesSummary()
}


struct House: Building {
    let numberOfRooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print("This is a house.")
        print("It has \( self.numberOfRooms ) bedrooms.")
        print("You can buy it from \( agent ) for $\( cost )")
    }
}


struct Office: Building {
    let numberOfRooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print("This is an office building.")
        print("It has an open floor plan with space for \( self.numberOfRooms ) offices.")
        print("Contact \( agent ) for pricing details.")
    }
}



let home = House(numberOfRooms: 3, cost: 800_000, agent: "BayView Realtors")
home.salesSummary()

print()

let loft = Office(numberOfRooms: 20, cost: 8_000_000, agent: "Enterprise Sales")
loft.salesSummary()
