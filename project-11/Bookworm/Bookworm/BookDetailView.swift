//
//  BookDetailView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/4/23.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book

    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .resizable()
                        .scaledToFit()
                    Text(self.book.genre ?? "Fantasy")
                        .padding(8)
                        .foregroundColor(.white)
                        .background(.black.opacity(0.75))
                        .bold()
                        .offset(x: -5, y: -5)
                }

                Text(self.book.author ?? "n/a")
                    .font(.title2)
                    .bold()
                    .padding(.vertical)

                Text(self.book.review ?? "n/a")
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

                RatingView(rating: .constant(Int(self.book.rating)))
            }
            .padding()
        }
        .navigationTitle(self.book.title ?? "n/a")
    }
}
