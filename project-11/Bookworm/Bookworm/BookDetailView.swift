//
//  BookDetailView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/4/23.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book

    @State private var isShowingDeleteAlert = false

    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dimiss

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
                    .padding(.bottom)

                if let date = self.book.reviewDate {
                    Text("Reviewed")
                    Text(date.formatted(date: .long, time: .omitted))
                        .font(.subheadline)
                }
            }
            .padding()
        }
        .navigationTitle(self.book.title ?? "n/a")
        .toolbar {
            Button {
                self.isShowingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
                    .foregroundColor(.red)
            }
        }
        .alert("Delete book", isPresented: self.$isShowingDeleteAlert) {
            Button("Delete", role: .destructive, action: self.deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete \"\(self.book.title ?? "n/a")\"?")
        }
    }

    func deleteBook() {
        self.moc.delete(self.book)

        try? self.moc.save()
    
        self.dimiss()
    }
}
