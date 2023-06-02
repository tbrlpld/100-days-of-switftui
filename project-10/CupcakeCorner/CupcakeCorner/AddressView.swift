//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderData: OrderData
    
    var order: Order {
        self.orderData.order
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: self.$orderData.order.name)
                TextField("Street address", text: self.$orderData.order.streetAddress)
                TextField("City", text: self.$orderData.order.city)
                TextField("Zip code", text: self.$orderData.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderData: self.orderData)
                } label: {
                    Text("Check out")
                }
                .disabled(self.order.isAddressValid() == false)
            }
        }
        .navigationTitle("Address details")
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(orderData: OrderData())
        }
    }
}
