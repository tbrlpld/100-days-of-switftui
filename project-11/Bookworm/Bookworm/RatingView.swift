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
            ForEach(0..<self.maximumRating + 1, id: \.self) { number in
                self.getImage(currentRating: number)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }

    func getImage(currentRating: Int) -> some View {
        if currentRating <= self.rating {
            var image = self.onImage
            var result = image.foregroundColor(self.onColor)
            return result
        } else {
            var image = self.offImage ?? self.onImage
            var result = image.foregroundColor(self.offColor)
            return result
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
