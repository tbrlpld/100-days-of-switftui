//
//  RatingView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/3/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    @State private var label = ""
    @State private var maximumRating = 5
    @State private var offImage: Image?
    @State private var onImage = Image(systemName: "star.fill")
    @State private var offColor = Color(.lightGray)
    @State private var onColor = Color(.yellow)

    var body: some View {
        HStack {
            if !self.label.isEmpty {
                Text(self.label)
            }
            ForEach(1..<self.maximumRating + 1, id: \.self) { number in
                self.getImage(currentRating: number)
                    .onTapGesture {
                        if number == 1 && self.rating == 1 {
                            // If the tapped number is 1 and the rating already is at 1, we set it to zero.
                            // This allows us to represent 0 rating with really 0 active images.
                            self.rating = 0
                        } else {
                            self.rating = number
                        }
                    }
            }
        }
    }

    func getImage(currentRating: Int) -> some View {
        if currentRating <= self.rating {
            let image = self.onImage
            let result = image.foregroundColor(self.onColor)
            return result
        } else {
            let image = self.offImage ?? self.onImage
            let result = image.foregroundColor(self.offColor)
            return result
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
