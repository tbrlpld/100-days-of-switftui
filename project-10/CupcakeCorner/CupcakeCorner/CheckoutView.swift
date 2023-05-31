//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var orderConfirmationMessage = ""
    @State private var isShowingConfirmationMessage = false
    
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
            
            Button("Place order") {
                Task {
                    await self.placeOrder()
                }
            }
                .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Checkout")
        .alert("Success", isPresented: self.$isShowingConfirmationMessage) {
            Button("Ok") {}
        } message: {
            Text(self.orderConfirmationMessage)
        }
    }
    
    func placeOrder() async {
        let encoder = JSONEncoder()
        guard let encodedOrder = try? encoder.encode(self.order) else {
            print("Encoding order failed.")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            fatalError("Could generate not URL for order placement.")
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (responseData, _) = try await URLSession.shared.upload(for: request, from: encodedOrder)
            let decoder = JSONDecoder()
            let decodedOrder = try decoder.decode(Order.self, from: responseData)
            self.orderConfirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes was successfully placed."
            self.isShowingConfirmationMessage = true
        } catch {
            print("Checkout failed.")
        }
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: Order())
        }
    }
}
