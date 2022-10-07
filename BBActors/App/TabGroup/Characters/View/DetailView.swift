//
//  DetailView.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct DetailView: View {
    let characterModel: CharacterModel
    
    let size = UIScreen.main.bounds.size
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if let url = URL(string: characterModel.img) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: size.width, height: size.width * 1.5)
                            .scaledToFit()
                    } placeholder: {
                        Rectangle()
                            .fill(Color.secondary.opacity(0.2))
                            .cornerRadius(8)
                            .overlay(
                                ProgressView()
                                    .tint(.secondary)
                            )
                            .frame(width: size.width, height: size.width * 1.5)
                    }
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: size.width, height: size.width * 1.5)
                        .scaledToFit()
                        .padding(32)
                        .opacity(0.5)
                }
                Spacer()
                Spacer()
            }
            .overlay(.ultraThinMaterial.opacity(0.6))

            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .center, spacing: 12) {
                    Text(characterModel.name)
                        .font(.title)
                    Text(characterModel.nickname)
                        .font(.title3)
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(8)
                Spacer()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(characterModel: CharacterModel())
    }
}
