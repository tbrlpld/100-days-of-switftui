//
//  ContentView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/2/23.
//

import SwiftUI


struct ContentView: View {
    // Load data from the data store. The empty sort descriptor means items are randomly sorted.
    // The Student class is automatically generated from the data model entity.
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    // Write data to the with the managed object that we get from the environment.
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            List(self.students) { student in
                Text(student.name ?? "n/a")
            }
            Button("Add student") {
                let firstNames = ["Harry", "Ron", "Hermoine", "Luna", "Ginny"]
                let lastNames = ["Potter", "Weasley", "Granger", "Lovegood"]
                
                // Using ! here because we know the arrays are not empty we just defined them above
                let firstName = firstNames.randomElement()!
                let lastName = lastNames.randomElement()!
                
                // Pass the managed context object to which the entity should be saved.
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(firstName) \(lastName)"
                
                // Commit the new changes that are written to this managed object context.
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
