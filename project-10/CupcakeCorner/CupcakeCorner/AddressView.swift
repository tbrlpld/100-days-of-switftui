//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: self.$order.name)
                TextField("Street address", text: self.$order.streetAddress)
                TextField("City", text: self.$order.city)
                TextField("Zip code", text: self.$order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: self.order)
                } label: {
                    Text("Check out")
                }
//                .disabled(self.order.isAddressValid() == false)
            }
        }
        .navigationTitle("Address details")
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
