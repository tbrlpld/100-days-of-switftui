//
//  ContentView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/2/23.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author),
    ]) var books: FetchedResults<Book>
    
    @State private var isShowingAddBookView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.books) { book in
                    NavigationLink {
                        BookDetailView(book: book)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.title ?? "n/a")
                                    .font(.headline)
                                Text(book.author ?? "n/a")
                                    .font(.subheadline)
                            }
                            Spacer()
                            EmojiRatingView(rating: book.rating)
                        }
                    }
                }
                .onDelete(perform: self.deleteBooks)
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.isShowingAddBookView.toggle()
                        } label: {
                                Label("Add book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: self.$isShowingAddBookView) {
                    AddBookView()
                }
        }
    }

    func deleteBooks(at offsets: IndexSet) {
        for index in offsets {
            let book = self.books[index]
            print("Deleting \(book.title ?? "n/a")")

            self.moc.delete(book)
        }

        try? self.moc.save()
    }
}

