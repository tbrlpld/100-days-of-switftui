//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/28/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Type", selection: self.$order.type) {
                        ForEach(Order.types.indices) { index in
                            Text(Order.types[index])
                        }
                    }
                    
                    Stepper("Quantity: \(self.order.quantity)", value: self.$order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle(isOn: self.$order.enableSpecialRequests.animation()) {
                        Text("Special requests")
                    }
                    
                    if self.order.enableSpecialRequests {
                        Toggle(isOn: self.$order.addSprinkles) {
                            Text("Add sprinkles")
                        }
                        Toggle(isOn: self.$order.extraFrosting) {
                            Text("Extra frosting")
                        }
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: self.order)
                    } label: {
                        Text("Delievery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
