//
//  ContentView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/2/23.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var isShowingAddBookView = false
    
    var body: some View {
        NavigationStack {
            List(self.books) { book in
                NavigationLink {
                    Text("Hello")
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
                .navigationTitle("Bookworm")
                .toolbar {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
