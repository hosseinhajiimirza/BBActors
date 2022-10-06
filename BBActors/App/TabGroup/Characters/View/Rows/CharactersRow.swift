//
//  CharactersRow.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import SwiftUI

struct CharactersRow: View {
    let characterModel: CharacterModel
    
    var statusColor: Color {
        switch characterModel.status {
        case .alive:
            return .green
        case .deceased:
            return .red
        case .presumedDead:
            return .orange
        case .unknown:
            return .secondary
        }
    }
    
    private let width = UIScreen.main.bounds.width
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CharacterImage(imageURL: characterModel.img, size: UIScreen.main.bounds.size.width / 4)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .trim(from: 0.4, to: 0.75)
                        .stroke(LinearGradient(colors: [
                            statusColor,
                            statusColor,
                            statusColor.opacity(0.5),
                            statusColor.opacity(0.5),
                            statusColor,
                            statusColor,
                            statusColor.opacity(0.5),
                        ],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing),
                                style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        .padding(-6)
                )
            VStack(alignment: .leading, spacing: 12) {
                if !characterModel.name.isEmpty {
                    HStack(alignment: .top, spacing: 8) {
                        Text("Name:")
                            .foregroundColor(.secondary)
                        Text(characterModel.name)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    .font(.body)
                }
                
                if !characterModel.nickname.isEmpty {
                    HStack(alignment: .top, spacing: 8)  {
                        Text("Nickname:")
                            .foregroundColor(.secondary)
                        Text(characterModel.nickname)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    .font(.callout)
                }
                
                if !characterModel.birthday.isEmpty {
                    HStack(alignment: .center, spacing: 6)  {
                        Text("Birthday:")
                            .foregroundColor(.secondary)
                        Text(characterModel.birthday)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    .font(.footnote)
                }
            }
            Spacer(minLength: 0)
        }
        .foregroundColor(colorScheme == .light ? .black : .white)
        .padding(24)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        CharactersRow(characterModel: CharacterModel())
            .preferredColorScheme(.dark)
    }
}
