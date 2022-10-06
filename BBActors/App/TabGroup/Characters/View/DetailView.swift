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
            Color.black
            if !characterModel.img.isEmpty {
                CharacterImage(imageURL: characterModel.img, size: size.height)
                    .overlay(.ultraThinMaterial.opacity(0.6))
            }
            Color.black.opacity(0.4)
                .frame(height: size.height / 2.8)
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
                .background(.ultraThinMaterial.opacity(0.5))
                .cornerRadius(8)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(characterModel: CharacterModel())
    }
}
