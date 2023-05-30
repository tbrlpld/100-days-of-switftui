//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
            }
            .frame(height: 233)
            
            Text("Order total: \(self.order.cost, format: .currency(code: "USD"))")
                .font(.headline)
                .padding(.bottom, 20)
            
            Button("Place order") {}
                .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Checkout")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: Order())
        }
    }
}
