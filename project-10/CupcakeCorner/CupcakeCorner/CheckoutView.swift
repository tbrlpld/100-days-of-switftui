//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var orderData: OrderData
    
    var order: Order {
        self.orderData.order
    }
    
    @State private var orderSubmissionResponseMessage = ""
    @State private var orderSubmissionResponseTitle = ""
    @State private var isShowingOrderSubmissionResponse = false
    
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
        .alert(self.orderSubmissionResponseTitle, isPresented: self.$isShowingOrderSubmissionResponse) {
            Button("Ok") {}
        } message: {
            Text(self.orderSubmissionResponseMessage)
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
        
        // Randomness to simulate a flaky connection. Requests that are not POST will fail.
        if Bool.random() {
            request.httpMethod = "POST"
        }
        
        do {
            let (responseData, _) = try await URLSession.shared.upload(for: request, from: encodedOrder)
            let decoder = JSONDecoder()
            let decodedOrder = try decoder.decode(Order.self, from: responseData)
            self.orderSubmissionResponseTitle = "Success"
            self.orderSubmissionResponseMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes was successfully placed."
            self.isShowingOrderSubmissionResponse = true
        } catch {
            self.orderSubmissionResponseTitle = "Error"
            self.orderSubmissionResponseMessage = "Sorry, something went wrong when we tried to place your order. Please try again."
            self.isShowingOrderSubmissionResponse = true
        }
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(orderData: OrderData())
        }
    }
}
