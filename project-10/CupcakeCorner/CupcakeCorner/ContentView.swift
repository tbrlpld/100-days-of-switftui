//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/28/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var orderData = OrderData()
    
    var order: Order {
        self.orderData.order
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Type", selection: self.$orderData.order.type) {
                        ForEach(Order.types.indices, id: \.self) { index in
                            Text(Order.types[index])
                        }
                    }
                    
                    Stepper("Quantity: \(self.order.quantity)", value: self.$orderData.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle(isOn: self.$orderData.order.enableSpecialRequests.animation()) {
                        Text("Special requests")
                    }
                    
                    if self.order.enableSpecialRequests {
                        Toggle(isOn: self.$orderData.order.addSprinkles) {
                            Text("Add sprinkles")
                        }
                        Toggle(isOn: self.$orderData.order.extraFrosting) {
                            Text("Extra frosting")
                        }
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(orderData: self.orderData)
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
