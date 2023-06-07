//
//  AddBookView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/3/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    static let genres = [
        "Fantasy",
        "Sci-Fi",
        "Romance",
        "Horror",
        "Mystery",
        "Poetry",
    ]
    static let ratingRange = 0..<6
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = Self.genres[0]
    @State private var review = ""
    @State private var rating = 3
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: self.$title)
                    TextField("Author's name", text: self.$author)
                }
                
                Section {
                    Picker("Genre", selection: self.$genre) {
                        ForEach(Self.genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }

                Section {
                    RatingView(rating: self.$rating)
                    TextEditor(text: self.$review)
                } header: {
                    Text("Your review")
                }

                Section {
                    Button("Save", action: self.saveBook)
                }
            }
            .navigationTitle("Add book")
        }
    }

    func saveBook() {
        guard self.isDataValid() == true else {
            print("Data is not valid.")
            return
        }

        let book = Book(context: self.moc)

        book.id = UUID()
        book.title = self.title
        book.author = self.author
        book.genre = self.genre
        book.review = self.review
        book.rating = Int16(self.rating)
        book.reviewDate = Date.now

        try? self.moc.save()
        self.dismiss()
    }

    func isDataValid() -> Bool {
        if (
            self.title.isEmptyOrWhitespace
            || self.author.isEmptyOrWhitespace
            || self.genre.isEmptyOrWhitespace
            || self.review.isEmptyOrWhitespace
        ) {
            return false
        }
        return true
    }
}


extension String {
    var isEmptyOrWhitespace: Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.isEmpty
    }
}

