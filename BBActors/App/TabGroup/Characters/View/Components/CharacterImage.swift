//
//  CharacterImage.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import SwiftUI

struct CharacterImage: View {
    let imageURL: String
    // to know the screen size:
    let size: CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .cornerRadius(8)
                    .frame(width: size ,height: size)
            } placeholder: {
                Rectangle()
                    .fill(Color.secondary.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        ProgressView()
                            .tint(.secondary)
                    )
                    .frame(width: size ,height: size)
            }
        } else {
            Image(systemName: "person.fill")
                .resizable()
                .padding(32)
                .background(colorScheme == .light ? .white : .black)
                .foregroundColor(colorScheme == .light ? .black : .white)
                .cornerRadius(8)
                .frame(width: size ,height: size)
                .opacity(0.5)
        }
    }
}

struct CharacterImage_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImage(imageURL: "", size: UIScreen.main.bounds.size.width / 4)
    }
}
